// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'account_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AccountSummaryResponseDto _$AccountSummaryResponseDtoFromJson(
        Map<String, dynamic> json) =>
    AccountSummaryResponseDto(
      account:
          AccountSummaryDto.fromJson(json['account'] as Map<String, dynamic>),
      lastTransactionID: json['lastTransactionID'] as String,
    );

AccountSummaryDto _$AccountSummaryDtoFromJson(Map<String, dynamic> json) =>
    AccountSummaryDto(
      id: json['id'] as String,
      alias: json['alias'] as String,
      currency: json['currency'] as String,
      balance: _parseDouble(json['balance']),
      pl: _parseDouble(json['pl']),
      resettablePL: _parseDouble(json['resettablePL']),
      financing: _parseDouble(json['financing']),
      commission: _parseDouble(json['commission']),
      dividendAdjustment: _parseDouble(json['dividendAdjustment']),
      guaranteedExecutionFees: _parseDouble(json['guaranteedExecutionFees']),
      unrealizedPL: _parseDouble(json['unrealizedPL']),
      nav: _parseDouble(json['nav']),
      marginUsed: _parseDouble(json['marginUsed']),
      marginAvailable: _parseDouble(json['marginAvailable']),
      positionValue: _parseDouble(json['positionValue']),
      marginCloseoutUnrealizedPL:
          _parseDouble(json['marginCloseoutUnrealizedPL']),
      marginCloseoutNAV: _parseDouble(json['marginCloseoutNAV']),
      marginCloseoutMarginUsed: _parseDouble(json['marginCloseoutMarginUsed']),
      marginCloseoutPercent: _parseDouble(json['marginCloseoutPercent']),
      marginCloseoutPositionValue:
          _parseDouble(json['marginCloseoutPositionValue']),
      withdrawalLimit: _parseDouble(json['withdrawalLimit']),
      marginCallMarginUsed: _parseDouble(json['marginCallMarginUsed']),
      marginCallPercent: _parseDouble(json['marginCallPercent']),
      openTradeCount: (json['openTradeCount'] as num).toInt(),
      openPositionCount: (json['openPositionCount'] as num).toInt(),
      pendingOrderCount: (json['pendingOrderCount'] as num).toInt(),
    );

AccountsListResponseDto _$AccountsListResponseDtoFromJson(
        Map<String, dynamic> json) =>
    AccountsListResponseDto(
      accounts: (json['accounts'] as List<dynamic>)
          .map((e) => AccountPropertiesDto.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

AccountPropertiesDto _$AccountPropertiesDtoFromJson(
        Map<String, dynamic> json) =>
    AccountPropertiesDto(
      id: json['id'] as String,
      tags: (json['tags'] as List<dynamic>).map((e) => e as String).toList(),
    );
