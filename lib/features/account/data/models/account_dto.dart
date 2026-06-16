// Path: lib/features/account/data/models/account_dto.dart
import 'package:json_annotation/json_annotation.dart';

part 'account_dto.g.dart';

@JsonSerializable(createToJson: false)
class AccountSummaryResponseDto {
  final AccountSummaryDto account;
  final String lastTransactionID;

  AccountSummaryResponseDto(
      {required this.account, required this.lastTransactionID});
  factory AccountSummaryResponseDto.fromJson(Map<String, dynamic> json) =>
      _$AccountSummaryResponseDtoFromJson(json);
}

@JsonSerializable(createToJson: false)
class AccountSummaryDto {
  final String id;
  final String alias;
  final String currency;
  @JsonKey(fromJson: _parseDouble)
  final double balance;
  @JsonKey(fromJson: _parseDouble)
  final double pl;
  @JsonKey(fromJson: _parseDouble)
  final double resettablePL;
  @JsonKey(fromJson: _parseDouble)
  final double financing;
  @JsonKey(fromJson: _parseDouble)
  final double commission;
  @JsonKey(fromJson: _parseDouble)
  final double dividendAdjustment;
  @JsonKey(fromJson: _parseDouble)
  final double guaranteedExecutionFees;
  @JsonKey(fromJson: _parseDouble)
  final double unrealizedPL;
  @JsonKey(fromJson: _parseDouble)
  final double nav;
  @JsonKey(fromJson: _parseDouble)
  final double marginUsed;
  @JsonKey(fromJson: _parseDouble)
  final double marginAvailable;
  @JsonKey(fromJson: _parseDouble)
  final double positionValue;
  @JsonKey(fromJson: _parseDouble)
  final double marginCloseoutUnrealizedPL;
  @JsonKey(fromJson: _parseDouble)
  final double marginCloseoutNAV;
  @JsonKey(fromJson: _parseDouble)
  final double marginCloseoutMarginUsed;
  @JsonKey(fromJson: _parseDouble)
  final double marginCloseoutPercent;
  @JsonKey(fromJson: _parseDouble)
  final double marginCloseoutPositionValue;
  @JsonKey(fromJson: _parseDouble)
  final double withdrawalLimit;
  @JsonKey(fromJson: _parseDouble)
  final double marginCallMarginUsed;
  @JsonKey(fromJson: _parseDouble)
  final double marginCallPercent;
  final int openTradeCount;
  final int openPositionCount;
  final int pendingOrderCount;

  AccountSummaryDto({
    required this.id,
    required this.alias,
    required this.currency,
    required this.balance,
    required this.pl,
    required this.resettablePL,
    required this.financing,
    required this.commission,
    required this.dividendAdjustment,
    required this.guaranteedExecutionFees,
    required this.unrealizedPL,
    required this.nav,
    required this.marginUsed,
    required this.marginAvailable,
    required this.positionValue,
    required this.marginCloseoutUnrealizedPL,
    required this.marginCloseoutNAV,
    required this.marginCloseoutMarginUsed,
    required this.marginCloseoutPercent,
    required this.marginCloseoutPositionValue,
    required this.withdrawalLimit,
    required this.marginCallMarginUsed,
    required this.marginCallPercent,
    required this.openTradeCount,
    required this.openPositionCount,
    required this.pendingOrderCount,
  });

  factory AccountSummaryDto.fromJson(Map<String, dynamic> json) =>
      _$AccountSummaryDtoFromJson(json);
}

@JsonSerializable(createToJson: false)
class AccountsListResponseDto {
  final List<AccountPropertiesDto> accounts;
  AccountsListResponseDto({required this.accounts});
  factory AccountsListResponseDto.fromJson(Map<String, dynamic> json) =>
      _$AccountsListResponseDtoFromJson(json);
}

@JsonSerializable(createToJson: false)
class AccountPropertiesDto {
  final String id;
  final List<String> tags;
  AccountPropertiesDto({required this.id, required this.tags});
  factory AccountPropertiesDto.fromJson(Map<String, dynamic> json) =>
      _$AccountPropertiesDtoFromJson(json);
}

double _parseDouble(dynamic value) {
  if (value == null) return 0.0;
  if (value is num) return value.toDouble();
  if (value is String) return double.tryParse(value) ?? 0.0;
  return 0.0;
}
