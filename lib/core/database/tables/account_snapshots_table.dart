// Path: lib/core/database/tables/account_snapshots_table.dart
import 'package:drift/drift.dart';

class AccountSnapshotsTable extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get accountId => text()();
  RealColumn get balance => real()();
  RealColumn get equity => real()();
  RealColumn get marginUsed => real()();
  RealColumn get marginAvailable => real()();
  RealColumn get marginLevel => real()();
  RealColumn get nav => real()();
  IntColumn get openPositionCount => integer()();
  RealColumn get unrealizedPnl => real()();
  RealColumn get dailyRealizedPnl => real()();
  TextColumn get snapshotTrigger => text()();
  IntColumn get timestampUs => integer()();
  TextColumn get date => text()();
}
