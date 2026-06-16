// Path: lib/features/trading/presentation/widgets/position_item.dart
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/domain/entities/position_entity.dart';
import '../../../../core/domain/enums/trading_enums.dart';
import '../providers/trading_providers.dart';

class PositionItem extends ConsumerWidget {
  final PositionEntity position;

  const PositionItem({Key? key, required this.position}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isBuy = position.direction == TradeDirection.buy;
    final color = isBuy ? Colors.blue : Colors.red;
    final pnlColor = position.floatingPnl >= 0 ? Colors.green : Colors.red;

    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      color: const Color(0xFF1E1E1E),
      child: ListTile(
        contentPadding: const EdgeInsets.all(12),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Text(
                  position.symbol,
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 16),
                ),
                const SizedBox(width: 8),
                Text(
                  '${isBuy ? 'buy' : 'sell'} ${position.lots.toStringAsFixed(2)}',
                  style: TextStyle(color: color, fontSize: 12),
                ),
              ],
            ),
            Text(
              position.floatingPnl.toStringAsFixed(2),
              style: TextStyle(
                  color: pnlColor, fontWeight: FontWeight.bold, fontSize: 16),
            ),
          ],
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('${position.openPrice} → ${position.currentPrice}'),
                if (position.swap != 0)
                  Text('Swap: ${position.swap.toStringAsFixed(2)}',
                      style: const TextStyle(fontSize: 10, color: Colors.grey)),
              ],
            ),
            if (position.stopLoss != null || position.takeProfit != null)
              Padding(
                padding: const EdgeInsets.only(top: 4),
                child: Text(
                  'S/L: ${position.stopLoss ?? '-'}   T/P: ${position.takeProfit ?? '-'}',
                  style: const TextStyle(fontSize: 11, color: Colors.grey),
                ),
              ),
          ],
        ),
        onTap: () {
          _showActionDialog(context, ref);
        },
      ),
    );
  }

  void _showActionDialog(BuildContext context, WidgetRef ref) {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: Text('${position.symbol} - Order #${position.oandaTradeId}'),
        content: const Text('What would you like to do with this position?'),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(ctx);
              ref
                  .read(tradingControllerProvider.notifier)
                  .closePosition(position.oandaTradeId);
            },
            child: const Text('Close Position',
                style: TextStyle(color: Colors.red)),
          ),
          TextButton(
            onPressed: () => Navigator.pop(ctx),
            child: const Text('Cancel'),
          ),
        ],
      ),
    );
  }
}
