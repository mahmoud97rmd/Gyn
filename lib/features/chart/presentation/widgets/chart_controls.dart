// Path: lib/features/chart/presentation/widgets/chart_controls.dart
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/domain/enums/trading_enums.dart';
import '../providers/chart_state_provider.dart';

class ChartControls extends ConsumerWidget {
  const ChartControls({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(chartStateProvider);

    return Container(
      height: 50,
      color: const Color(0xFF2D2D2D),
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Row(
        children: [
          DropdownButton<String>(
            value: state.symbol,
            dropdownColor: const Color(0xFF2D2D2D),
            style: const TextStyle(color: Colors.white),
            items: ['EUR_USD', 'GBP_USD', 'USD_JPY']
                .map((s) => DropdownMenuItem(
                      value: s,
                      child: Text(s),
                    ))
                .toList(),
            onChanged: (val) {
              if (val != null) {
                ref.read(chartStateProvider.notifier).setSymbol(val);
              }
            },
          ),
          const SizedBox(width: 16),
          DropdownButton<Timeframe>(
            value: state.timeframe,
            dropdownColor: const Color(0xFF2D2D2D),
            style: const TextStyle(color: Colors.white),
            items: Timeframe.values
                .map((tf) => DropdownMenuItem(
                      value: tf,
                      child: Text(tf.name.toUpperCase()),
                    ))
                .toList(),
            onChanged: (val) {
              if (val != null) {
                ref.read(chartStateProvider.notifier).setTimeframe(val);
              }
            },
          ),
          const Spacer(),
          IconButton(
            icon: const Icon(Icons.add_chart, color: Colors.white),
            onPressed: () {
              // Open indicators menu
            },
          ),
        ],
      ),
    );
  }
}
