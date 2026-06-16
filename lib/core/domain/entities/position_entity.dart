// Path: lib/core/domain/entities/position_entity.dart
import 'package:equatable/equatable.dart';
import '../enums/trading_enums.dart';

class PositionEntity extends Equatable {
  final String id;
  final String oandaTradeId;
  final String symbol;
  final TradeDirection direction;
  final double lots;
  final double units;
  final double openPrice;
  final double currentPrice;
  final double? stopLoss;
  final double? takeProfit;
  final double floatingPnl;
  final double swap;
  final double commission;
  final double marginUsed;
  final int openTimeUs;
  final int magicNumber;
  final String comment;

  const PositionEntity({
    required this.id,
    required this.oandaTradeId,
    required this.symbol,
    required this.direction,
    required this.lots,
    required this.units,
    required this.openPrice,
    required this.currentPrice,
    this.stopLoss,
    this.takeProfit,
    required this.floatingPnl,
    required this.swap,
    required this.commission,
    required this.marginUsed,
    required this.openTimeUs,
    required this.magicNumber,
    required this.comment,
  });

  double get netFloatingPnl => floatingPnl + swap + commission;
  bool get isProfit => netFloatingPnl > 0;
  double get priceDistance => (currentPrice - openPrice).abs();
  Duration get holdingDuration => DateTime.now()
      .difference(DateTime.fromMicrosecondsSinceEpoch(openTimeUs));

  PositionEntity withUpdatedPrice(double newPrice, double newPnl) {
    return PositionEntity(
      id: id,
      oandaTradeId: oandaTradeId,
      symbol: symbol,
      direction: direction,
      lots: lots,
      units: units,
      openPrice: openPrice,
      currentPrice: newPrice,
      stopLoss: stopLoss,
      takeProfit: takeProfit,
      floatingPnl: newPnl,
      swap: swap,
      commission: commission,
      marginUsed: marginUsed,
      openTimeUs: openTimeUs,
      magicNumber: magicNumber,
      comment: comment,
    );
  }

  PositionEntity withModifiedSlTp(double? sl, double? tp) {
    return PositionEntity(
      id: id,
      oandaTradeId: oandaTradeId,
      symbol: symbol,
      direction: direction,
      lots: lots,
      units: units,
      openPrice: openPrice,
      currentPrice: currentPrice,
      stopLoss: sl,
      takeProfit: tp,
      floatingPnl: floatingPnl,
      swap: swap,
      commission: commission,
      marginUsed: marginUsed,
      openTimeUs: openTimeUs,
      magicNumber: magicNumber,
      comment: comment,
    );
  }

  @override
  List<Object?> get props =>
      [oandaTradeId, currentPrice, floatingPnl, stopLoss, takeProfit];
}
