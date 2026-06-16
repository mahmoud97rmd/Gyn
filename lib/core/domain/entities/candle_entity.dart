// Path: lib/core/domain/entities/candle_entity.dart
import 'package:equatable/equatable.dart';
import '../enums/trading_enums.dart';

class CandleEntity extends Equatable {
  final String symbol;
  final Timeframe timeframe;
  final double open;
  final double high;
  final double low;
  final double close;
  final int tickVolume;
  final int openTimeUs;
  final bool isComplete;

  const CandleEntity({
    required this.symbol,
    required this.timeframe,
    required this.open,
    required this.high,
    required this.low,
    required this.close,
    required this.tickVolume,
    required this.openTimeUs,
    required this.isComplete,
  });

  CandleColor get color => CandleColor.fromOHLC(open, close);
  bool get isBullish => close >= open;
  double get body => (close - open).abs();
  double get upperShadow => high - (isBullish ? close : open);
  double get lowerShadow => (isBullish ? open : close) - low;
  double get range => high - low;
  double get mid => (high + low) / 2;
  bool get isDoji => body <= (range * 0.1);
  bool get isHammer => lowerShadow > (body * 2) && upperShadow < (range * 0.1);
  double get typicalPrice => (high + low + close) / 3;

  CandleEntity copyWithClose(double newClose, double newHigh, double newLow,
      int newTickVolume, bool newIsComplete) {
    return CandleEntity(
      symbol: symbol,
      timeframe: timeframe,
      open: open,
      high: newHigh > high ? newHigh : high,
      low: newLow < low ? newLow : low,
      close: newClose,
      tickVolume: newTickVolume,
      openTimeUs: openTimeUs,
      isComplete: newIsComplete,
    );
  }

  CandleEntity copyWith({bool? isComplete}) {
    return CandleEntity(
      symbol: symbol,
      timeframe: timeframe,
      open: open,
      high: high,
      low: low,
      close: close,
      tickVolume: tickVolume,
      openTimeUs: openTimeUs,
      isComplete: isComplete ?? this.isComplete,
    );
  }

  @override
  List<Object> get props => [symbol, timeframe, openTimeUs, close, tickVolume];
}
