// Path: lib/core/database/daos/candles_dao.dart
import 'package:drift/drift.dart';
import '../app_database.dart';
import '../tables/candles_table.dart';

part 'candles_dao.g.dart';

@DriftAccessor(tables: [CandlesTable])
class CandlesDao extends DatabaseAccessor<AppDatabase> with _$CandlesDaoMixin {
  CandlesDao(AppDatabase db) : super(db);

  Future<void> upsertCandle(CandlesTableCompanion candle) =>
      into(candlesTable).insertOnConflictUpdate(candle);
  Future<void> upsertCandles(List<CandlesTableCompanion> candles) =>
      batch((batch) => batch.insertAllOnConflictUpdate(candlesTable, candles));
  Future<int> updateIncompleteCandle(CandlesTableCompanion candle) {
    return (update(candlesTable)
          ..where((t) =>
              t.symbol.equals(candle.symbol.value) &
              t.timeframe.equals(candle.timeframe.value) &
              t.openTimeUs.equals(candle.openTimeUs.value)))
        .write(candle);
  }

  Future<int> markCandleComplete(
      String symbol, String timeframe, int openTimeUs) {
    return (update(candlesTable)
          ..where((t) =>
              t.symbol.equals(symbol) &
              t.timeframe.equals(timeframe) &
              t.openTimeUs.equals(openTimeUs)))
        .write(const CandlesTableCompanion(isComplete: Value(true)));
  }

  Future<List<CandlesTableData>> getRecentCandles(
          String symbol, String timeframe, int limit) =>
      (select(candlesTable)
            ..where(
                (t) => t.symbol.equals(symbol) & t.timeframe.equals(timeframe))
            ..orderBy([
              (t) => OrderingTerm(
                  expression: t.openTimeUs, mode: OrderingMode.desc)
            ])
            ..limit(limit))
          .get();
  Future<List<CandlesTableData>> getCandlesInRange(
          String symbol, String timeframe, int startUs, int endUs) =>
      (select(candlesTable)
            ..where((t) =>
                t.symbol.equals(symbol) &
                t.timeframe.equals(timeframe) &
                t.openTimeUs.isBetweenValues(startUs, endUs))
            ..orderBy([(t) => OrderingTerm(expression: t.openTimeUs)]))
          .get();
  Stream<List<CandlesTableData>> watchCandles(
          String symbol, String timeframe, int limit) =>
      (select(candlesTable)
            ..where(
                (t) => t.symbol.equals(symbol) & t.timeframe.equals(timeframe))
            ..orderBy([
              (t) => OrderingTerm(
                  expression: t.openTimeUs, mode: OrderingMode.desc)
            ])
            ..limit(limit))
          .watch();
  Future<CandlesTableData?> getCurrentCandle(String symbol, String timeframe) =>
      (select(candlesTable)
            ..where((t) =>
                t.symbol.equals(symbol) &
                t.timeframe.equals(timeframe) &
                t.isComplete.equals(false))
            ..orderBy([
              (t) => OrderingTerm(
                  expression: t.openTimeUs, mode: OrderingMode.desc)
            ])
            ..limit(1))
          .getSingleOrNull();
  Future<bool> hasCandles(String symbol, String timeframe) async {
    final countExp = candlesTable.id.count();
    final query = selectOnly(candlesTable)
      ..addColumns([countExp])
      ..where(candlesTable.symbol.equals(symbol) &
          candlesTable.timeframe.equals(timeframe));
    final result = await query.getSingle();
    return (result.read(countExp) ?? 0) > 0;
  }

  Future<int?> getLatestCandleTime(String symbol, String timeframe) async {
    final candle = await (select(candlesTable)
          ..where(
              (t) => t.symbol.equals(symbol) & t.timeframe.equals(timeframe))
          ..orderBy([
            (t) =>
                OrderingTerm(expression: t.openTimeUs, mode: OrderingMode.desc)
          ])
          ..limit(1))
        .getSingleOrNull();
    return candle?.openTimeUs;
  }

  Future<int> deleteCandles(String symbol, String timeframe) => (delete(
          candlesTable)
        ..where((t) => t.symbol.equals(symbol) & t.timeframe.equals(timeframe)))
      .go();
}
