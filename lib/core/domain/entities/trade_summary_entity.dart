// Path: lib/core/domain/entities/trade_summary_entity.dart
import 'package:equatable/equatable.dart';

class TradeSummaryEntity extends Equatable {
  final double netPnl;
  final int totalTrades;
  final int winCount;
  final int lossCount;
  final double profitFactor;
  final double maxDrawdown;

  const TradeSummaryEntity({
    required this.netPnl,
    required this.totalTrades,
    required this.winCount,
    required this.lossCount,
    required this.profitFactor,
    required this.maxDrawdown,
  });

  double get winRate => totalTrades > 0 ? (winCount / totalTrades) : 0;

  @override
  List<Object> get props => [netPnl, totalTrades];
}

class DailyPnlEntity extends Equatable {
  final DateTime date;
  final double realizedPnl;

  const DailyPnlEntity({required this.date, required this.realizedPnl});

  @override
  List<Object> get props => [date, realizedPnl];
}
