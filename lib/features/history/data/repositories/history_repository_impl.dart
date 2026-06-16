// Path: lib/features/history/data/repositories/history_repository_impl.dart
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/domain/entities/closed_trade_entity.dart';
import '../../../../core/domain/entities/trade_summary_entity.dart';
import '../../../../core/domain/enums/trading_enums.dart';
import '../../../../core/domain/repositories/repositories.dart';
import '../../../../core/database/database_providers.dart';
import '../../../../core/database/app_database.dart';
import '../../../../core/database/daos/history_dao.dart';
import '../../../trading/data/datasources/oanda_rest_datasource.dart';
import 'package:drift/drift.dart';

class HistoryRepositoryImpl implements IHistoryRepository {
  final HistoryDao _historyDao;
  final OandaRestDataSource _oandaDataSource;

  HistoryRepositoryImpl(this._historyDao, this._oandaDataSource);

  DateTime _getStartForPeriod(HistoryPeriod period) {
    final now = DateTime.now();
    switch (period) {
      case HistoryPeriod.today:
        return now.subtract(const Duration(days: 1));
      case HistoryPeriod.lastWeek:
        return now.subtract(const Duration(days: 7));
      case HistoryPeriod.lastMonth:
        return now.subtract(const Duration(days: 30));
      case HistoryPeriod.last3Months:
        return now.subtract(const Duration(days: 90));
      case HistoryPeriod.lastYear:
        return now.subtract(const Duration(days: 365));
      case HistoryPeriod.custom:
        return now.subtract(const Duration(days: 30));
    }
  }

  @override
  Future<List<ClosedTradeEntity>> getClosedTrades(
      {HistoryPeriod period = HistoryPeriod.lastMonth}) async {
    final now = DateTime.now();
    final start = _getStartForPeriod(period);

    final dbTrades = await _historyDao.getTradesInRange(
        start.microsecondsSinceEpoch, now.microsecondsSinceEpoch);
    return dbTrades.map(_mapToEntity).toList();
  }

  @override
  Stream<List<ClosedTradeEntity>> watchRecentTrades() {
    return _historyDao
        .watchRecentTrades(50)
        .map((list) => list.map(_mapToEntity).toList());
  }

  @override
  Future<void> syncHistory() async {
    try {
      final now = DateTime.now();
      final from = now.subtract(const Duration(days: 30));
      final transactions =
          await _oandaDataSource.getTransactions(from, now, ['ORDER_FILL']);

      List<ClosedTradesTableCompanion> toInsert = [];
      for (final t in transactions.transactions) {
        if (t.pl != null && t.pl.toString() != '0.0000') {
          final isBuy = t.units.toString().startsWith('-');
          final plVal = double.tryParse(t.pl.toString()) ?? 0.0;

          toInsert.add(ClosedTradesTableCompanion(
            oandaTradeId: Value(t.id?.toString() ?? ''),
            symbol: Value(t.instrument?.toString() ?? 'UNKNOWN'),
            direction: Value(isBuy ? 'buy' : 'sell'),
            lots: Value(
                (double.tryParse(t.units.toString().replaceAll('-', '')) ??
                        0.0) /
                    100000),
            units: Value(double.tryParse(t.units.toString()) ?? 0.0),
            openPrice: const Value(0.0),
            closePrice:
                Value(double.tryParse(t.price?.toString() ?? '0') ?? 0.0),
            realizedPnl: Value(plVal),
            netProfit: Value(plVal),
            swap: const Value(0.0),
            commission: const Value(0.0),
            closeReason: const Value('unknown'),
            openTimeUs: Value(DateTime.tryParse(t.time?.toString() ?? '')
                    ?.microsecondsSinceEpoch ??
                0),
            closeTimeUs: Value(DateTime.tryParse(t.time?.toString() ?? '')
                    ?.microsecondsSinceEpoch ??
                0),
            magicNumber: const Value(0),
            comment: const Value('Synced'),
            maxProfit: const Value(0.0),
            maxDrawdown: const Value(0.0),
            priceDeltaPips: const Value(0.0),
            durationSeconds: const Value(0),
            openSession: const Value(''),
            closeDate: Value(t.time?.toString().split('T').first ?? ''),
          ));
        }
      }

      if (toInsert.isNotEmpty) {
        await _historyDao.insertClosedTrades(toInsert);
      }
    } catch (e) {
      // ignore
    }
  }

  @override
  Future<TradeSummaryEntity> getTradeSummary(HistoryPeriod period) async {
    final now = DateTime.now();
    final start = _getStartForPeriod(period);

    final summary = await _historyDao.getSummaryForRange(
        start.microsecondsSinceEpoch, now.microsecondsSinceEpoch);

    int winCount = ((summary.winRate / 100.0) * summary.totalTrades).round();
    int lossCount = summary.totalTrades - winCount;

    return TradeSummaryEntity(
      netPnl: summary.netPnl,
      totalTrades: summary.totalTrades,
      winCount: winCount,
      lossCount: lossCount,
      profitFactor: summary.profitFactor,
      maxDrawdown: 0.0,
    );
  }

  @override
  Future<List<DailyPnlEntity>> getDailyPnl(HistoryPeriod period) async {
    final now = DateTime.now();
    final start = _getStartForPeriod(period);

    final breakdown = await _historyDao.getDailyPnlBreakdown(
        start.microsecondsSinceEpoch, now.microsecondsSinceEpoch);
    return breakdown.entries
        .map((e) => DailyPnlEntity(
              date: DateTime.tryParse(e.key) ?? DateTime.now(),
              realizedPnl: e.value,
            ))
        .toList();
  }

  ClosedTradeEntity _mapToEntity(ClosedTradesTableData t) {
    return ClosedTradeEntity(
      oandaTradeId: t.oandaTradeId,
      symbol: t.symbol,
      direction:
          t.direction == 'buy' ? TradeDirection.buy : TradeDirection.sell,
      lots: t.lots,
      units: t.units,
      openPrice: t.openPrice,
      closePrice: t.closePrice,
      realizedPnl: t.realizedPnl,
      netProfit: t.netProfit,
      swap: t.swap,
      commission: t.commission,
      closeReason: CloseReason.unknown,
      openTimeUs: t.openTimeUs,
      closeTimeUs: t.closeTimeUs,
      magicNumber: t.magicNumber,
    );
  }
}

final historyRepositoryProvider = Provider<IHistoryRepository>((ref) {
  final historyDao = ref.watch(historyDaoProvider);
  final oandaDataSource = ref.watch(oandaRestDataSourceProvider);
  return HistoryRepositoryImpl(historyDao, oandaDataSource);
});
