// Path: lib/core/database/daos/history_dao.dart
import 'package:drift/drift.dart';
import '../app_database.dart';
import '../tables/closed_trades_table.dart';

part 'history_dao.g.dart';

class TradeSummary {
  final double netPnl;
  final int totalTrades;
  final double winRate;
  final double profitFactor;
  final double avgProfit;
  final double avgLoss;
  final double largestWin;
  final double largestLoss;
  final double totalSwap;
  final double totalCommission;

  TradeSummary({
    required this.netPnl,
    required this.totalTrades,
    required this.winRate,
    required this.profitFactor,
    required this.avgProfit,
    required this.avgLoss,
    required this.largestWin,
    required this.largestLoss,
    required this.totalSwap,
    required this.totalCommission,
  });
}

@DriftAccessor(tables: [ClosedTradesTable])
class HistoryDao extends DatabaseAccessor<AppDatabase> with _$HistoryDaoMixin {
  HistoryDao(AppDatabase db) : super(db);

  Future<int> insertClosedTrade(ClosedTradesTableCompanion trade) =>
      into(closedTradesTable).insert(trade);
  Future<void> insertClosedTrades(List<ClosedTradesTableCompanion> trades) =>
      batch((batch) => batch.insertAll(closedTradesTable, trades));

  Future<List<ClosedTradesTableData>> getTradesInRange(
          int startUs, int endUs) =>
      (select(closedTradesTable)
            ..where((t) => t.closeTimeUs.isBetweenValues(startUs, endUs))
            ..orderBy([
              (t) => OrderingTerm(
                  expression: t.closeTimeUs, mode: OrderingMode.desc)
            ]))
          .get();
  Future<List<ClosedTradesTableData>> getTodaysTrades() => getTradesInRange(
      DateTime.now().subtract(const Duration(days: 1)).microsecondsSinceEpoch,
      DateTime.now().microsecondsSinceEpoch);
  Future<List<ClosedTradesTableData>> getLastWeekTrades() => getTradesInRange(
      DateTime.now().subtract(const Duration(days: 7)).microsecondsSinceEpoch,
      DateTime.now().microsecondsSinceEpoch);
  Future<List<ClosedTradesTableData>> getLastMonthTrades() => getTradesInRange(
      DateTime.now().subtract(const Duration(days: 30)).microsecondsSinceEpoch,
      DateTime.now().microsecondsSinceEpoch);
  Stream<List<ClosedTradesTableData>> watchRecentTrades(int limit) =>
      (select(closedTradesTable)
            ..orderBy([
              (t) => OrderingTerm(
                  expression: t.closeTimeUs, mode: OrderingMode.desc)
            ])
            ..limit(limit))
          .watch();

  Future<TradeSummary> getSummaryForRange(int startUs, int endUs) async {
    final trades = await getTradesInRange(startUs, endUs);
    double netPnl = 0.0,
        totalSwap = 0.0,
        totalCommission = 0.0,
        grossProfit = 0.0,
        grossLoss = 0.0;
    double largestWin = 0.0, largestLoss = 0.0;
    int wins = 0, losses = 0;

    for (var t in trades) {
      netPnl += t.netProfit;
      totalSwap += t.swap;
      totalCommission += t.commission;
      if (t.netProfit > 0) {
        wins++;
        grossProfit += t.netProfit;
        if (t.netProfit > largestWin) largestWin = t.netProfit;
      } else if (t.netProfit < 0) {
        losses++;
        grossLoss += t.netProfit.abs();
        if (t.netProfit < largestLoss) largestLoss = t.netProfit;
      }
    }

    final totalTrades = trades.length;
    final winRate = totalTrades > 0 ? (wins / totalTrades) * 100 : 0.0;
    final profitFactor = grossLoss > 0
        ? grossProfit / grossLoss
        : (grossProfit > 0 ? double.infinity : 0.0);
    final avgProfit = wins > 0 ? grossProfit / wins : 0.0;
    final avgLoss = losses > 0 ? grossLoss / losses : 0.0;

    return TradeSummary(
      netPnl: netPnl,
      totalTrades: totalTrades,
      winRate: winRate,
      profitFactor: profitFactor,
      avgProfit: avgProfit,
      avgLoss: avgLoss,
      largestWin: largestWin,
      largestLoss: largestLoss,
      totalSwap: totalSwap,
      totalCommission: totalCommission,
    );
  }

  Future<Map<String, double>> getDailyPnlBreakdown(
      int startUs, int endUs) async {
    final trades = await getTradesInRange(startUs, endUs);
    final breakdown = <String, double>{};
    for (var t in trades) {
      breakdown[t.closeDate] = (breakdown[t.closeDate] ?? 0.0) + t.netProfit;
    }
    return breakdown;
  }

  Future<int> getTotalTradeCount() async {
    final countExp = closedTradesTable.id.count();
    final query = selectOnly(closedTradesTable)..addColumns([countExp]);
    final result = await query.getSingle();
    return result.read(countExp) ?? 0;
  }
}
