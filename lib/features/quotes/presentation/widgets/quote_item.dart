// Path: lib/features/quotes/presentation/widgets/quote_item.dart
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/domain/entities/symbol_entity.dart';
import '../providers/quote_providers.dart';
import '../../../trading/presentation/widgets/order_entry.dart';

class QuoteItemWidget extends ConsumerWidget {
  final SymbolEntity symbol;

  const QuoteItemWidget({Key? key, required this.symbol}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final tickAsync = ref.watch(watchSymbolTickProvider(symbol.name));

    return InkWell(
      onTap: () {
        showModalBottomSheet(
          context: context,
          isScrollControlled: true,
          builder: (ctx) => OrderEntryWidget(symbol: symbol.name),
        );
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        decoration: const BoxDecoration(
          border: Border(bottom: BorderSide(color: Colors.white10)),
        ),
        child: Row(
          children: [
            Expanded(
              flex: 2,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(symbol.displayName,
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 16)),
                  const SizedBox(height: 4),
                  Text(
                      'Spread: ${tickAsync.valueOrNull?.spreadPips.toStringAsFixed(1) ?? '-'}',
                      style: const TextStyle(color: Colors.grey, fontSize: 12)),
                ],
              ),
            ),
            Expanded(
              flex: 1,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  const Text('Bid',
                      style: TextStyle(color: Colors.grey, fontSize: 10)),
                  Text(
                    tickAsync.valueOrNull?.bid
                            .toStringAsFixed(symbol.displayPrecision) ??
                        '-',
                    style: const TextStyle(
                        color: Colors.red, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              flex: 1,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  const Text('Ask',
                      style: TextStyle(color: Colors.grey, fontSize: 10)),
                  Text(
                    tickAsync.valueOrNull?.ask
                            .toStringAsFixed(symbol.displayPrecision) ??
                        '-',
                    style: const TextStyle(
                        color: Colors.blue, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
