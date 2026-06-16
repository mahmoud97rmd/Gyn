// Path: lib/features/history/presentation/widgets/history_item.dart
import 'package:flutter/material.dart';

class HistoryItemWidget extends StatelessWidget {
  final String symbol;
  final String type; // BUY or SELL
  final double volume;
  final double openPrice;
  final double closePrice;
  final double profit;
  final DateTime openTime;
  final DateTime closeTime;

  const HistoryItemWidget({
    Key? key,
    required this.symbol,
    required this.type,
    required this.volume,
    required this.openPrice,
    required this.closePrice,
    required this.profit,
    required this.openTime,
    required this.closeTime,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final isProfit = profit >= 0;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: const BoxDecoration(
          border: Border(bottom: BorderSide(color: Colors.white10))),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('$symbol $type $volume',
                  style: const TextStyle(fontWeight: FontWeight.bold)),
              Text(
                profit.toStringAsFixed(2),
                style: TextStyle(
                    color: isProfit ? Colors.blue : Colors.red,
                    fontWeight: FontWeight.bold),
              ),
            ],
          ),
          const SizedBox(height: 4),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                  '${openPrice.toStringAsFixed(5)} -> ${closePrice.toStringAsFixed(5)}',
                  style: const TextStyle(color: Colors.grey, fontSize: 12)),
              Text('${openTime.toString().substring(0, 16)}',
                  style: const TextStyle(color: Colors.grey, fontSize: 12)),
            ],
          ),
        ],
      ),
    );
  }
}
