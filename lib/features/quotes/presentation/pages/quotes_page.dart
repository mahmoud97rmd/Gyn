// Path: lib/features/quotes/presentation/pages/quotes_page.dart
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../account/presentation/providers/account_state.dart';
import '../widgets/quote_item.dart';

class QuotesPage extends ConsumerWidget {
  const QuotesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final watchlistAsync = ref.watch(watchListProvider);

    return watchlistAsync.when(
      data: (symbols) {
        if (symbols.isEmpty) {
          return const Center(child: Text('No instruments in watchlist.'));
        }
        return ListView.builder(
          itemCount: symbols.length,
          itemBuilder: (context, index) {
            return QuoteItemWidget(symbol: symbols[index]);
          },
        );
      },
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (e, s) => Center(child: Text('Error: $e')),
    );
  }
}
