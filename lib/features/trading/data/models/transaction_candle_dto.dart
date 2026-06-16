// Path: lib/features/trading/data/models/transaction_candle_dto.dart
import 'package:json_annotation/json_annotation.dart';
import 'trade_order_dto.dart';

part 'transaction_candle_dto.g.dart';

@JsonSerializable(createToJson: false)
class TransactionsResponseDto {
  final List<TransactionDto> transactions;
  TransactionsResponseDto({required this.transactions});
  factory TransactionsResponseDto.fromJson(Map<String, dynamic> json) =>
      _$TransactionsResponseDtoFromJson(json);
}

@JsonSerializable(createToJson: false)
class TransactionDto {
  final String id;
  final String time;
  final String type;
  final String? instrument;
  @JsonKey(fromJson: _parseDouble)
  final double? units;
  @JsonKey(fromJson: _parseDouble)
  final double? price;
  @JsonKey(fromJson: _parseDouble)
  final double? pl;
  @JsonKey(fromJson: _parseDouble)
  final double? accountBalance;
  final String? reason;
  final List<TradeCloseDto>? tradesClosed;
  final TradeOpenedDto? tradeOpened;
  final ClientExtensionsDto? clientExtensions;

  TransactionDto({
    required this.id,
    required this.time,
    required this.type,
    this.instrument,
    this.units,
    this.price,
    this.pl,
    this.accountBalance,
    this.reason,
    this.tradesClosed,
    this.tradeOpened,
    this.clientExtensions,
  });

  factory TransactionDto.fromJson(Map<String, dynamic> json) =>
      _$TransactionDtoFromJson(json);
  bool get isCloseTrade => tradesClosed != null && tradesClosed!.isNotEmpty;
}

@JsonSerializable(createToJson: false)
class TradeCloseDto {
  final String tradeID;
  final String units;
  final String realizedPL;
  final String financing;
  final String price;

  TradeCloseDto({
    required this.tradeID,
    required this.units,
    required this.realizedPL,
    required this.financing,
    required this.price,
  });

  factory TradeCloseDto.fromJson(Map<String, dynamic> json) =>
      _$TradeCloseDtoFromJson(json);
}

@JsonSerializable(createToJson: false)
class TradeOpenedDto {
  final String tradeID;
  final String units;
  TradeOpenedDto({required this.tradeID, required this.units});
  factory TradeOpenedDto.fromJson(Map<String, dynamic> json) =>
      _$TradeOpenedDtoFromJson(json);
}

@JsonSerializable(createToJson: false)
class CandlesResponseDto {
  final String instrument;
  final String granularity;
  final List<CandleDto> candles;

  CandlesResponseDto(
      {required this.instrument,
      required this.granularity,
      required this.candles});
  factory CandlesResponseDto.fromJson(Map<String, dynamic> json) =>
      _$CandlesResponseDtoFromJson(json);
}

@JsonSerializable(createToJson: false)
class CandleDto {
  final bool complete;
  final int volume;
  final String time;
  final CandleOhlcDto mid;

  CandleDto(
      {required this.complete,
      required this.volume,
      required this.time,
      required this.mid});
  factory CandleDto.fromJson(Map<String, dynamic> json) =>
      _$CandleDtoFromJson(json);
}

@JsonSerializable(createToJson: false)
class CandleOhlcDto {
  @JsonKey(fromJson: _parseDouble)
  final double o;
  @JsonKey(fromJson: _parseDouble)
  final double h;
  @JsonKey(fromJson: _parseDouble)
  final double l;
  @JsonKey(fromJson: _parseDouble)
  final double c;

  CandleOhlcDto(
      {required this.o, required this.h, required this.l, required this.c});
  factory CandleOhlcDto.fromJson(Map<String, dynamic> json) =>
      _$CandleOhlcDtoFromJson(json);
}

@JsonSerializable(createToJson: false)
class PricingResponseDto {
  final List<PriceDto> prices;
  PricingResponseDto({required this.prices});
  factory PricingResponseDto.fromJson(Map<String, dynamic> json) =>
      _$PricingResponseDtoFromJson(json);
}

@JsonSerializable(createToJson: false)
class PriceDto {
  final String type;
  final String instrument;
  final String time;
  final String status;
  final bool tradeable;
  final List<PriceBucketDto> bids;
  final List<PriceBucketDto> asks;
  @JsonKey(fromJson: _parseDouble)
  final double closeoutBid;
  @JsonKey(fromJson: _parseDouble)
  final double closeoutAsk;

  PriceDto({
    required this.type,
    required this.instrument,
    required this.time,
    required this.status,
    required this.tradeable,
    required this.bids,
    required this.asks,
    required this.closeoutBid,
    required this.closeoutAsk,
  });

  factory PriceDto.fromJson(Map<String, dynamic> json) =>
      _$PriceDtoFromJson(json);
  double get bestBid => bids.isNotEmpty ? bids.first.price : closeoutBid;
  double get bestAsk => asks.isNotEmpty ? asks.first.price : closeoutAsk;
}

@JsonSerializable(createToJson: false)
class PriceBucketDto {
  @JsonKey(fromJson: _parseDouble)
  final double price;
  final int liquidity;

  PriceBucketDto({required this.price, required this.liquidity});
  factory PriceBucketDto.fromJson(Map<String, dynamic> json) =>
      _$PriceBucketDtoFromJson(json);
}

double _parseDouble(dynamic value) {
  if (value == null) return 0.0;
  if (value is num) return value.toDouble();
  if (value is String) return double.tryParse(value) ?? 0.0;
  return 0.0;
}
