// Path: lib/core/domain/entities/account_entity.dart
import 'package:equatable/equatable.dart';

class AccountEntity extends Equatable {
  final String accountId;
  final double balance;
  final double equity;
  final double marginUsed;
  final double marginAvailable;
  final double marginLevel;
  final int openPositionCount;
  final double unrealizedPnl;
  final double totalDailyPnl;

  const AccountEntity({
    required this.accountId,
    required this.balance,
    required this.equity,
    required this.marginUsed,
    required this.marginAvailable,
    required this.marginLevel,
    required this.openPositionCount,
    required this.unrealizedPnl,
    required this.totalDailyPnl,
  });

  bool get isMarginCallRisk => marginLevelRatio < 1.0;
  bool get isMarginCall => marginLevelRatio < 0.5;
  double get marginLevelRatio =>
      marginUsed > 0 ? equity / marginUsed : double.infinity;
  String get marginLevelDisplay =>
      marginUsed > 0 ? '${(marginLevelRatio * 100).toStringAsFixed(2)}%' : '∞';
  double get effectiveLeverage => balance > 0 ? marginUsed / balance : 0;

  AccountEntity copyWith({
    double? balance,
    double? equity,
    double? marginUsed,
    double? marginAvailable,
    double? marginLevel,
    int? openPositionCount,
    double? unrealizedPnl,
    double? totalDailyPnl,
  }) {
    return AccountEntity(
      accountId: accountId,
      balance: balance ?? this.balance,
      equity: equity ?? this.equity,
      marginUsed: marginUsed ?? this.marginUsed,
      marginAvailable: marginAvailable ?? this.marginAvailable,
      marginLevel: marginLevel ?? this.marginLevel,
      openPositionCount: openPositionCount ?? this.openPositionCount,
      unrealizedPnl: unrealizedPnl ?? this.unrealizedPnl,
      totalDailyPnl: totalDailyPnl ?? this.totalDailyPnl,
    );
  }

  @override
  List<Object> get props =>
      [balance, equity, marginUsed, openPositionCount, unrealizedPnl];
}
