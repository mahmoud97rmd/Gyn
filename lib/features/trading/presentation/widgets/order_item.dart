// Path: lib/features/trading/presentation/widgets/order_item.dart
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/domain/entities/order_entity.dart';
import '../../../../core/domain/enums/trading_enums.dart';
import '../providers/trading_providers.dart';

class OrderItem extends ConsumerWidget {
  final OrderEntity order;

  const OrderItem({Key? key, required this.order}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isBuy = order.direction == TradeDirection.buy;
    final color = isBuy ? Colors.blue : Colors.red;

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
                  order.symbol,
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 16),
                ),
                const SizedBox(width: 8),
                Text(
                  '${order.orderType.name} ${order.lots.toStringAsFixed(2)}',
                  style: TextStyle(color: color, fontSize: 12),
                ),
              ],
            ),
            Text(
              order.price.toStringAsFixed(5),
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
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
                Text('Status: ${order.status.name}'),
                Text(order.oandaOrderId,
                    style: const TextStyle(fontSize: 10, color: Colors.grey)),
              ],
            ),
            if (order.stopLoss != null || order.takeProfit != null)
              Padding(
                padding: const EdgeInsets.only(top: 4),
                child: Text(
                  'S/L: ${order.stopLoss ?? '-'}   T/P: ${order.takeProfit ?? '-'}',
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
        title: Text('${order.symbol} - Pending #${order.oandaOrderId}'),
        content: const Text('What would you like to do with this order?'),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(ctx);
              ref
                  .read(tradingControllerProvider.notifier)
                  .cancelOrder(order.oandaOrderId);
            },
            child:
                const Text('Cancel Order', style: TextStyle(color: Colors.red)),
          ),
          TextButton(
            onPressed: () => Navigator.pop(ctx),
            child: const Text('Back'),
          ),
        ],
      ),
    );
  }
}
