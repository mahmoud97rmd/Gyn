// Path: lib/core/ea/models/ea_config.dart
import '../../domain/enums/trading_enums.dart';

class EaConfig {
  final String name;
  final String symbol;
  final Timeframe timeframe;
  final int magicNumber;
  final Map<String, dynamic> parameters;

  EaConfig({
    required this.name,
    required this.symbol,
    required this.timeframe,
    required this.magicNumber,
    required this.parameters,
  });

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'symbol': symbol,
      'timeframe': timeframe.name,
      'magicNumber': magicNumber,
      'parameters': parameters,
    };
  }

  factory EaConfig.fromJson(Map<String, dynamic> json) {
    return EaConfig(
      name: json['name'] as String,
      symbol: json['symbol'] as String,
      timeframe:
          Timeframe.values.firstWhere((e) => e.name == json['timeframe']),
      magicNumber: json['magicNumber'] as int,
      parameters: json['parameters'] as Map<String, dynamic>,
    );
  }
}
