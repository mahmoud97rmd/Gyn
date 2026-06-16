// Path: lib/core/database/tables/symbols_table.dart
import 'package:drift/drift.dart';

class SymbolsTable extends Table {
  TextColumn get name => text()();
  TextColumn get displayName => text()();
  IntColumn get displayExPrecision => integer()();
  TextColumn get type => text()();
  TextColumn get pipLocation => text()();
  IntColumn get displayPrecision => integer()();
  RealColumn get minimumTradeSize => real()();
  RealColumn get marginRate => real()();
  IntColumn get tradeUnitsPrecision => integer()();
  BoolColumn get isWatchlisted =>
      boolean().withDefault(const Constant(false))();
  IntColumn get watchlistSortOrder =>
      integer().withDefault(const Constant(0))();
  IntColumn get lastUpdatedUs => integer()();

  @override
  Set<Column> get primaryKey => {name};
}
