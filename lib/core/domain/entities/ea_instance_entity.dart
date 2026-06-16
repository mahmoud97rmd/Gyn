// Path: lib/core/domain/entities/ea_instance_entity.dart
import 'package:equatable/equatable.dart';
import '../enums/trading_enums.dart';

class EaInstanceEntity extends Equatable {
  final String id;
  final String name;
  final String description;
  final String scriptPath;
  final String symbol;
  final Timeframe timeframe;
  final EaStatus status;
  final int lastTickTimeUs;
  final double dailyProfitLimit;
  final double dailyLossLimit;
  final double maxDrawdownPct;
  final bool isAutoStart;
  final int magicNumber;
  final Map<String, dynamic> params;

  const EaInstanceEntity({
    required this.id,
    required this.name,
    required this.description,
    required this.scriptPath,
    required this.symbol,
    required this.timeframe,
    required this.status,
    required this.lastTickTimeUs,
    required this.dailyProfitLimit,
    required this.dailyLossLimit,
    required this.maxDrawdownPct,
    required this.isAutoStart,
    required this.magicNumber,
    required this.params,
  });

  bool get isRunning => status == EaStatus.running;
  bool get hasError => status == EaStatus.error;
  Duration get timeSinceLastTick => DateTime.now()
      .difference(DateTime.fromMicrosecondsSinceEpoch(lastTickTimeUs));
  bool get isTickStale => timeSinceLastTick.inSeconds > 300; // 5 mins

  EaInstanceEntity copyWith({
    EaStatus? status,
    int? lastTickTimeUs,
    Map<String, dynamic>? params,
  }) {
    return EaInstanceEntity(
      id: id,
      name: name,
      description: description,
      scriptPath: scriptPath,
      symbol: symbol,
      timeframe: timeframe,
      status: status ?? this.status,
      lastTickTimeUs: lastTickTimeUs ?? this.lastTickTimeUs,
      dailyProfitLimit: dailyProfitLimit,
      dailyLossLimit: dailyLossLimit,
      maxDrawdownPct: maxDrawdownPct,
      isAutoStart: isAutoStart,
      magicNumber: magicNumber,
      params: params ?? this.params,
    );
  }

  @override
  List<Object> get props => [id, status, lastTickTimeUs];
}
