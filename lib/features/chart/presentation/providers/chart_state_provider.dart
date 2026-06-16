// Path: lib/features/chart/presentation/providers/chart_state_provider.dart
import 'dart:async';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/domain/entities/candle_entity.dart';
import '../../../../core/domain/enums/trading_enums.dart';
import '../../../../core/domain/repositories/repositories.dart';
import '../../../../core/streaming/candle_builder.dart';
import '../../../quotes/data/repositories/price_repository_impl.dart';

class ChartState {
  final String symbol;
  final Timeframe timeframe;
  final List<CandleEntity> candles;
  final bool isLoading;
  final String? error;

  ChartState({
    required this.symbol,
    required this.timeframe,
    this.candles = const [],
    this.isLoading = false,
    this.error,
  });

  ChartState copyWith({
    String? symbol,
    Timeframe? timeframe,
    List<CandleEntity>? candles,
    bool? isLoading,
    String? error,
  }) {
    return ChartState(
      symbol: symbol ?? this.symbol,
      timeframe: timeframe ?? this.timeframe,
      candles: candles ?? this.candles,
      isLoading: isLoading ?? this.isLoading,
      error: error ?? this.error,
    );
  }
}

class ChartStateNotifier extends StateNotifier<ChartState> {
  final IPriceRepository _priceRepo;
  final CandleBuilder _candleBuilder;
  StreamSubscription? _tickSub;
  StreamSubscription? _candleSub;

  ChartStateNotifier(this._priceRepo, this._candleBuilder)
      : super(ChartState(symbol: 'EUR_USD', timeframe: Timeframe.m15)) {
    _init();
  }

  void _init() {
    _candleSub = _candleBuilder.candleStream.listen((candle) {
      if (candle.symbol == state.symbol &&
          candle.timeframe == state.timeframe) {
        final existing = List<CandleEntity>.from(state.candles);
        final index =
            existing.indexWhere((c) => c.openTimeUs == candle.openTimeUs);
        if (index >= 0) {
          existing[index] = candle;
        } else {
          existing.add(candle);
        }
        state = state.copyWith(candles: existing);
      }
    });
    _loadData();
  }

  Future<void> _loadData() async {
    state = state.copyWith(isLoading: true, error: null);
    try {
      final now = DateTime.now();
      // Load last 24 hours of ticks for building history
      final history = await _priceRepo.getTickHistory(
          state.symbol, now.subtract(const Duration(days: 1)), now);

      final Map<int, CandleEntity> historicalCandles = {};

      for (final tick in history) {
        _candleBuilder.processTick(tick, [state.timeframe]);
      }

      // Start listening to live ticks
      _tickSub?.cancel();
      _tickSub = _priceRepo.watchTick(state.symbol).listen((tick) {
        _candleBuilder.processTick(tick, [state.timeframe]);
      });

      state = state.copyWith(isLoading: false);
    } catch (e) {
      state = state.copyWith(isLoading: false, error: e.toString());
    }
  }

  void setSymbol(String symbol) {
    if (state.symbol == symbol) return;
    state = state.copyWith(symbol: symbol, isLoading: true, candles: []);
    _loadData();
  }

  void setTimeframe(Timeframe tf) {
    if (state.timeframe == tf) return;
    state = state.copyWith(timeframe: tf, isLoading: true, candles: []);
    _loadData();
  }

  @override
  void dispose() {
    _tickSub?.cancel();
    _candleSub?.cancel();
    super.dispose();
  }
}

final chartStateProvider =
    StateNotifierProvider<ChartStateNotifier, ChartState>((ref) {
  final repo = ref.watch(priceRepositoryProvider);
  final builder = ref.watch(candleBuilderProvider);
  return ChartStateNotifier(repo, builder);
});
