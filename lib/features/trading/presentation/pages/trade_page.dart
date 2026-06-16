// Path: lib/features/trading/presentation/pages/trade_page.dart
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../account/presentation/providers/account_state.dart';
import '../widgets/position_item.dart';
import '../widgets/order_item.dart';
import '../providers/trading_providers.dart';

class TradePage extends ConsumerWidget {
  const TradePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final accountAsync = ref.watch(accountProvider);

    return Column(
      children: [
        // Summary Header
        Container(
          color: const Color(0xFF2D2D2D),
          padding: const EdgeInsets.all(16),
          child: accountAsync.when(
            data: (acc) => Column(
              children: [
                _buildSummaryRow('Balance', acc.balance.toStringAsFixed(2)),
                _buildSummaryRow('Equity', acc.equity.toStringAsFixed(2)),
                _buildSummaryRow('Margin', acc.marginUsed.toStringAsFixed(2)),
                _buildSummaryRow(
                    'Free Margin', acc.marginAvailable.toStringAsFixed(2)),
                _buildSummaryRow(
                    'Margin Level', '${acc.marginLevel.toStringAsFixed(2)}%'),
              ],
            ),
            loading: () => const CircularProgressIndicator(),
            error: (e, s) => Text('Error: $e'),
          ),
        ),
        Expanded(
          child: DefaultTabController(
            length: 2,
            child: Column(
              children: [
                const TabBar(
                  tabs: [
                    Tab(text: 'Positions'),
                    Tab(text: 'Orders'),
                  ],
                ),
                Expanded(
                  child: TabBarView(
                    children: [
                      _buildPositionsList(ref),
                      _buildOrdersList(ref),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildPositionsList(WidgetRef ref) {
    final positionsAsync = ref.watch(positionsProvider);
    return positionsAsync.when(
      data: (positions) {
        if (positions.isEmpty)
          return const Center(child: Text('No open positions'));
        return ListView.builder(
          itemCount: positions.length,
          itemBuilder: (context, index) =>
              PositionItem(position: positions[index]),
        );
      },
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (e, s) => Center(child: Text('Error: $e')),
    );
  }

  Widget _buildOrdersList(WidgetRef ref) {
    final ordersAsync = ref.watch(pendingOrdersProvider);
    return ordersAsync.when(
      data: (orders) {
        if (orders.isEmpty)
          return const Center(child: Text('No pending orders'));
        return ListView.builder(
          itemCount: orders.length,
          itemBuilder: (context, index) => OrderItem(order: orders[index]),
        );
      },
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (e, s) => Center(child: Text('Error: $e')),
    );
  }

  Widget _buildSummaryRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label, style: const TextStyle(color: Colors.grey)),
          Text(value, style: const TextStyle(fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }
}
