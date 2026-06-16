// Path: lib/core/database/tables/orders_table.dart
import 'package:drift/drift.dart';

class OrdersTable extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get oandaOrderId => text().unique()();
  TextColumn get symbol => text()();
  TextColumn get orderType => text()();
  TextColumn get direction => text()();
  RealColumn get lots => real()();
  RealColumn get units => real()();
  RealColumn get price => real()();
  RealColumn get priceBound => real().nullable()();
  RealColumn get stopLoss => real().nullable()();
  RealColumn get takeProfit => real().nullable()();
  TextColumn get timeInForce => text()();
  IntColumn get expiryTimeUs => integer().nullable()();
  TextColumn get status => text()();
  IntColumn get createTimeUs => integer()();
  IntColumn get lastModifiedUs => integer()();
  IntColumn get magicNumber => integer()();
  TextColumn get comment => text()();
  RealColumn get distanceFromMarket => real().nullable()();
}
