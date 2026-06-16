// Path: lib/core/database/tables/ea_instances_table.dart
import 'package:drift/drift.dart';

class EaInstancesTable extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get name => text()();
  TextColumn get scriptPath => text()();
  TextColumn get scriptFilename => text()();
  TextColumn get scriptHash => text()();
  IntColumn get scriptSizeBytes => integer()();
  TextColumn get symbol => text()();
  IntColumn get magicNumber => integer()();
  RealColumn get fixedLotSize => real()();
  IntColumn get maxPositions => integer()();
  TextColumn get customParameters => text()();
  TextColumn get status => text()();
  BoolColumn get autoStart => boolean().withDefault(const Constant(false))();
  IntColumn get killOnDisconnectSeconds => integer()();
  RealColumn get maxDailyLossLimit => real()();
  IntColumn get totalTrades => integer().withDefault(const Constant(0))();
  RealColumn get totalNetProfit => real().withDefault(const Constant(0.0))();
  RealColumn get winRate => real().withDefault(const Constant(0.0))();
  IntColumn get createdAtUs => integer()();
  IntColumn get lastStartedAtUs => integer().nullable()();
  IntColumn get lastStoppedAtUs => integer().nullable()();
  IntColumn get lastTickReceivedAtUs => integer().nullable()();
  TextColumn get lastError => text().nullable()();
}
