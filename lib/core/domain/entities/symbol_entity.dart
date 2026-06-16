// Path: lib/core/domain/entities/symbol_entity.dart
import 'dart:math';
import 'package:equatable/equatable.dart';

class SymbolEntity extends Equatable {
  final String name;
  final String displayName;
  final int displayExPrecision;
  final String type;
  final String pipLocation;
  final int displayPrecision;
  final double minimumTradeSize;
  final double marginRate;
  final int tradeUnitsPrecision;
  final bool isWatchlisted;

  const SymbolEntity({
    required this.name,
    required this.displayName,
    required this.displayExPrecision,
    required this.type,
    required this.pipLocation,
    required this.displayPrecision,
    required this.minimumTradeSize,
    required this.marginRate,
    required this.tradeUnitsPrecision,
    required this.isWatchlisted,
  });

  double get pipSize => pow(10, int.parse(pipLocation)).toDouble();
  double priceToPips(double priceDelta) => priceDelta / pipSize;
  double pipsToPrice(double pips) => pips * pipSize;
  double lotsToUnits(double lots) => lots * 100000; // Simplified contract size
  double calculateMargin(double lots, double price) =>
      lotsToUnits(lots) * price * marginRate;
  String formatPrice(double price) => price.toStringAsFixed(displayPrecision);

  @override
  List<Object> get props => [name, isWatchlisted];
}
