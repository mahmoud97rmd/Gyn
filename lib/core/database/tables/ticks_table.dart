// Path: lib/core/database/tables/ticks_table.dart
import 'package:drift/drift.dart';

@DataClassName('Tick')
class TicksTable extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get symbol => text()();
  RealColumn get bid => real()();
  RealColumn get ask => real()();
  RealColumn get spread => real()();
  RealColumn get spreadPips => real()();
  RealColumn get dailyHigh => real()();
  RealColumn get dailyLow => real()();
  IntColumn get timestampUs => integer()();
  IntColumn get oandaTimestamp => integer()();
  BoolColumn get isLive => boolean().withDefault(const Constant(true))();
}
