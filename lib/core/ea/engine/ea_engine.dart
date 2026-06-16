// Path: lib/core/ea/engine/ea_engine.dart
import 'dart:async';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../domain/enums/trading_enums.dart';
import 'package:rxdart/rxdart.dart';
import '../../domain/entities/ea_instance_entity.dart';
import '../../domain/entities/tick_entity.dart';
import '../../domain/entities/candle_entity.dart';
import 'python_bridge.dart';
import '../models/ea_config.dart';

class EaEngine {
  final PythonBridge _bridge;
  final Map<String, EaInstanceEntity> _instances = {};
  final BehaviorSubject<Map<String, EaInstanceEntity>> _instancesController =
      BehaviorSubject.seeded({});

  EaEngine(this._bridge);

  Stream<Map<String, EaInstanceEntity>> get instancesStream =>
      _instancesController.stream;

  Future<void> initialize() async {
    await _bridge.initialize();
  }

  Future<void> loadEa(String eaId, String scriptPath, EaConfig config) async {
    final success = await _bridge.loadScript(eaId, scriptPath, config.toJson());
    if (success) {
      _instances[eaId] = EaInstanceEntity(
        id: eaId,
        name: config.name,
        description: '',
        scriptPath: scriptPath,
        symbol: config.symbol,
        timeframe: config.timeframe,
        magicNumber: config.magicNumber,
        params: config.parameters,
        status: EaStatus.stopped,
        lastTickTimeUs: 0,
        dailyProfitLimit: 0,
        dailyLossLimit: 0,
        maxDrawdownPct: 0,
        isAutoStart: false,
      );
      _updateInstances();
    }
  }

  Future<void> startEa(String eaId) async {
    if (_instances.containsKey(eaId)) {
      final success = await _bridge.startEa(eaId);
      if (success) {
        _instances[eaId] = _instances[eaId]!.copyWith(status: EaStatus.running);
        _updateInstances();
      }
    }
  }

  Future<void> stopEa(String eaId) async {
    if (_instances.containsKey(eaId)) {
      await _bridge.stopEa(eaId);
      _instances[eaId] = _instances[eaId]!.copyWith(status: EaStatus.stopped);
      _updateInstances();
    }
  }

  Future<void> onTick(TickEntity tick) async {
    for (final ea in _instances.values
        .where((e) => e.isRunning && e.symbol == tick.symbol)) {
      await _bridge.sendTick(ea.id, tick.bid, tick.ask, tick.timestamp);
      _instances[ea.id] = ea.copyWith(lastTickTimeUs: tick.timestamp);
    }
    _updateInstances();
  }

  Future<void> onCandleClosed(CandleEntity candle) async {
    for (final ea in _instances.values.where((e) =>
        e.isRunning &&
        e.symbol == candle.symbol &&
        e.timeframe == candle.timeframe)) {
      await _bridge.sendCandle(ea.id, candle.open, candle.high, candle.low,
          candle.close, candle.tickVolume, candle.openTimeUs);
    }
  }

  void _updateInstances() {
    _instancesController.add(Map.from(_instances));
  }

  void dispose() {
    _instancesController.close();
  }
}

final eaEngineProvider = Provider<EaEngine>((ref) {
  final bridge = ref.watch(pythonBridgeProvider);
  final engine = EaEngine(bridge);
  ref.onDispose(() => engine.dispose());
  return engine;
});
