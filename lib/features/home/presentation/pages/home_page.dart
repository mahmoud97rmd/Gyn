// Path: lib/features/home/presentation/pages/home_page.dart
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../widgets/bottom_nav.dart';
import '../../../chart/presentation/widgets/main_chart_widget.dart';
import '../../../chart/presentation/widgets/chart_controls.dart';
import '../../../quotes/presentation/pages/quotes_page.dart';
import '../../../trading/presentation/pages/trade_page.dart';
import '../../../history/presentation/pages/history_page.dart';

final currentTabProvider = StateProvider<int>((ref) => 0);

class HomePage extends ConsumerWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentTab = ref.watch(currentTabProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('MT5 Clone'),
        actions: [
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () {},
          )
        ],
      ),
      body: _buildBody(currentTab),
      bottomNavigationBar: const BottomNavWidget(),
    );
  }

  Widget _buildBody(int tab) {
    switch (tab) {
      case 0:
        return const QuotesPage();
      case 1:
        return const ChartView();
      case 2:
        return const TradePage();
      case 3:
        return const HistoryPage();
      case 4:
        return const MessagesView();
      default:
        return const QuotesPage();
    }
  }
}

class ChartView extends StatelessWidget {
  const ChartView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const ChartControls(),
        Expanded(child: const MainChartWidget()),
      ],
    );
  }
}

class MessagesView extends StatelessWidget {
  const MessagesView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) => const Center(child: Text('Messages'));
}
