// Path: lib/core/database/app_database.dart
import 'dart:io';
import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;
import 'package:sqlite3_flutter_libs/sqlite3_flutter_libs.dart';
import 'package:sqlite3/sqlite3.dart';

import 'tables/ticks_table.dart';
import 'tables/symbols_table.dart';
import 'tables/positions_table.dart';
import 'tables/orders_table.dart';
import 'tables/closed_trades_table.dart';
import 'tables/account_snapshots_table.dart';
import 'tables/ea_instances_table.dart';
import 'tables/ea_logs_table.dart';
import 'tables/candles_table.dart';

import 'daos/ticks_dao.dart';
import 'daos/positions_dao.dart';
import 'daos/orders_dao.dart';
import 'daos/history_dao.dart';
import 'daos/account_dao.dart';
import 'daos/ea_dao.dart';
import 'daos/candles_dao.dart';

part 'app_database.g.dart';

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'mt5_clone.sqlite'));
    if (Platform.isAndroid) {
      await applyWorkaroundToOpenSqlite3OnOldAndroidVersions();
    }
    final cachebase = (await getTemporaryDirectory()).path;
    sqlite3.tempDirectory = cachebase;
    return NativeDatabase.createInBackground(file);
  });
}

@DriftDatabase(
  tables: [
    TicksTable,
    SymbolsTable,
    PositionsTable,
    OrdersTable,
    ClosedTradesTable,
    AccountSnapshotsTable,
    EaInstancesTable,
    EaLogsTable,
    CandlesTable
  ],
  daos: [
    TicksDao,
    PositionsDao,
    OrdersDao,
    HistoryDao,
    AccountDao,
    EaDao,
    CandlesDao
  ],
)
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 1;

  @override
  MigrationStrategy get migration => MigrationStrategy(
        onCreate: (m) async {
          await m.createAll();
          await _seedDefaultSymbols();
        },
        onUpgrade: (m, from, to) async {
          // Handled in migrations later
        },
        beforeOpen: (details) async {
          await customStatement('PRAGMA journal_mode=WAL;');
          await customStatement('PRAGMA foreign_keys=ON;');
          await customStatement('PRAGMA synchronous=NORMAL;');
        },
      );

  Future<void> _seedDefaultSymbols() async {
    final defaults = [
      SymbolsTableCompanion.insert(
          name: 'XAU_USD',
          displayName: 'Gold/USD',
          displayExPrecision: 3,
          type: 'CFD',
          pipLocation: '2',
          displayPrecision: 3,
          minimumTradeSize: 1.0,
          marginRate: 0.05,
          tradeUnitsPrecision: 0,
          isWatchlisted: const Value(true),
          watchlistSortOrder: const Value(0),
          lastUpdatedUs: DateTime.now().microsecondsSinceEpoch),
      SymbolsTableCompanion.insert(
          name: 'EUR_USD',
          displayName: 'EUR/USD',
          displayExPrecision: 5,
          type: 'CURRENCY',
          pipLocation: '-4',
          displayPrecision: 5,
          minimumTradeSize: 1.0,
          marginRate: 0.02,
          tradeUnitsPrecision: 0,
          isWatchlisted: const Value(true),
          watchlistSortOrder: const Value(1),
          lastUpdatedUs: DateTime.now().microsecondsSinceEpoch),
      SymbolsTableCompanion.insert(
          name: 'GBP_USD',
          displayName: 'GBP/USD',
          displayExPrecision: 5,
          type: 'CURRENCY',
          pipLocation: '-4',
          displayPrecision: 5,
          minimumTradeSize: 1.0,
          marginRate: 0.02,
          tradeUnitsPrecision: 0,
          isWatchlisted: const Value(true),
          watchlistSortOrder: const Value(2),
          lastUpdatedUs: DateTime.now().microsecondsSinceEpoch),
      SymbolsTableCompanion.insert(
          name: 'USD_JPY',
          displayName: 'USD/JPY',
          displayExPrecision: 3,
          type: 'CURRENCY',
          pipLocation: '-2',
          displayPrecision: 3,
          minimumTradeSize: 1.0,
          marginRate: 0.02,
          tradeUnitsPrecision: 0,
          isWatchlisted: const Value(true),
          watchlistSortOrder: const Value(3),
          lastUpdatedUs: DateTime.now().microsecondsSinceEpoch),
      SymbolsTableCompanion.insert(
          name: 'XAG_USD',
          displayName: 'Silver/USD',
          displayExPrecision: 3,
          type: 'CFD',
          pipLocation: '2',
          displayPrecision: 3,
          minimumTradeSize: 1.0,
          marginRate: 0.1,
          tradeUnitsPrecision: 0,
          isWatchlisted: const Value(true),
          watchlistSortOrder: const Value(4),
          lastUpdatedUs: DateTime.now().microsecondsSinceEpoch),
      SymbolsTableCompanion.insert(
          name: 'USD_CHF',
          displayName: 'USD/CHF',
          displayExPrecision: 5,
          type: 'CURRENCY',
          pipLocation: '-4',
          displayPrecision: 5,
          minimumTradeSize: 1.0,
          marginRate: 0.02,
          tradeUnitsPrecision: 0,
          isWatchlisted: const Value(true),
          watchlistSortOrder: const Value(5),
          lastUpdatedUs: DateTime.now().microsecondsSinceEpoch),
    ];
    await batch((batch) => batch.insertAll(symbolsTable, defaults));
  }

  Future<void> pruneOldTicks(int olderThanUs) =>
      ticksDao.deleteTicksOlderThan(olderThanUs);
  Future<void> pruneEaLogs(int eaId) => eaDao.clearLogsForEa(eaId);
  Future<void> pruneOldCandles(String symbol, String timeframe) =>
      candlesDao.deleteCandles(symbol, timeframe);

  Future<int> getDatabaseSizeBytes() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'mt5_clone.sqlite'));
    if (await file.exists()) {
      return await file.length();
    }
    return 0;
  }
}
