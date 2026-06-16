// Path: lib/features/history/presentation/providers/history_providers.dart
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/domain/entities/closed_trade_entity.dart';
import '../../../../core/domain/entities/trade_summary_entity.dart';
import '../../../../core/domain/enums/trading_enums.dart';
import '../../data/repositories/history_repository_impl.dart';

final historyPeriodProvider =
    StateProvider<HistoryPeriod>((ref) => HistoryPeriod.lastMonth);

final historySyncProvider = FutureProvider<void>((ref) async {
  final repo = ref.watch(historyRepositoryProvider);
  await repo.syncHistory();
});

final closedTradesProvider = StreamProvider<List<ClosedTradeEntity>>((ref) {
  final repo = ref.watch(historyRepositoryProvider);
  return repo.watchRecentTrades();
});

final tradeSummaryProvider = FutureProvider<TradeSummaryEntity>((ref) async {
  final repo = ref.watch(historyRepositoryProvider);
  final period = ref.watch(historyPeriodProvider);
  return await repo.getTradeSummary(period);
});
