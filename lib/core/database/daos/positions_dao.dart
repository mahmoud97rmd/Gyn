// Path: lib/core/database/daos/positions_dao.dart
import 'package:drift/drift.dart';
import '../app_database.dart';
import '../tables/positions_table.dart';

part 'positions_dao.g.dart';

@DriftAccessor(tables: [PositionsTable])
class PositionsDao extends DatabaseAccessor<AppDatabase>
    with _$PositionsDaoMixin {
  PositionsDao(AppDatabase db) : super(db);

  Future<int> insertPosition(PositionsTableCompanion position) =>
      into(positionsTable).insert(position);
  Future<bool> updatePosition(PositionsTableCompanion position) =>
      update(positionsTable).replace(position);
  Future<int> updatePositionPrice(
      String oandaTradeId, double currentPrice, double floatingPnl) {
    return (update(positionsTable)
          ..where((t) => t.oandaTradeId.equals(oandaTradeId)))
        .write(PositionsTableCompanion(
      currentPrice: Value(currentPrice),
      floatingPnl: Value(floatingPnl),
    ));
  }

  Future<void> batchUpdatePrices(List<PositionsTableCompanion> updates) async {
    await batch((batch) {
      for (final update in updates) {
        batch.update(positionsTable, update,
            where: (t) => t.oandaTradeId.equals(update.oandaTradeId.value));
      }
    });
  }

  Future<int> updateStopLossTakeProfit(
      String oandaTradeId, double? sl, double? tp) {
    return (update(positionsTable)
          ..where((t) => t.oandaTradeId.equals(oandaTradeId)))
        .write(PositionsTableCompanion(
      stopLoss: Value(sl),
      takeProfit: Value(tp),
    ));
  }

  Future<int> deletePosition(String oandaTradeId) => (delete(positionsTable)
        ..where((t) => t.oandaTradeId.equals(oandaTradeId)))
      .go();
  Future<int> deleteAllPositions() => delete(positionsTable).go();

  Future<List<PositionsTableData>> getAllPositions() =>
      select(positionsTable).get();
  Stream<List<PositionsTableData>> watchAllPositions() =>
      select(positionsTable).watch();
  Future<List<PositionsTableData>> getPositionsForSymbol(String symbol) =>
      (select(positionsTable)..where((t) => t.symbol.equals(symbol))).get();
  Future<List<PositionsTableData>> getPositionsByMagic(int magicNumber) =>
      (select(positionsTable)..where((t) => t.magicNumber.equals(magicNumber)))
          .get();
  Future<PositionsTableData?> getPositionByTradeId(String oandaTradeId) =>
      (select(positionsTable)
            ..where((t) => t.oandaTradeId.equals(oandaTradeId)))
          .getSingleOrNull();

  Future<double> getTotalFloatingPnl() async {
    final sumExp = positionsTable.floatingPnl.sum();
    final query = selectOnly(positionsTable)..addColumns([sumExp]);
    final result = await query.getSingle();
    return result.read(sumExp) ?? 0.0;
  }

  Future<double> getTotalMarginUsed() async {
    final sumExp = positionsTable.marginUsed.sum();
    final query = selectOnly(positionsTable)..addColumns([sumExp]);
    final result = await query.getSingle();
    return result.read(sumExp) ?? 0.0;
  }

  Future<int> getPositionCount() async {
    final countExp = positionsTable.id.count();
    final query = selectOnly(positionsTable)..addColumns([countExp]);
    final result = await query.getSingle();
    return result.read(countExp) ?? 0;
  }

  Stream<PositionsTableData?> watchPositionAggregates() {
    return select(positionsTable).watchSingleOrNull();
  }
}
