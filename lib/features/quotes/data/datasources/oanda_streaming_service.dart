// Path: lib/features/quotes/data/datasources/oanda_streaming_service.dart
import 'dart:async';
import 'dart:math';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rxdart/rxdart.dart';
import 'package:drift/drift.dart';
import '../../../../core/network/api_constants.dart';
import '../../../../core/network/client/dio_client.dart';
import '../../../../core/security/credential_storage.dart';
import '../../../../core/database/daos/ticks_dao.dart';
import '../../../../core/database/database_providers.dart';
import '../../../../core/database/hive_cache_service.dart';
import '../../../../core/database/app_database.dart';
import '../../../../core/domain/entities/tick_entity.dart';
import 'stream_parser.dart';
import '../models/stream_dto.dart';

class OandaStreamingService {
  final Dio _dio;
  final CredentialStorage _storage;
  final TicksDao _ticksDao;
  final HiveCacheService _hiveCache;

  final BehaviorSubject<StreamConnectionState> _connectionState =
      BehaviorSubject.seeded(StreamConnectionState.disconnected);
  final BehaviorSubject<TickEntity> _tickController = BehaviorSubject();
  final Map<String, BehaviorSubject<TickEntity>> _symbolSubjects = {};

  final OandaStreamParser _parser = OandaStreamParser();
  final TickAssembler _assembler = TickAssembler();

  StreamSubscription? _streamSub;
  Timer? _heartbeatMonitor;
  DateTime _lastHeartbeat = DateTime.now();
  int _reconnectAttempts = 0;
  List<String> _subscribedSymbols = [];
  bool _isKilled = false;

  OandaStreamingService(
      this._dio, this._storage, this._ticksDao, this._hiveCache);

  Stream<StreamConnectionState> get connectionState => _connectionState.stream;
  Stream<TickEntity> get tickStream => _tickController.stream;
  StreamConnectionState get currentState => _connectionState.value;
  bool get isConnected => currentState.isConnected;

  Stream<TickEntity> watchSymbol(String symbol) {
    if (!_symbolSubjects.containsKey(symbol)) {
      _symbolSubjects[symbol] = BehaviorSubject<TickEntity>();
      final cached = _hiveCache.getLatestTick(symbol);
      if (cached != null) {
        _symbolSubjects[symbol]!.add(TickEntity(
          symbol: symbol,
          bid: cached['bid'] as double,
          ask: cached['ask'] as double,
          timestamp: cached['timestampUs'] as int,
          spread: 0,
          spreadPips: 0,
          dailyHigh: 0,
          dailyLow: 0,
          isLive: false,
        ));
      }
    }
    return _symbolSubjects[symbol]!.stream;
  }

  TickEntity? getLatestTick(String symbol) {
    if (_symbolSubjects.containsKey(symbol) &&
        _symbolSubjects[symbol]!.hasValue) {
      return _symbolSubjects[symbol]!.value;
    }
    final cached = _hiveCache.getLatestTick(symbol);
    if (cached != null) {
      return TickEntity(
        symbol: symbol,
        bid: cached['bid'] as double,
        ask: cached['ask'] as double,
        timestamp: cached['timestampUs'] as int,
        spread: 0,
        spreadPips: 0,
        dailyHigh: 0,
        dailyLow: 0,
        isLive: false,
      );
    }
    return null;
  }

  Future<void> connect(List<String> symbols) async {
    if (symbols.isEmpty || _isKilled) return;
    _subscribedSymbols = symbols;
    await _openStream();
  }

  Future<void> _openStream() async {
    if (currentState.isActive &&
        currentState != StreamConnectionState.reconnecting) return;

    _cleanupConnection();
    _connectionState.add(StreamConnectionState.connecting);

    try {
      final accountId = await _storage.getAccountId();
      final response = await _dio.get<ResponseBody>(
        ApiConstants.pricing(accountId!),
        queryParameters: {'instruments': _subscribedSymbols.join(',')},
        options: Options(responseType: ResponseType.stream),
      );

      _connectionState.add(StreamConnectionState.connected);
      _reconnectAttempts = 0;
      _lastHeartbeat = DateTime.now();

      _startHeartbeatMonitor();

      _streamSub = response.data!.stream
          .cast<List<int>>()
          .transform(_parser.transformer)
          .listen(_onStreamMessage, onError: (e) {
        _scheduleReconnect();
      }, onDone: () {
        _scheduleReconnect();
      });
    } catch (e) {
      _scheduleReconnect();
    }
  }

  void _onStreamMessage(StreamMessageDto msg) {
    if (msg is StreamHeartbeatDto) {
      _lastHeartbeat = DateTime.now();
    } else if (msg is StreamPriceDto) {
      _lastHeartbeat = DateTime.now();
      final tick = _assembler.assemble(msg);
      _dispatchTick(tick);
    }
  }

  void _dispatchTick(TickEntity tick) {
    _tickController.add(tick);
    if (_symbolSubjects.containsKey(tick.symbol)) {
      _symbolSubjects[tick.symbol]!.add(tick);
    }
    _hiveCache.cacheLatestTick(tick.symbol, tick.bid, tick.ask, tick.timestamp);

    _ticksDao.insertTick(TicksTableCompanion.insert(
      symbol: tick.symbol,
      bid: tick.bid,
      ask: tick.ask,
      spread: tick.spread,
      spreadPips: tick.spreadPips,
      dailyHigh: tick.dailyHigh,
      dailyLow: tick.dailyLow,
      timestampUs: tick.timestamp,
      oandaTimestamp: tick.timestamp,
      isLive: Value(tick.isLive),
    ));
  }

  void _startHeartbeatMonitor() {
    _heartbeatMonitor?.cancel();
    _heartbeatMonitor = Timer.periodic(const Duration(seconds: 5), (timer) {
      if (DateTime.now().difference(_lastHeartbeat).inSeconds > 15) {
        _scheduleReconnect();
      }
    });
  }

  void _scheduleReconnect() {
    _cleanupConnection();
    if (_reconnectAttempts >= 20 || _isKilled) {
      kill('Max reconnects reached');
      return;
    }

    _connectionState.add(StreamConnectionState.reconnecting);
    final delay = min(60, pow(2, _reconnectAttempts).toInt());
    _reconnectAttempts++;

    Timer(Duration(seconds: delay), () {
      if (!_isKilled) _openStream();
    });
  }

  void updatePipLocation(String symbol, int pipLocation) {
    _assembler.updatePipLocation(symbol, pipLocation);
  }

  void disconnect() {
    _cleanupConnection();
    _connectionState.add(StreamConnectionState.disconnected);
  }

  void kill(String reason) {
    _isKilled = true;
    _cleanupConnection();
    _connectionState.add(StreamConnectionState.killed);
  }

  void _cleanupConnection() {
    _streamSub?.cancel();
    _streamSub = null;
    _heartbeatMonitor?.cancel();
    _heartbeatMonitor = null;
    _parser.reset();
  }

  void dispose() {
    _cleanupConnection();
    _connectionState.close();
    _tickController.close();
    for (var sub in _symbolSubjects.values) {
      sub.close();
    }
  }
}

final oandaStreamingServiceProvider = Provider<OandaStreamingService>((ref) {
  final dio = ref.watch(streamingDioProvider);
  final storage = ref.watch(credentialStorageProvider);
  final dao = ref.watch(appDatabaseProvider).ticksDao;
  final cache = HiveCacheService();
  return OandaStreamingService(dio, storage, dao, cache);
});
