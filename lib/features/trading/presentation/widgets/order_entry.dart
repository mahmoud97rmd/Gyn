// Path: lib/features/trading/presentation/widgets/order_entry.dart
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/domain/enums/trading_enums.dart';
import '../../data/repositories/trading_repository_impl.dart';

class OrderEntryWidget extends ConsumerStatefulWidget {
  final String symbol;

  const OrderEntryWidget({Key? key, required this.symbol}) : super(key: key);

  @override
  ConsumerState<OrderEntryWidget> createState() => _OrderEntryWidgetState();
}

class _OrderEntryWidgetState extends ConsumerState<OrderEntryWidget> {
  OrderType _orderType = OrderType.market;
  double _volume = 0.01;
  final TextEditingController _slController = TextEditingController();
  final TextEditingController _tpController = TextEditingController();

  bool _isLoading = false;

  void _placeOrder(TradeDirection direction) async {
    setState(() => _isLoading = true);
    try {
      final sl = double.tryParse(_slController.text);
      final tp = double.tryParse(_tpController.text);

      final pos = await ref.read(tradingRepositoryProvider).openMarketOrder(
            widget.symbol,
            direction,
            _volume,
          );
      if (sl != null || tp != null) {
        await ref.read(tradingRepositoryProvider).modifyPosition(
              pos.oandaTradeId,
              stopLoss: sl,
              takeProfit: tp,
            );
      }
      if (mounted) {
        Navigator.pop(context);
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Order placed successfully')),
        );
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
              content: Text('Failed to place order: $e'),
              backgroundColor: Colors.red),
        );
      }
    } finally {
      if (mounted) {
        setState(() => _isLoading = false);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
      child: Container(
        padding: const EdgeInsets.all(16),
        color: const Color(0xFF1E1E1E),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text('New Order: ${widget.symbol}',
                style:
                    const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 16),
            DropdownButton<OrderType>(
              value: _orderType,
              isExpanded: true,
              dropdownColor: const Color(0xFF2D2D2D),
              items: OrderType.values
                  .map((e) => DropdownMenuItem(value: e, child: Text(e.name)))
                  .toList(),
              onChanged: (val) {
                if (val != null) setState(() => _orderType = val);
              },
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                IconButton(
                    icon: const Icon(Icons.remove),
                    onPressed: () => setState(() {
                          if (_volume > 0.01) _volume -= 0.01;
                        })),
                Text(_volume.toStringAsFixed(2),
                    style: const TextStyle(fontSize: 20)),
                IconButton(
                    icon: const Icon(Icons.add),
                    onPressed: () => setState(() => _volume += 0.01)),
              ],
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                Expanded(
                    child: TextField(
                        controller: _slController,
                        decoration:
                            const InputDecoration(labelText: 'Stop Loss'))),
                const SizedBox(width: 16),
                Expanded(
                    child: TextField(
                        controller: _tpController,
                        decoration:
                            const InputDecoration(labelText: 'Take Profit'))),
              ],
            ),
            const SizedBox(height: 32),
            if (_isLoading)
              const CircularProgressIndicator()
            else
              Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                      style:
                          ElevatedButton.styleFrom(backgroundColor: Colors.red),
                      onPressed: () => _placeOrder(TradeDirection.sell),
                      child: const Text('SELL',
                          style: TextStyle(color: Colors.white)),
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blue),
                      onPressed: () => _placeOrder(TradeDirection.buy),
                      child: const Text('BUY',
                          style: TextStyle(color: Colors.white)),
                    ),
                  ),
                ],
              )
          ],
        ),
      ),
    );
  }
}
