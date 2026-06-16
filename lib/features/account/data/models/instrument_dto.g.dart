// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'instrument_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

InstrumentsResponseDto _$InstrumentsResponseDtoFromJson(
        Map<String, dynamic> json) =>
    InstrumentsResponseDto(
      instruments: (json['instruments'] as List<dynamic>)
          .map((e) => InstrumentDto.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

InstrumentDto _$InstrumentDtoFromJson(Map<String, dynamic> json) =>
    InstrumentDto(
      name: json['name'] as String,
      type: json['type'] as String,
      displayName: json['displayName'] as String,
      pipLocation: (json['pipLocation'] as num).toInt(),
      displayPrecision: (json['displayPrecision'] as num).toInt(),
      tradeUnitsPrecision: (json['tradeUnitsPrecision'] as num).toInt(),
      minimumTradeSize: _parseDouble(json['minimumTradeSize']),
      maximumTrailingStopDistance:
          _parseDouble(json['maximumTrailingStopDistance']),
      minimumTrailingStopDistance:
          _parseDouble(json['minimumTrailingStopDistance']),
      maximumPositionSize: _parseDouble(json['maximumPositionSize']),
      maximumOrderUnits: _parseDouble(json['maximumOrderUnits']),
      marginRate: _parseDouble(json['marginRate']),
      financing: InstrumentFinancingDto.fromJson(
          json['financing'] as Map<String, dynamic>),
    );

InstrumentFinancingDto _$InstrumentFinancingDtoFromJson(
        Map<String, dynamic> json) =>
    InstrumentFinancingDto(
      longRate: _parseDouble(json['longRate']),
      shortRate: _parseDouble(json['shortRate']),
    );
