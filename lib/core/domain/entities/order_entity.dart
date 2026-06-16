// Path: lib/core/domain/entities/order_entity.dart
import 'package:equatable/equatable.dart';
import '../enums/trading_enums.dart';

class OrderEntity extends Equatable {
  final String id;
  final String oandaOrderId;
  final String symbol;
  final OrderType orderType;
  final TradeDirection direction;
  final double lots;
  final double units;
  final double price;
  final double? stopLoss;
  final double? takeProfit;
  final int? expiryTimeUs;
  final OrderStatus status;
  final int createTimeUs;
  final double? distanceFromMarket;

  const OrderEntity({
    required this.id,
    required this.oandaOrderId,
    required this.symbol,
    required this.orderType,
    required this.direction,
    required this.lots,
    required this.units,
    required this.price,
    this.stopLoss,
    this.takeProfit,
    this.expiryTimeUs,
    required this.status,
    required this.createTimeUs,
    this.distanceFromMarket,
  });

  bool get isPending => orderType.isPending;
  bool get isExpired =>
      expiryTimeUs != null &&
      DateTime.now().microsecondsSinceEpoch > expiryTimeUs!;

  OrderEntity copyWith({
    OrderStatus? status,
    double? distanceFromMarket,
  }) {
    return OrderEntity(
      id: id,
      oandaOrderId: oandaOrderId,
      symbol: symbol,
      orderType: orderType,
      direction: direction,
      lots: lots,
      units: units,
      price: price,
      stopLoss: stopLoss,
      takeProfit: takeProfit,
      expiryTimeUs: expiryTimeUs,
      status: status ?? this.status,
      createTimeUs: createTimeUs,
      distanceFromMarket: distanceFromMarket ?? this.distanceFromMarket,
    );
  }

  @override
  List<Object?> get props => [oandaOrderId, status, distanceFromMarket];
}
