// Path: lib/core/database/tables/closed_trades_table.dart
import 'package:drift/drift.dart';

class ClosedTradesTable extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get oandaTradeId => text().unique()();
  TextColumn get symbol => text()();
  TextColumn get direction => text()();
  RealColumn get lots => real()();
  RealColumn get units => real()();
  RealColumn get openPrice => real()();
  RealColumn get closePrice => real()();
  RealColumn get stopLoss => real().nullable()();
  RealColumn get takeProfit => real().nullable()();
  RealColumn get realizedPnl => real()();
  RealColumn get swap => real()();
  RealColumn get commission => real()();
  RealColumn get netProfit => real()();
  RealColumn get maxProfit => real()();
  RealColumn get maxDrawdown => real()();
  RealColumn get priceDeltaPips => real()();
  TextColumn get closeReason => text()();
  IntColumn get openTimeUs => integer()();
  IntColumn get closeTimeUs => integer()();
  IntColumn get durationSeconds => integer()();
  TextColumn get openSession => text()();
  IntColumn get magicNumber => integer()();
  TextColumn get comment => text()();
  TextColumn get closeDate => text()();
}
