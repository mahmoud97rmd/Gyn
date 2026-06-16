// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transaction_candle_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TransactionsResponseDto _$TransactionsResponseDtoFromJson(
        Map<String, dynamic> json) =>
    TransactionsResponseDto(
      transactions: (json['transactions'] as List<dynamic>)
          .map((e) => TransactionDto.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

TransactionDto _$TransactionDtoFromJson(Map<String, dynamic> json) =>
    TransactionDto(
      id: json['id'] as String,
      time: json['time'] as String,
      type: json['type'] as String,
      instrument: json['instrument'] as String?,
      units: _parseDouble(json['units']),
      price: _parseDouble(json['price']),
      pl: _parseDouble(json['pl']),
      accountBalance: _parseDouble(json['accountBalance']),
      reason: json['reason'] as String?,
      tradesClosed: (json['tradesClosed'] as List<dynamic>?)
          ?.map((e) => TradeCloseDto.fromJson(e as Map<String, dynamic>))
          .toList(),
      tradeOpened: json['tradeOpened'] == null
          ? null
          : TradeOpenedDto.fromJson(
              json['tradeOpened'] as Map<String, dynamic>),
      clientExtensions: json['clientExtensions'] == null
          ? null
          : ClientExtensionsDto.fromJson(
              json['clientExtensions'] as Map<String, dynamic>),
    );

TradeCloseDto _$TradeCloseDtoFromJson(Map<String, dynamic> json) =>
    TradeCloseDto(
      tradeID: json['tradeID'] as String,
      units: json['units'] as String,
      realizedPL: json['realizedPL'] as String,
      financing: json['financing'] as String,
      price: json['price'] as String,
    );

TradeOpenedDto _$TradeOpenedDtoFromJson(Map<String, dynamic> json) =>
    TradeOpenedDto(
      tradeID: json['tradeID'] as String,
      units: json['units'] as String,
    );

CandlesResponseDto _$CandlesResponseDtoFromJson(Map<String, dynamic> json) =>
    CandlesResponseDto(
      instrument: json['instrument'] as String,
      granularity: json['granularity'] as String,
      candles: (json['candles'] as List<dynamic>)
          .map((e) => CandleDto.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

CandleDto _$CandleDtoFromJson(Map<String, dynamic> json) => CandleDto(
      complete: json['complete'] as bool,
      volume: (json['volume'] as num).toInt(),
      time: json['time'] as String,
      mid: CandleOhlcDto.fromJson(json['mid'] as Map<String, dynamic>),
    );

CandleOhlcDto _$CandleOhlcDtoFromJson(Map<String, dynamic> json) =>
    CandleOhlcDto(
      o: _parseDouble(json['o']),
      h: _parseDouble(json['h']),
      l: _parseDouble(json['l']),
      c: _parseDouble(json['c']),
    );

PricingResponseDto _$PricingResponseDtoFromJson(Map<String, dynamic> json) =>
    PricingResponseDto(
      prices: (json['prices'] as List<dynamic>)
          .map((e) => PriceDto.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

PriceDto _$PriceDtoFromJson(Map<String, dynamic> json) => PriceDto(
      type: json['type'] as String,
      instrument: json['instrument'] as String,
      time: json['time'] as String,
      status: json['status'] as String,
      tradeable: json['tradeable'] as bool,
      bids: (json['bids'] as List<dynamic>)
          .map((e) => PriceBucketDto.fromJson(e as Map<String, dynamic>))
          .toList(),
      asks: (json['asks'] as List<dynamic>)
          .map((e) => PriceBucketDto.fromJson(e as Map<String, dynamic>))
          .toList(),
      closeoutBid: _parseDouble(json['closeoutBid']),
      closeoutAsk: _parseDouble(json['closeoutAsk']),
    );

PriceBucketDto _$PriceBucketDtoFromJson(Map<String, dynamic> json) =>
    PriceBucketDto(
      price: _parseDouble(json['price']),
      liquidity: (json['liquidity'] as num).toInt(),
    );
