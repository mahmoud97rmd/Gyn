// Path: lib/features/home/presentation/widgets/bottom_nav.dart
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../pages/home_page.dart';

class BottomNavWidget extends ConsumerWidget {
  const BottomNavWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentTab = ref.watch(currentTabProvider);

    return BottomNavigationBar(
      currentIndex: currentTab,
      onTap: (idx) => ref.read(currentTabProvider.notifier).state = idx,
      type: BottomNavigationBarType.fixed,
      backgroundColor: const Color(0xFF1E1E1E),
      selectedItemColor: Colors.blue,
      unselectedItemColor: Colors.grey,
      items: const [
        BottomNavigationBarItem(icon: Icon(Icons.swap_vert), label: 'Quotes'),
        BottomNavigationBarItem(icon: Icon(Icons.show_chart), label: 'Chart'),
        BottomNavigationBarItem(
            icon: Icon(Icons.account_balance_wallet), label: 'Trade'),
        BottomNavigationBarItem(icon: Icon(Icons.history), label: 'History'),
        BottomNavigationBarItem(icon: Icon(Icons.message), label: 'Messages'),
      ],
    );
  }
}
