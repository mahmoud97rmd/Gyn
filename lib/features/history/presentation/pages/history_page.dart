// Path: lib/features/history/presentation/pages/history_page.dart
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../providers/history_providers.dart';
import '../widgets/history_item.dart';
import '../../../../core/domain/enums/trading_enums.dart';

class HistoryPage extends ConsumerWidget {
  const HistoryPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Trigger sync in background
    ref.listenManual(historySyncProvider, (previous, next) {});

    final tradesAsync = ref.watch(closedTradesProvider);
    final summaryAsync = ref.watch(tradeSummaryProvider);

    return Column(
      children: [
        _buildSummaryHeader(summaryAsync),
        Expanded(
          child: DefaultTabController(
            length: 3,
            child: Column(
              children: [
                const TabBar(
                  tabs: [
                    Tab(text: 'POSITIONS'),
                    Tab(text: 'ORDERS'),
                    Tab(text: 'DEALS'),
                  ],
                ),
                Expanded(
                  child: TabBarView(
                    children: [
                      _buildTradesList(tradesAsync),
                      const Center(child: Text('Orders History')),
                      const Center(child: Text('Deals History')),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildSummaryHeader(AsyncValue summaryAsync) {
    return Container(
      color: const Color(0xFF2D2D2D),
      padding: const EdgeInsets.all(16),
      child: summaryAsync.when(
        data: (summary) => Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('Profit',
                    style: TextStyle(color: Colors.grey, fontSize: 12)),
                Text(
                  summary.netPnl.toStringAsFixed(2),
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: summary.netPnl >= 0 ? Colors.blue : Colors.red,
                  ),
                ),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                const Text('Trades',
                    style: TextStyle(color: Colors.grey, fontSize: 12)),
                Text('${summary.totalTrades}',
                    style: const TextStyle(
                        fontSize: 18, fontWeight: FontWeight.bold)),
              ],
            ),
          ],
        ),
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (e, s) => Text('Error: $e'),
      ),
    );
  }

  Widget _buildTradesList(AsyncValue tradesAsync) {
    return tradesAsync.when(
      data: (trades) {
        if (trades.isEmpty) return const Center(child: Text('No history'));
        return ListView.builder(
          itemCount: trades.length,
          itemBuilder: (context, index) {
            final t = trades[index];
            return HistoryItemWidget(
              symbol: t.symbol,
              type: t.direction.name.toUpperCase(),
              volume: t.lots,
              openPrice: t.openPrice,
              closePrice: t.closePrice,
              profit: t.netProfit,
              openTime: t.openTime,
              closeTime: t.closeTime,
            );
          },
        );
      },
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (e, s) => Center(child: Text('Error: $e')),
    );
  }
}
