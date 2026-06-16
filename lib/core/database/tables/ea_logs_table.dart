// Path: lib/core/database/tables/ea_logs_table.dart
import 'package:drift/drift.dart';

class EaLogsTable extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get eaInstanceId => integer()();
  TextColumn get level => text()();
  TextColumn get message => text()();
  TextColumn get source => text()();
  IntColumn get tradeTicket => integer().nullable()();
  TextColumn get tradeAction => text().nullable()();
  IntColumn get timestampUs => integer()();
  TextColumn get timeDisplay => text()();
}
