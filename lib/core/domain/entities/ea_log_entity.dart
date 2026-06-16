// Path: lib/core/domain/entities/ea_log_entity.dart
import 'package:equatable/equatable.dart';
import '../enums/trading_enums.dart';

class EaLogEntity extends Equatable {
  final String id;
  final String eaId;
  final LogLevel level;
  final String message;
  final int timestampUs;
  final String? exception;

  const EaLogEntity({
    required this.id,
    required this.eaId,
    required this.level,
    required this.message,
    required this.timestampUs,
    this.exception,
  });

  bool get isTradeLog => level == LogLevel.trade;
  bool get isErrorLog => level == LogLevel.error || level == LogLevel.critical;

  @override
  List<Object?> get props => [id];
}
