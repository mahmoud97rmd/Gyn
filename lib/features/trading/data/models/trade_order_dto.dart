// Path: lib/features/trading/data/models/trade_order_dto.dart
import 'package:json_annotation/json_annotation.dart';

part 'trade_order_dto.g.dart';

@JsonSerializable(createToJson: false)
class OpenTradesResponseDto {
  final List<TradeDto> trades;
  OpenTradesResponseDto({required this.trades});
  factory OpenTradesResponseDto.fromJson(Map<String, dynamic> json) =>
      _$OpenTradesResponseDtoFromJson(json);
}

@JsonSerializable(createToJson: false)
class TradeDto {
  final String id;
  final String instrument;
  @JsonKey(fromJson: _parseDouble)
  final double price;
  final String openTime;
  final String state;
  @JsonKey(fromJson: _parseDouble)
  final double initialUnits;
  @JsonKey(fromJson: _parseDouble)
  final double initialMarginRequired;
  @JsonKey(fromJson: _parseDouble)
  final double currentUnits;
  @JsonKey(fromJson: _parseDouble)
  final double realizedPL;
  @JsonKey(fromJson: _parseDouble)
  final double unrealizedPL;
  @JsonKey(fromJson: _parseDouble)
  final double marginUsed;
  @JsonKey(fromJson: _parseDouble)
  final double averageClosePrice;
  final List<String>? closingTransactionIDs;
  @JsonKey(fromJson: _parseDouble)
  final double financing;
  @JsonKey(fromJson: _parseDouble)
  final double dividendAdjustment;
  final TradeTakeProfitOrderDto? takeProfitOrder;
  final TradeStopLossOrderDto? stopLossOrder;
  final ClientExtensionsDto? clientExtensions;

  TradeDto({
    required this.id,
    required this.instrument,
    required this.price,
    required this.openTime,
    required this.state,
    required this.initialUnits,
    required this.initialMarginRequired,
    required this.currentUnits,
    required this.realizedPL,
    required this.unrealizedPL,
    required this.marginUsed,
    required this.averageClosePrice,
    this.closingTransactionIDs,
    required this.financing,
    required this.dividendAdjustment,
    this.takeProfitOrder,
    this.stopLossOrder,
    this.clientExtensions,
  });

  factory TradeDto.fromJson(Map<String, dynamic> json) =>
      _$TradeDtoFromJson(json);
}

@JsonSerializable(createToJson: false)
class TradeTakeProfitOrderDto {
  final String id;
  final String tradeID;
  @JsonKey(fromJson: _parseDouble)
  final double price;
  final String timeInForce;

  TradeTakeProfitOrderDto(
      {required this.id,
      required this.tradeID,
      required this.price,
      required this.timeInForce});
  factory TradeTakeProfitOrderDto.fromJson(Map<String, dynamic> json) =>
      _$TradeTakeProfitOrderDtoFromJson(json);
}

@JsonSerializable(createToJson: false)
class TradeStopLossOrderDto {
  final String id;
  final String tradeID;
  @JsonKey(fromJson: _parseDouble)
  final double price;
  final String timeInForce;

  TradeStopLossOrderDto(
      {required this.id,
      required this.tradeID,
      required this.price,
      required this.timeInForce});
  factory TradeStopLossOrderDto.fromJson(Map<String, dynamic> json) =>
      _$TradeStopLossOrderDtoFromJson(json);
}

@JsonSerializable(explicitToJson: true)
class ClientExtensionsDto {
  final String id;
  final String tag;
  final String comment;

  ClientExtensionsDto(
      {required this.id, required this.tag, required this.comment});
  factory ClientExtensionsDto.fromJson(Map<String, dynamic> json) =>
      _$ClientExtensionsDtoFromJson(json);
  Map<String, dynamic> toJson() => _$ClientExtensionsDtoToJson(this);
}

@JsonSerializable(createToJson: false)
class PendingOrdersResponseDto {
  final List<OrderDto> orders;
  PendingOrdersResponseDto({required this.orders});
  factory PendingOrdersResponseDto.fromJson(Map<String, dynamic> json) =>
      _$PendingOrdersResponseDtoFromJson(json);
}

@JsonSerializable(createToJson: false)
class OrderDto {
  final String id;
  final String createTime;
  final String type;
  final String instrument;
  @JsonKey(fromJson: _parseDouble)
  final double units;
  final String timeInForce;
  @JsonKey(fromJson: _parseDouble)
  final double? price;
  final String? positionFill;
  final String state;
  final ClientExtensionsDto? clientExtensions;
  final TpOnFillDto? takeProfitOnFill;
  final SlOnFillDto? stopLossOnFill;

  OrderDto({
    required this.id,
    required this.createTime,
    required this.type,
    required this.instrument,
    required this.units,
    required this.timeInForce,
    this.price,
    this.positionFill,
    required this.state,
    this.clientExtensions,
    this.takeProfitOnFill,
    this.stopLossOnFill,
  });

  factory OrderDto.fromJson(Map<String, dynamic> json) =>
      _$OrderDtoFromJson(json);
}

@JsonSerializable(createFactory: false, explicitToJson: true)
class CreateOrderRequestDto {
  final CreateOrderBodyDto order;
  CreateOrderRequestDto({required this.order});
  Map<String, dynamic> toJson() => _$CreateOrderRequestDtoToJson(this);
}

@JsonSerializable(createFactory: false, explicitToJson: true)
class CreateOrderBodyDto {
  final String type;
  final String instrument;
  final String units;
  final String timeInForce;
  final String positionFill;
  final String? price;
  final TpOnFillDto? takeProfitOnFill;
  final SlOnFillDto? stopLossOnFill;
  final ClientExtensionsDto? clientExtensions;

  CreateOrderBodyDto({
    required this.type,
    required this.instrument,
    required this.units,
    required this.timeInForce,
    required this.positionFill,
    this.price,
    this.takeProfitOnFill,
    this.stopLossOnFill,
    this.clientExtensions,
  });
  Map<String, dynamic> toJson() => _$CreateOrderBodyDtoToJson(this);
}

@JsonSerializable(explicitToJson: true)
class TpOnFillDto {
  final String price;
  final String timeInForce;
  TpOnFillDto({required this.price, required this.timeInForce});
  factory TpOnFillDto.fromJson(Map<String, dynamic> json) =>
      _$TpOnFillDtoFromJson(json);
  Map<String, dynamic> toJson() => _$TpOnFillDtoToJson(this);
}

@JsonSerializable(explicitToJson: true)
class SlOnFillDto {
  final String price;
  final String timeInForce;
  SlOnFillDto({required this.price, required this.timeInForce});
  factory SlOnFillDto.fromJson(Map<String, dynamic> json) =>
      _$SlOnFillDtoFromJson(json);
  Map<String, dynamic> toJson() => _$SlOnFillDtoToJson(this);
}

@JsonSerializable(createToJson: false)
class OrderFillResponseDto {
  final OrderFillTransactionDto orderFillTransaction;
  OrderFillResponseDto({required this.orderFillTransaction});
  factory OrderFillResponseDto.fromJson(Map<String, dynamic> json) =>
      _$OrderFillResponseDtoFromJson(json);
}

@JsonSerializable(createToJson: false)
class OrderFillTransactionDto {
  final String id;
  final String tradeOpened; // Contains trade ID
  final String time;
  OrderFillTransactionDto(
      {required this.id, required this.tradeOpened, required this.time});
  factory OrderFillTransactionDto.fromJson(Map<String, dynamic> json) {
    String tradeOpenedId = '';
    if (json['tradeOpened'] != null)
      tradeOpenedId = json['tradeOpened']['tradeID'] ?? '';
    return OrderFillTransactionDto(
      id: json['id'] as String,
      tradeOpened: tradeOpenedId,
      time: json['time'] as String,
    );
  }
}

@JsonSerializable(createToJson: false)
class ModifyTradeResponseDto {
  final TradeTakeProfitOrderDto? takeProfitOrderTransaction;
  final TradeStopLossOrderDto? stopLossOrderTransaction;
  ModifyTradeResponseDto(
      {this.takeProfitOrderTransaction, this.stopLossOrderTransaction});
  factory ModifyTradeResponseDto.fromJson(Map<String, dynamic> json) =>
      _$ModifyTradeResponseDtoFromJson(json);
}

double _parseDouble(dynamic value) {
  if (value == null) return 0.0;
  if (value is num) return value.toDouble();
  if (value is String) return double.tryParse(value) ?? 0.0;
  return 0.0;
}
