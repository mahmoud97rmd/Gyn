// Path: lib/features/account/data/models/instrument_dto.dart
import 'package:json_annotation/json_annotation.dart';

part 'instrument_dto.g.dart';

@JsonSerializable(createToJson: false)
class InstrumentsResponseDto {
  final List<InstrumentDto> instruments;
  InstrumentsResponseDto({required this.instruments});
  factory InstrumentsResponseDto.fromJson(Map<String, dynamic> json) =>
      _$InstrumentsResponseDtoFromJson(json);
}

@JsonSerializable(createToJson: false)
class InstrumentDto {
  final String name;
  final String type;
  final String displayName;
  final int pipLocation;
  final int displayPrecision;
  final int tradeUnitsPrecision;
  @JsonKey(fromJson: _parseDouble)
  final double minimumTradeSize;
  @JsonKey(fromJson: _parseDouble)
  final double maximumTrailingStopDistance;
  @JsonKey(fromJson: _parseDouble)
  final double minimumTrailingStopDistance;
  @JsonKey(fromJson: _parseDouble)
  final double maximumPositionSize;
  @JsonKey(fromJson: _parseDouble)
  final double maximumOrderUnits;
  @JsonKey(fromJson: _parseDouble)
  final double marginRate;
  final InstrumentFinancingDto financing;

  InstrumentDto({
    required this.name,
    required this.type,
    required this.displayName,
    required this.pipLocation,
    required this.displayPrecision,
    required this.tradeUnitsPrecision,
    required this.minimumTradeSize,
    required this.maximumTrailingStopDistance,
    required this.minimumTrailingStopDistance,
    required this.maximumPositionSize,
    required this.maximumOrderUnits,
    required this.marginRate,
    required this.financing,
  });

  factory InstrumentDto.fromJson(Map<String, dynamic> json) =>
      _$InstrumentDtoFromJson(json);
}

@JsonSerializable(createToJson: false)
class InstrumentFinancingDto {
  @JsonKey(fromJson: _parseDouble)
  final double longRate;
  @JsonKey(fromJson: _parseDouble)
  final double shortRate;

  InstrumentFinancingDto({required this.longRate, required this.shortRate});
  factory InstrumentFinancingDto.fromJson(Map<String, dynamic> json) =>
      _$InstrumentFinancingDtoFromJson(json);
}

double _parseDouble(dynamic value) {
  if (value == null) return 0.0;
  if (value is num) return value.toDouble();
  if (value is String) return double.tryParse(value) ?? 0.0;
  return 0.0;
}
