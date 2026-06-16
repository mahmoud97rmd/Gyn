// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'trade_order_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OpenTradesResponseDto _$OpenTradesResponseDtoFromJson(
        Map<String, dynamic> json) =>
    OpenTradesResponseDto(
      trades: (json['trades'] as List<dynamic>)
          .map((e) => TradeDto.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

TradeDto _$TradeDtoFromJson(Map<String, dynamic> json) => TradeDto(
      id: json['id'] as String,
      instrument: json['instrument'] as String,
      price: _parseDouble(json['price']),
      openTime: json['openTime'] as String,
      state: json['state'] as String,
      initialUnits: _parseDouble(json['initialUnits']),
      initialMarginRequired: _parseDouble(json['initialMarginRequired']),
      currentUnits: _parseDouble(json['currentUnits']),
      realizedPL: _parseDouble(json['realizedPL']),
      unrealizedPL: _parseDouble(json['unrealizedPL']),
      marginUsed: _parseDouble(json['marginUsed']),
      averageClosePrice: _parseDouble(json['averageClosePrice']),
      closingTransactionIDs: (json['closingTransactionIDs'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      financing: _parseDouble(json['financing']),
      dividendAdjustment: _parseDouble(json['dividendAdjustment']),
      takeProfitOrder: json['takeProfitOrder'] == null
          ? null
          : TradeTakeProfitOrderDto.fromJson(
              json['takeProfitOrder'] as Map<String, dynamic>),
      stopLossOrder: json['stopLossOrder'] == null
          ? null
          : TradeStopLossOrderDto.fromJson(
              json['stopLossOrder'] as Map<String, dynamic>),
      clientExtensions: json['clientExtensions'] == null
          ? null
          : ClientExtensionsDto.fromJson(
              json['clientExtensions'] as Map<String, dynamic>),
    );

TradeTakeProfitOrderDto _$TradeTakeProfitOrderDtoFromJson(
        Map<String, dynamic> json) =>
    TradeTakeProfitOrderDto(
      id: json['id'] as String,
      tradeID: json['tradeID'] as String,
      price: _parseDouble(json['price']),
      timeInForce: json['timeInForce'] as String,
    );

TradeStopLossOrderDto _$TradeStopLossOrderDtoFromJson(
        Map<String, dynamic> json) =>
    TradeStopLossOrderDto(
      id: json['id'] as String,
      tradeID: json['tradeID'] as String,
      price: _parseDouble(json['price']),
      timeInForce: json['timeInForce'] as String,
    );

ClientExtensionsDto _$ClientExtensionsDtoFromJson(Map<String, dynamic> json) =>
    ClientExtensionsDto(
      id: json['id'] as String,
      tag: json['tag'] as String,
      comment: json['comment'] as String,
    );

Map<String, dynamic> _$ClientExtensionsDtoToJson(
        ClientExtensionsDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'tag': instance.tag,
      'comment': instance.comment,
    };

PendingOrdersResponseDto _$PendingOrdersResponseDtoFromJson(
        Map<String, dynamic> json) =>
    PendingOrdersResponseDto(
      orders: (json['orders'] as List<dynamic>)
          .map((e) => OrderDto.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

OrderDto _$OrderDtoFromJson(Map<String, dynamic> json) => OrderDto(
      id: json['id'] as String,
      createTime: json['createTime'] as String,
      type: json['type'] as String,
      instrument: json['instrument'] as String,
      units: _parseDouble(json['units']),
      timeInForce: json['timeInForce'] as String,
      price: _parseDouble(json['price']),
      positionFill: json['positionFill'] as String?,
      state: json['state'] as String,
      clientExtensions: json['clientExtensions'] == null
          ? null
          : ClientExtensionsDto.fromJson(
              json['clientExtensions'] as Map<String, dynamic>),
      takeProfitOnFill: json['takeProfitOnFill'] == null
          ? null
          : TpOnFillDto.fromJson(
              json['takeProfitOnFill'] as Map<String, dynamic>),
      stopLossOnFill: json['stopLossOnFill'] == null
          ? null
          : SlOnFillDto.fromJson(
              json['stopLossOnFill'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$CreateOrderRequestDtoToJson(
        CreateOrderRequestDto instance) =>
    <String, dynamic>{
      'order': instance.order.toJson(),
    };

Map<String, dynamic> _$CreateOrderBodyDtoToJson(CreateOrderBodyDto instance) =>
    <String, dynamic>{
      'type': instance.type,
      'instrument': instance.instrument,
      'units': instance.units,
      'timeInForce': instance.timeInForce,
      'positionFill': instance.positionFill,
      'price': instance.price,
      'takeProfitOnFill': instance.takeProfitOnFill?.toJson(),
      'stopLossOnFill': instance.stopLossOnFill?.toJson(),
      'clientExtensions': instance.clientExtensions?.toJson(),
    };

TpOnFillDto _$TpOnFillDtoFromJson(Map<String, dynamic> json) => TpOnFillDto(
      price: json['price'] as String,
      timeInForce: json['timeInForce'] as String,
    );

Map<String, dynamic> _$TpOnFillDtoToJson(TpOnFillDto instance) =>
    <String, dynamic>{
      'price': instance.price,
      'timeInForce': instance.timeInForce,
    };

SlOnFillDto _$SlOnFillDtoFromJson(Map<String, dynamic> json) => SlOnFillDto(
      price: json['price'] as String,
      timeInForce: json['timeInForce'] as String,
    );

Map<String, dynamic> _$SlOnFillDtoToJson(SlOnFillDto instance) =>
    <String, dynamic>{
      'price': instance.price,
      'timeInForce': instance.timeInForce,
    };

OrderFillResponseDto _$OrderFillResponseDtoFromJson(
        Map<String, dynamic> json) =>
    OrderFillResponseDto(
      orderFillTransaction: OrderFillTransactionDto.fromJson(
          json['orderFillTransaction'] as Map<String, dynamic>),
    );

OrderFillTransactionDto _$OrderFillTransactionDtoFromJson(
        Map<String, dynamic> json) =>
    OrderFillTransactionDto(
      id: json['id'] as String,
      tradeOpened: json['tradeOpened'] as String,
      time: json['time'] as String,
    );

ModifyTradeResponseDto _$ModifyTradeResponseDtoFromJson(
        Map<String, dynamic> json) =>
    ModifyTradeResponseDto(
      takeProfitOrderTransaction: json['takeProfitOrderTransaction'] == null
          ? null
          : TradeTakeProfitOrderDto.fromJson(
              json['takeProfitOrderTransaction'] as Map<String, dynamic>),
      stopLossOrderTransaction: json['stopLossOrderTransaction'] == null
          ? null
          : TradeStopLossOrderDto.fromJson(
              json['stopLossOrderTransaction'] as Map<String, dynamic>),
    );
