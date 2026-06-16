// Path: lib/core/domain/repositories/repositories.dart
import 'dart:io';
import '../entities/account_entity.dart';
import '../entities/candle_entity.dart';
import '../entities/closed_trade_entity.dart';
import '../entities/ea_instance_entity.dart';
import '../entities/ea_log_entity.dart';
import '../entities/order_entity.dart';
import '../entities/position_entity.dart';
import '../entities/symbol_entity.dart';
import '../entities/tick_entity.dart';
import '../entities/trade_summary_entity.dart';
import '../enums/trading_enums.dart';

abstract class IPriceRepository {
  Stream<TickEntity> watchTick(String symbol);
  TickEntity? getCachedTick(String symbol);
  Future<List<TickEntity>> getTickHistory(
      String symbol, DateTime from, DateTime to);
  Future<void> startStreaming(List<String> symbols);
  Future<void> stopStreaming();
  bool get isStreaming;
  Stream<String> get streamConnectionState;
}

abstract class ITradingRepository {
  Future<PositionEntity> openMarketOrder(
      String symbol, TradeDirection direction, double lots);
  Future<void> closePosition(String tradeId);
  Future<void> modifyPosition(String tradeId,
      {double? stopLoss, double? takeProfit});
  Future<void> closeAllPositions();
  Future<OrderEntity> placeOrder(String symbol, OrderType type,
      TradeDirection direction, double lots, double price,
      {double? stopLoss, double? takeProfit});
  Future<void> cancelOrder(String orderId);
  Future<void> modifyOrder(String orderId,
      {double? price, double? stopLoss, double? takeProfit});
  Stream<List<PositionEntity>> watchOpenPositions();
  Stream<List<OrderEntity>> watchPendingOrders();
  Future<void> syncPositions();
  Future<void> syncOrders();
}

abstract class IAccountRepository {
  Future<AccountEntity> getAccount();
  Stream<AccountEntity> watchAccount();
  Future<List<SymbolEntity>> getInstruments();
  Future<List<SymbolEntity>> getWatchlist();
  Stream<List<SymbolEntity>> watchWatchlist();
  Future<void> toggleWatchlist(String symbol);
  Future<void> reorderWatchlist(List<String> symbols);
}

abstract class ICandleRepository {
  Future<List<CandleEntity>> getCandles(String symbol, Timeframe timeframe,
      {int count = 300});
  Stream<List<CandleEntity>> watchCandles(String symbol, Timeframe timeframe);
  Future<void> refreshCandles(String symbol, Timeframe timeframe);
}

abstract class IHistoryRepository {
  Future<List<ClosedTradeEntity>> getClosedTrades(
      {HistoryPeriod period = HistoryPeriod.lastMonth});
  Stream<List<ClosedTradeEntity>> watchRecentTrades();
  Future<void> syncHistory();
  Future<TradeSummaryEntity> getTradeSummary(HistoryPeriod period);
  Future<List<DailyPnlEntity>> getDailyPnl(HistoryPeriod period);
}

abstract class IEaRepository {
  Future<List<EaInstanceEntity>> getAllEaInstances();
  Stream<List<EaInstanceEntity>> watchEaInstances();
  Future<void> saveEaInstance(EaInstanceEntity instance);
  Future<void> updateEaInstance(EaInstanceEntity instance);
  Future<void> deleteEaInstance(String id);
  Future<void> startEa(String id);
  Future<void> stopEa(String id);
  Future<List<EaLogEntity>> getEaLogs(String eaId);
  Stream<List<EaLogEntity>> watchEaLogs(String eaId);
  Future<void> clearEaLogs(String eaId);
  Future<String> uploadEaScript(File scriptFile);
}
