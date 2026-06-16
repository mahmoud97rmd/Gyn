// Path: lib/core/database/daos/ticks_dao.dart
import 'package:drift/drift.dart';
import '../app_database.dart';
import '../tables/ticks_table.dart';

part 'ticks_dao.g.dart';

@DriftAccessor(tables: [TicksTable])
class TicksDao extends DatabaseAccessor<AppDatabase> with _$TicksDaoMixin {
  TicksDao(AppDatabase db) : super(db);

  Future<int> insertTick(TicksTableCompanion tick) =>
      into(ticksTable).insert(tick);
  Future<void> insertTicks(List<TicksTableCompanion> ticks) =>
      batch((batch) => batch.insertAll(ticksTable, ticks));
  Future<void> upsertTick(TicksTableCompanion tick) =>
      into(ticksTable).insertOnConflictUpdate(tick);

  Future<Tick> getLatestTick(String symbol) => (select(ticksTable)
        ..where((t) => t.symbol.equals(symbol))
        ..orderBy([
          (t) =>
              OrderingTerm(expression: t.timestampUs, mode: OrderingMode.desc)
        ])
        ..limit(1))
      .getSingle();
  Stream<Tick> watchLatestTick(String symbol) => (select(ticksTable)
        ..where((t) => t.symbol.equals(symbol))
        ..orderBy([
          (t) =>
              OrderingTerm(expression: t.timestampUs, mode: OrderingMode.desc)
        ])
        ..limit(1))
      .watchSingle();

  Future<List<Tick>> getLatestTicksForSymbols(List<String> symbols) async {
    final result = <Tick>[];
    for (final sym in symbols) {
      final tick = await (select(ticksTable)
            ..where((t) => t.symbol.equals(sym))
            ..orderBy([
              (t) => OrderingTerm(
                  expression: t.timestampUs, mode: OrderingMode.desc)
            ])
            ..limit(1))
          .getSingleOrNull();
      if (tick != null) result.add(tick);
    }
    return result;
  }

  Stream<List<Tick>> watchLatestTicksForSymbols(List<String> symbols) {
    return select(ticksTable).watch(); // Placeholder
  }

  Future<List<Tick>> getTicksInRange(String symbol, int startUs, int endUs) =>
      (select(ticksTable)
            ..where((t) =>
                t.symbol.equals(symbol) &
                t.timestampUs.isBetweenValues(startUs, endUs))
            ..orderBy([(t) => OrderingTerm(expression: t.timestampUs)]))
          .get();
  Future<List<Tick>> getLastNTicks(String symbol, int n) => (select(ticksTable)
        ..where((t) => t.symbol.equals(symbol))
        ..orderBy([
          (t) =>
              OrderingTerm(expression: t.timestampUs, mode: OrderingMode.desc)
        ])
        ..limit(n))
      .get();

  Future<Tick?> getSessionHighLow(String symbol) => (select(ticksTable)
        ..where((t) => t.symbol.equals(symbol))
        ..orderBy([
          (t) =>
              OrderingTerm(expression: t.timestampUs, mode: OrderingMode.desc)
        ])
        ..limit(1))
      .getSingleOrNull();

  Future<int> countTicksForSymbol(String symbol) async {
    final countExp = ticksTable.id.count();
    final query = selectOnly(ticksTable)
      ..addColumns([countExp])
      ..where(ticksTable.symbol.equals(symbol));
    final result = await query.getSingle();
    return result.read(countExp) ?? 0;
  }

  Future<int> deleteTicksForSymbol(String symbol) =>
      (delete(ticksTable)..where((t) => t.symbol.equals(symbol))).go();
  Future<int> deleteTicksOlderThan(int timestampUs) => (delete(ticksTable)
        ..where((t) => t.timestampUs.isSmallerThanValue(timestampUs)))
      .go();
}
