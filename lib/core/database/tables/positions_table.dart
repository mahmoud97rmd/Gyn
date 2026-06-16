// Path: lib/core/database/tables/positions_table.dart
import 'package:drift/drift.dart';

class PositionsTable extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get oandaTradeId => text().unique()();
  TextColumn get symbol => text()();
  TextColumn get direction => text()();
  RealColumn get lots => real()();
  RealColumn get units => real()();
  RealColumn get openPrice => real()();
  RealColumn get currentPrice => real()();
  RealColumn get stopLoss => real().nullable()();
  RealColumn get takeProfit => real().nullable()();
  RealColumn get floatingPnl => real()();
  RealColumn get swap => real()();
  RealColumn get commission => real()();
  RealColumn get marginUsed => real()();
  IntColumn get openTimeUs => integer()();
  IntColumn get magicNumber => integer()();
  TextColumn get comment => text()();
  BoolColumn get isModifying => boolean().withDefault(const Constant(false))();
}
