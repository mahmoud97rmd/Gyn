// Path: lib/features/quotes/data/repositories/price_repository_impl.dart
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/domain/entities/tick_entity.dart';
import '../../../../core/domain/repositories/repositories.dart';
import '../../../../core/database/daos/ticks_dao.dart';
import '../../../../core/database/database_providers.dart';
import '../../../../core/database/hive_cache_service.dart';
import '../datasources/oanda_streaming_service.dart';

class PriceRepositoryImpl implements IPriceRepository {
  final OandaStreamingService _streamingService;
  final TicksDao _ticksDao;
  final HiveCacheService _hiveCache;

  PriceRepositoryImpl(this._streamingService, this._ticksDao, this._hiveCache);

  @override
  Stream<TickEntity> watchTick(String symbol) {
    return _streamingService.watchSymbol(symbol);
  }

  @override
  TickEntity? getCachedTick(String symbol) {
    final sTick = _streamingService.getLatestTick(symbol);
    if (sTick != null) return sTick;

    final cached = _hiveCache.getLatestTick(symbol);
    if (cached != null) {
      return TickEntity(
          symbol: symbol,
          bid: cached['bid'],
          ask: cached['ask'],
          spread: 0,
          spreadPips: 0,
          dailyHigh: 0,
          dailyLow: 0,
          timestamp: cached['timestampUs'],
          isLive: false);
    }
    return null;
  }

  @override
  Future<List<TickEntity>> getTickHistory(
      String symbol, DateTime from, DateTime to) async {
    final data = await _ticksDao.getTicksInRange(
        symbol, from.microsecondsSinceEpoch, to.microsecondsSinceEpoch);
    return data
        .map((t) => TickEntity(
            symbol: t.symbol,
            bid: t.bid,
            ask: t.ask,
            spread: t.spread,
            spreadPips: t.spreadPips,
            dailyHigh: t.dailyHigh,
            dailyLow: t.dailyLow,
            timestamp: t.timestampUs,
            isLive: t.isLive))
        .toList();
  }

  @override
  Future<void> startStreaming(List<String> symbols) async {
    await _streamingService.connect(symbols);
  }

  @override
  Future<void> stopStreaming() async {
    _streamingService.disconnect();
  }

  @override
  bool get isStreaming => _streamingService.isConnected;

  @override
  Stream<String> get streamConnectionState =>
      _streamingService.connectionState.map((s) => s.displayName);
}

final priceRepositoryProvider = Provider<IPriceRepository>((ref) {
  final service = ref.watch(oandaStreamingServiceProvider);
  final dao = ref.watch(appDatabaseProvider).ticksDao;
  final cache = HiveCacheService();
  return PriceRepositoryImpl(service, dao, cache);
});
