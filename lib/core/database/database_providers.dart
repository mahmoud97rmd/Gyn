// Path: lib/core/database/database_providers.dart
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'app_database.dart';
import 'daos/ticks_dao.dart';
import 'daos/positions_dao.dart';
import 'daos/orders_dao.dart';
import 'daos/history_dao.dart';
import 'daos/account_dao.dart';
import 'daos/ea_dao.dart';
import 'daos/candles_dao.dart';
import 'hive_cache_service.dart';

final appDatabaseProvider = Provider<AppDatabase>((ref) {
  final db = AppDatabase();
  ref.onDispose(() => db.close());
  return db;
});

final hiveCacheServiceProvider =
    Provider<HiveCacheService>((ref) => HiveCacheService());

final ticksDaoProvider =
    Provider<TicksDao>((ref) => ref.watch(appDatabaseProvider).ticksDao);
final positionsDaoProvider = Provider<PositionsDao>(
    (ref) => ref.watch(appDatabaseProvider).positionsDao);
final ordersDaoProvider =
    Provider<OrdersDao>((ref) => ref.watch(appDatabaseProvider).ordersDao);
final historyDaoProvider =
    Provider<HistoryDao>((ref) => ref.watch(appDatabaseProvider).historyDao);
final accountDaoProvider =
    Provider<AccountDao>((ref) => ref.watch(appDatabaseProvider).accountDao);
final eaDaoProvider =
    Provider<EaDao>((ref) => ref.watch(appDatabaseProvider).eaDao);
final candlesDaoProvider =
    Provider<CandlesDao>((ref) => ref.watch(appDatabaseProvider).candlesDao);

final openPositionsStreamProvider =
    StreamProvider<List<PositionsTableData>>((ref) {
  return ref.watch(positionsDaoProvider).watchAllPositions();
});

final pendingOrdersStreamProvider =
    StreamProvider<List<OrdersTableData>>((ref) {
  return ref.watch(ordersDaoProvider).watchPendingOrders();
});

final watchlistedSymbolsStreamProvider =
    StreamProvider<List<SymbolsTableData>>((ref) {
  return ref.watch(accountDaoProvider).watchWatchlistedSymbols();
});

final eaInstancesStreamProvider =
    StreamProvider<List<EaInstancesTableData>>((ref) {
  return ref.watch(eaDaoProvider).watchAllEaInstances();
});

final positionAggregatesStreamProvider =
    StreamProvider<PositionsTableData?>((ref) {
  return ref.watch(positionsDaoProvider).watchPositionAggregates();
});

final eaLogsStreamProvider =
    StreamProvider.family<List<EaLogsTableData>, int>((ref, eaId) {
  return ref.watch(eaDaoProvider).watchLogsForEa(eaId);
});

final latestTickStreamProvider =
    StreamProvider.family<Tick, String>((ref, symbol) {
  return ref.watch(ticksDaoProvider).watchLatestTick(symbol);
});

class CandleStreamParams {
  final String symbol;
  final String timeframe;
  final int limit;
  CandleStreamParams(this.symbol, this.timeframe, this.limit);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CandleStreamParams &&
          runtimeType == other.runtimeType &&
          symbol == other.symbol &&
          timeframe == other.timeframe &&
          limit == other.limit;
  @override
  int get hashCode => symbol.hashCode ^ timeframe.hashCode ^ limit.hashCode;
}

final candlesStreamProvider =
    StreamProvider.family<List<CandlesTableData>, CandleStreamParams>(
        (ref, params) {
  return ref
      .watch(candlesDaoProvider)
      .watchCandles(params.symbol, params.timeframe, params.limit);
});
