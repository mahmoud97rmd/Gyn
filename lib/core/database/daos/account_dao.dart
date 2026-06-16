// Path: lib/core/database/daos/account_dao.dart
import 'package:drift/drift.dart';
import '../app_database.dart';
import '../tables/account_snapshots_table.dart';
import '../tables/symbols_table.dart';

part 'account_dao.g.dart';

@DriftAccessor(tables: [AccountSnapshotsTable, SymbolsTable])
class AccountDao extends DatabaseAccessor<AppDatabase> with _$AccountDaoMixin {
  AccountDao(AppDatabase db) : super(db);

  Future<int> insertSnapshot(AccountSnapshotsTableCompanion snapshot) =>
      into(accountSnapshotsTable).insert(snapshot);
  Future<AccountSnapshotsTableData?> getLatestSnapshot() =>
      (select(accountSnapshotsTable)
            ..orderBy([
              (t) => OrderingTerm(
                  expression: t.timestampUs, mode: OrderingMode.desc)
            ])
            ..limit(1))
          .getSingleOrNull();
  Stream<AccountSnapshotsTableData?> watchLatestSnapshot() =>
      (select(accountSnapshotsTable)
            ..orderBy([
              (t) => OrderingTerm(
                  expression: t.timestampUs, mode: OrderingMode.desc)
            ])
            ..limit(1))
          .watchSingleOrNull();
  Future<List<AccountSnapshotsTableData>> getSnapshotsForRange(
          int startUs, int endUs) =>
      (select(accountSnapshotsTable)
            ..where((t) => t.timestampUs.isBetweenValues(startUs, endUs))
            ..orderBy([(t) => OrderingTerm(expression: t.timestampUs)]))
          .get();
  Future<int> pruneOldSnapshots(int olderThanUs) =>
      (delete(accountSnapshotsTable)
            ..where((t) => t.timestampUs.isSmallerThanValue(olderThanUs)))
          .go();

  Future<List<SymbolsTableData>> getAllSymbols() => select(symbolsTable).get();
  Future<List<SymbolsTableData>> getWatchlistedSymbols() =>
      (select(symbolsTable)
            ..where((t) => t.isWatchlisted)
            ..orderBy([(t) => OrderingTerm(expression: t.watchlistSortOrder)]))
          .get();
  Stream<List<SymbolsTableData>> watchWatchlistedSymbols() =>
      (select(symbolsTable)
            ..where((t) => t.isWatchlisted)
            ..orderBy([(t) => OrderingTerm(expression: t.watchlistSortOrder)]))
          .watch();
  Future<SymbolsTableData?> getSymbol(String name) =>
      (select(symbolsTable)..where((t) => t.name.equals(name)))
          .getSingleOrNull();

  Future<void> upsertSymbol(SymbolsTableCompanion symbol) =>
      into(symbolsTable).insertOnConflictUpdate(symbol);
  Future<void> upsertSymbols(List<SymbolsTableCompanion> symbols) =>
      batch((batch) => batch.insertAllOnConflictUpdate(symbolsTable, symbols));

  Future<int> toggleWatchlist(String name, bool isWatchlisted) {
    return (update(symbolsTable)..where((t) => t.name.equals(name)))
        .write(SymbolsTableCompanion(isWatchlisted: Value(isWatchlisted)));
  }

  Future<int> updateWatchlistOrder(String name, int order) {
    return (update(symbolsTable)..where((t) => t.name.equals(name)))
        .write(SymbolsTableCompanion(watchlistSortOrder: Value(order)));
  }

  Future<void> reorderWatchlist(List<String> names) async {
    await batch((batch) {
      for (int i = 0; i < names.length; i++) {
        batch.update(
            symbolsTable, SymbolsTableCompanion(watchlistSortOrder: Value(i)),
            where: (t) => t.name.equals(names[i]));
      }
    });
  }
}
