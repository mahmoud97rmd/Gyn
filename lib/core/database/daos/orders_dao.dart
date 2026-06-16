// Path: lib/core/database/daos/orders_dao.dart
import 'package:drift/drift.dart';
import '../app_database.dart';
import '../tables/orders_table.dart';

part 'orders_dao.g.dart';

@DriftAccessor(tables: [OrdersTable])
class OrdersDao extends DatabaseAccessor<AppDatabase> with _$OrdersDaoMixin {
  OrdersDao(AppDatabase db) : super(db);

  Future<int> insertOrder(OrdersTableCompanion order) =>
      into(ordersTable).insert(order);
  Future<bool> updateOrder(OrdersTableCompanion order) =>
      update(ordersTable).replace(order);
  Future<int> updateOrderStatus(String oandaOrderId, String status) {
    return (update(ordersTable)
          ..where((t) => t.oandaOrderId.equals(oandaOrderId)))
        .write(OrdersTableCompanion(status: Value(status)));
  }

  Future<int> cancelOrder(String oandaOrderId) =>
      updateOrderStatus(oandaOrderId, 'CANCELLED');
  Future<int> markOrderFilled(String oandaOrderId) =>
      updateOrderStatus(oandaOrderId, 'FILLED');

  Future<int> updateDistanceFromMarket(String oandaOrderId, double distance) {
    return (update(ordersTable)
          ..where((t) => t.oandaOrderId.equals(oandaOrderId)))
        .write(OrdersTableCompanion(distanceFromMarket: Value(distance)));
  }

  Future<int> deleteOrder(String oandaOrderId) =>
      (delete(ordersTable)..where((t) => t.oandaOrderId.equals(oandaOrderId)))
          .go();

  Future<List<OrdersTableData>> getPendingOrders() =>
      (select(ordersTable)..where((t) => t.status.equals('PENDING'))).get();
  Stream<List<OrdersTableData>> watchPendingOrders() =>
      (select(ordersTable)..where((t) => t.status.equals('PENDING'))).watch();
  Future<List<OrdersTableData>> getPendingOrdersForSymbol(String symbol) =>
      (select(ordersTable)
            ..where(
                (t) => t.status.equals('PENDING') & t.symbol.equals(symbol)))
          .get();

  Future<int> getPendingOrderCount() async {
    final countExp = ordersTable.id.count();
    final query = selectOnly(ordersTable)
      ..addColumns([countExp])
      ..where(ordersTable.status.equals('PENDING'));
    final result = await query.getSingle();
    return result.read(countExp) ?? 0;
  }

  Future<OrdersTableData?> getOrderById(String oandaOrderId) =>
      (select(ordersTable)..where((t) => t.oandaOrderId.equals(oandaOrderId)))
          .getSingleOrNull();
}
