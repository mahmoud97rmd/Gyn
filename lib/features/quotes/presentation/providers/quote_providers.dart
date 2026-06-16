// Path: lib/features/quotes/presentation/providers/quote_providers.dart
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/domain/entities/tick_entity.dart';
import '../../data/repositories/price_repository_impl.dart';

final streamConnectionStateProvider = StreamProvider<String>((ref) {
  final repo = ref.watch(priceRepositoryProvider);
  return repo.streamConnectionState;
});

final watchSymbolTickProvider =
    StreamProvider.family<TickEntity, String>((ref, symbol) {
  final repo = ref.watch(priceRepositoryProvider);
  return repo.watchTick(symbol);
});

final cachedTickProvider = Provider.family<TickEntity?, String>((ref, symbol) {
  final repo = ref.watch(priceRepositoryProvider);
  return repo.getCachedTick(symbol);
});
