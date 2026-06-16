// Path: lib/core/domain/entities/tick_entity.dart
import 'package:equatable/equatable.dart';

class TickEntity extends Equatable {
  final String symbol;
  final double bid;
  final double ask;
  final double spread;
  final double spreadPips;
  final double dailyHigh;
  final double dailyLow;
  final int timestamp;
  final bool isLive;

  const TickEntity({
    required this.symbol,
    required this.bid,
    required this.ask,
    required this.spread,
    required this.spreadPips,
    required this.dailyHigh,
    required this.dailyLow,
    required this.timestamp,
    required this.isLive,
  });

  double get mid => (bid + ask) / 2;
  double get buyPrice => ask;
  double get sellPrice => bid;

  TickEntity copyWith({
    String? symbol,
    double? bid,
    double? ask,
    double? spread,
    double? spreadPips,
    double? dailyHigh,
    double? dailyLow,
    int? timestamp,
    bool? isLive,
  }) {
    return TickEntity(
      symbol: symbol ?? this.symbol,
      bid: bid ?? this.bid,
      ask: ask ?? this.ask,
      spread: spread ?? this.spread,
      spreadPips: spreadPips ?? this.spreadPips,
      dailyHigh: dailyHigh ?? this.dailyHigh,
      dailyLow: dailyLow ?? this.dailyLow,
      timestamp: timestamp ?? this.timestamp,
      isLive: isLive ?? this.isLive,
    );
  }

  @override
  List<Object> get props => [symbol, bid, ask, timestamp];
}
