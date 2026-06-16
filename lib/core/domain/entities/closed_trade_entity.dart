// Path: lib/core/domain/entities/closed_trade_entity.dart
import 'package:equatable/equatable.dart';
import '../enums/trading_enums.dart';

class ClosedTradeEntity extends Equatable {
  final String oandaTradeId;
  final String symbol;
  final TradeDirection direction;
  final double lots;
  final double units;
  final double openPrice;
  final double closePrice;
  final double realizedPnl;
  final double netProfit;
  final double swap;
  final double commission;
  final CloseReason closeReason;
  final int openTimeUs;
  final int closeTimeUs;
  final int magicNumber;

  const ClosedTradeEntity({
    required this.oandaTradeId,
    required this.symbol,
    required this.direction,
    required this.lots,
    required this.units,
    required this.openPrice,
    required this.closePrice,
    required this.realizedPnl,
    required this.netProfit,
    required this.swap,
    required this.commission,
    required this.closeReason,
    required this.openTimeUs,
    required this.closeTimeUs,
    required this.magicNumber,
  });

  bool get isWin => netProfit > 0;
  Duration get holdingDuration =>
      DateTime.fromMicrosecondsSinceEpoch(closeTimeUs)
          .difference(DateTime.fromMicrosecondsSinceEpoch(openTimeUs));
  String get holdingDurationDisplay {
    final d = holdingDuration;
    if (d.inDays > 0) return '${d.inDays}d ${d.inHours.remainder(24)}h';
    if (d.inHours > 0) return '${d.inHours}h ${d.inMinutes.remainder(60)}m';
    if (d.inMinutes > 0) return '${d.inMinutes}m ${d.inSeconds.remainder(60)}s';
    return '${d.inSeconds}s';
  }

  bool get wasClosedBySl => closeReason == CloseReason.stopLoss;
  bool get wasEaTrade => magicNumber != 0;

  @override
  List<Object> get props => [oandaTradeId, netProfit];
}
