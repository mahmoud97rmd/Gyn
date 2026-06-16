// Path: lib/core/streaming/candle_builder.dart
import 'dart:async';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../domain/entities/candle_entity.dart';
import '../domain/entities/tick_entity.dart';
import '../domain/enums/trading_enums.dart';

class CandleBuilder {
  final Map<String, Map<Timeframe, CandleEntity>> _currentCandles = {};
  final StreamController<CandleEntity> _candleController =
      StreamController.broadcast();

  Stream<CandleEntity> get candleStream => _candleController.stream;

  void processTick(TickEntity tick, List<Timeframe> timeframes) {
    for (final tf in timeframes) {
      _updateCandle(tick, tf);
    }
  }

  void _updateCandle(TickEntity tick, Timeframe tf) {
    final symbol = tick.symbol;
    final tickPrice = tick.bid; // Using bid for candle formation
    final timestamp = tick.timestamp;

    final candleOpenTime = _getCandleOpenTime(timestamp, tf);

    _currentCandles.putIfAbsent(symbol, () => {});

    var currentCandle = _currentCandles[symbol]![tf];

    if (currentCandle == null || currentCandle.openTimeUs < candleOpenTime) {
      if (currentCandle != null) {
        // Emit closed candle
        _candleController.add(currentCandle.copyWith(isComplete: true));
      }

      // Start new candle
      currentCandle = CandleEntity(
        symbol: symbol,
        timeframe: tf,
        open: tickPrice,
        high: tickPrice,
        low: tickPrice,
        close: tickPrice,
        tickVolume: 1,
        openTimeUs: candleOpenTime,
        isComplete: false,
      );
    } else {
      // Update existing candle
      currentCandle = CandleEntity(
        symbol: symbol,
        timeframe: tf,
        open: currentCandle!.open,
        high: tickPrice > currentCandle.high ? tickPrice : currentCandle.high,
        low: tickPrice < currentCandle.low ? tickPrice : currentCandle.low,
        close: tickPrice,
        tickVolume: currentCandle.tickVolume + 1,
        openTimeUs: currentCandle.openTimeUs,
        isComplete: false,
      );
    }

    _currentCandles[symbol]![tf] = currentCandle;
    _candleController.add(currentCandle);
  }

  int _getCandleOpenTime(int timestampUs, Timeframe tf) {
    final dt = DateTime.fromMicrosecondsSinceEpoch(timestampUs, isUtc: true);

    DateTime start;
    switch (tf) {
      case Timeframe.m1:
        start = DateTime.utc(dt.year, dt.month, dt.day, dt.hour, dt.minute);
        break;
      case Timeframe.m5:
        start = DateTime.utc(
            dt.year, dt.month, dt.day, dt.hour, (dt.minute ~/ 5) * 5);
        break;
      case Timeframe.m10:
        start = DateTime.utc(
            dt.year, dt.month, dt.day, dt.hour, (dt.minute ~/ 10) * 10);
        break;
      case Timeframe.m15:
        start = DateTime.utc(
            dt.year, dt.month, dt.day, dt.hour, (dt.minute ~/ 15) * 15);
        break;
      case Timeframe.m30:
        start = DateTime.utc(
            dt.year, dt.month, dt.day, dt.hour, (dt.minute ~/ 30) * 30);
        break;
      case Timeframe.h1:
        start = DateTime.utc(dt.year, dt.month, dt.day, dt.hour);
        break;
      case Timeframe.h2:
        start = DateTime.utc(dt.year, dt.month, dt.day, (dt.hour ~/ 2) * 2);
        break;
      case Timeframe.h4:
        start = DateTime.utc(dt.year, dt.month, dt.day, (dt.hour ~/ 4) * 4);
        break;
      case Timeframe.h6:
        start = DateTime.utc(dt.year, dt.month, dt.day, (dt.hour ~/ 6) * 6);
        break;
      case Timeframe.h8:
        start = DateTime.utc(dt.year, dt.month, dt.day, (dt.hour ~/ 8) * 8);
        break;
      case Timeframe.h12:
        start = DateTime.utc(dt.year, dt.month, dt.day, (dt.hour ~/ 12) * 12);
        break;
      case Timeframe.d1:
        start = DateTime.utc(dt.year, dt.month, dt.day);
        break;
      case Timeframe.w1:
        final diff = dt.weekday - DateTime.monday;
        start = DateTime.utc(dt.year, dt.month, dt.day)
            .subtract(Duration(days: diff));
        break;
      case Timeframe.mn:
        start = DateTime.utc(dt.year, dt.month, 1);
        break;
    }
    return start.microsecondsSinceEpoch;
  }

  void dispose() {
    _candleController.close();
  }
}

final candleBuilderProvider = Provider<CandleBuilder>((ref) {
  final builder = CandleBuilder();
  ref.onDispose(() => builder.dispose());
  return builder;
});
