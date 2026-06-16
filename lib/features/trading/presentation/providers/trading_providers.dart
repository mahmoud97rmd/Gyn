// Path: lib/features/trading/presentation/providers/trading_providers.dart
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/domain/entities/position_entity.dart';
import '../../../../core/domain/entities/order_entity.dart';
import '../../data/repositories/trading_repository_impl.dart';

final positionsProvider = StreamProvider<List<PositionEntity>>((ref) {
  final repo = ref.watch(tradingRepositoryProvider);
  return repo.watchOpenPositions();
});

final pendingOrdersProvider = StreamProvider<List<OrderEntity>>((ref) {
  final repo = ref.watch(tradingRepositoryProvider);
  return repo.watchPendingOrders();
});

class TradingNotifier extends StateNotifier<AsyncValue<void>> {
  final Ref _ref;

  TradingNotifier(this._ref) : super(const AsyncValue.data(null));

  Future<void> syncData() async {
    state = const AsyncValue.loading();
    try {
      final repo = _ref.read(tradingRepositoryProvider);
      await repo.syncPositions();
      await repo.syncOrders();
      state = const AsyncValue.data(null);
    } catch (e, st) {
      state = AsyncValue.error(e, st);
    }
  }

  Future<void> closePosition(String tradeId) async {
    state = const AsyncValue.loading();
    try {
      await _ref.read(tradingRepositoryProvider).closePosition(tradeId);
      state = const AsyncValue.data(null);
    } catch (e, st) {
      state = AsyncValue.error(e, st);
    }
  }

  Future<void> cancelOrder(String orderId) async {
    state = const AsyncValue.loading();
    try {
      await _ref.read(tradingRepositoryProvider).cancelOrder(orderId);
      state = const AsyncValue.data(null);
    } catch (e, st) {
      state = AsyncValue.error(e, st);
    }
  }
}

final tradingControllerProvider =
    StateNotifierProvider<TradingNotifier, AsyncValue<void>>((ref) {
  return TradingNotifier(ref);
});
