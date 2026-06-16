// Path: lib/features/account/presentation/providers/account_state.dart
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/domain/entities/account_entity.dart';
import '../../../../core/domain/entities/symbol_entity.dart';
import '../../data/repositories/account_repository_impl.dart';

final accountProvider = StreamProvider<AccountEntity>((ref) {
  final repo = ref.watch(accountRepositoryProvider);
  return repo.watchAccount();
});

final watchListProvider = StreamProvider<List<SymbolEntity>>((ref) {
  final repo = ref.watch(accountRepositoryProvider);
  return repo.watchWatchlist();
});

final availableInstrumentsProvider =
    FutureProvider<List<SymbolEntity>>((ref) async {
  final repo = ref.watch(accountRepositoryProvider);
  return repo.getInstruments();
});
