import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:drift/drift.dart' hide Column;
import '../../../../core/error/failures.dart';
import '../../../../core/domain/entities/order_entity.dart';
import '../../../../core/domain/entities/position_entity.dart';
import '../../../../core/domain/enums/trading_enums.dart';
import '../../../../core/domain/repositories/repositories.dart';
import '../datasources/oanda_rest_datasource.dart';
import '../mappers/oanda_mappers.dart';
import '../models/trade_order_dto.dart';
import '../../../../core/database/daos/positions_dao.dart';
import '../../../../core/database/daos/orders_dao.dart';
import '../../../../core/database/app_database.dart';
import '../../../../core/database/database_providers.dart';

class TradingRepositoryImpl implements ITradingRepository {
  final OandaRestDataSource _dataSource;
  final PositionsDao _positionsDao;
  final OrdersDao _ordersDao;

  TradingRepositoryImpl(this._dataSource, this._positionsDao, this._ordersDao);

  @override
  Future<PositionEntity> openMarketOrder(
      String symbol, TradeDirection direction, double lots) async {
    try {
      final units = (lots * 100000).toStringAsFixed(0);
      final req = CreateOrderRequestDto(
        order: CreateOrderBodyDto(
          type: 'MARKET',
          instrument: symbol,
          units: direction == TradeDirection.buy ? units : '-$units',
          timeInForce: 'FOK',
          positionFill: 'DEFAULT',
        ),
      );
      await _dataSource.createOrder(req);
      await syncPositions();
      return _positionsDao
          .getAllPositions()
          .then((p) => _positionFromDb(p.last));
    } on DioException catch (e) {
      throw e.error as Failure;
    } catch (e) {
      throw Failure(e.toString());
    }
  }

  @override
  Future<void> closePosition(String tradeId) async {
    try {
      await _dataSource.closeTrade(tradeId, null);
      await syncPositions();
    } on DioException catch (e) {
      throw e.error as Failure;
    }
  }

  @override
  Future<void> modifyPosition(String tradeId,
      {double? stopLoss, double? takeProfit}) async {
    try {
      await _dataSource.modifyTrade(
          tradeId, takeProfit?.toString(), stopLoss?.toString(), 'GTC');
      await syncPositions();
    } on DioException catch (e) {
      throw e.error as Failure;
    }
  }

  @override
  Future<void> closeAllPositions() async {
    try {
      final positions = await _positionsDao.getAllPositions();
      for (final p in positions) {
        await closePosition(p.oandaTradeId);
      }
    } catch (e) {
      throw Failure(e.toString());
    }
  }

  @override
  Future<OrderEntity> placeOrder(String symbol, OrderType type,
      TradeDirection direction, double lots, double price,
      {double? stopLoss, double? takeProfit}) async {
    try {
      final units = (lots * 100000).toStringAsFixed(0);
      final req = CreateOrderRequestDto(
        order: CreateOrderBodyDto(
          type: type.oandaType,
          instrument: symbol,
          units: direction == TradeDirection.buy ? units : '-$units',
          price: price.toString(),
          timeInForce: 'GTC',
          positionFill: 'DEFAULT',
        ),
      );
      await _dataSource.createOrder(req);
      await syncOrders();
      return _ordersDao.getPendingOrders().then((o) => _orderFromDb(o.last));
    } on DioException catch (e) {
      throw e.error as Failure;
    } catch (e) {
      throw Failure(e.toString());
    }
  }

  @override
  Future<void> cancelOrder(String orderId) async {
    try {
      await _dataSource.cancelOrder(orderId);
      await syncOrders();
    } on DioException catch (e) {
      throw e.error as Failure;
    }
  }

  @override
  Future<void> modifyOrder(String orderId,
      {double? price, double? stopLoss, double? takeProfit}) async {
    try {
      await syncOrders();
    } on DioException catch (e) {
      throw e.error as Failure;
    }
  }

  @override
  Stream<List<PositionEntity>> watchOpenPositions() {
    return _positionsDao
        .watchAllPositions()
        .map((list) => list.map(_positionFromDb).toList());
  }

  @override
  Stream<List<OrderEntity>> watchPendingOrders() {
    return _ordersDao
        .watchPendingOrders()
        .map((list) => list.map(_orderFromDb).toList());
  }

  @override
  Future<void> syncPositions() async {
    try {
      final response = await _dataSource.getOpenTrades();
      final trades = PositionMapper.fromTradeDtoList(response.trades);

      final currentDbPos = await _positionsDao.getAllPositions();
      final newIds = trades.map((t) => t.id).toSet();

      for (final p in currentDbPos) {
        if (!newIds.contains(p.oandaTradeId)) {
          await _positionsDao.deletePosition(p.oandaTradeId);
        }
      }

      for (final t in trades) {
        await _positionsDao.updatePosition(_positionToCompanion(t));
      }
    } on DioException catch (e) {
      throw e.error as Failure;
    }
  }

  @override
  Future<void> syncOrders() async {
    try {
      final response = await _dataSource.getPendingOrders();
      final orders = OrderMapper.fromOrderDtoList(response.orders);

      final currentDbOrd = await _ordersDao.getPendingOrders();
      final newIds = orders.map((o) => o.id).toSet();

      for (final o in currentDbOrd) {
        if (!newIds.contains(o.oandaOrderId)) {
          await _ordersDao.deleteOrder(o.oandaOrderId);
        }
      }

      for (final o in orders) {
        await _ordersDao.updateOrder(_orderToCompanion(o));
      }
    } on DioException catch (e) {
      throw e.error as Failure;
    }
  }

  PositionEntity _positionFromDb(PositionsTableData data) {
    return PositionEntity(
      id: data.oandaTradeId,
      oandaTradeId: data.oandaTradeId,
      symbol: data.symbol,
      direction:
          TradeDirection.values.firstWhere((e) => e.name == data.direction),
      lots: data.lots,
      units: data.units,
      openPrice: data.openPrice,
      currentPrice: data.currentPrice,
      stopLoss: data.stopLoss,
      takeProfit: data.takeProfit,
      floatingPnl: data.floatingPnl,
      marginUsed: data.marginUsed,
      swap: data.swap,
      commission: data.commission,
      magicNumber: data.magicNumber,
      comment: data.comment,
      openTimeUs: data.openTimeUs,
    );
  }

  PositionsTableCompanion _positionToCompanion(PositionEntity entity) {
    return PositionsTableCompanion.insert(
      oandaTradeId: entity.oandaTradeId,
      symbol: entity.symbol,
      direction: entity.direction.name,
      lots: entity.lots,
      units: entity.units,
      openPrice: entity.openPrice,
      currentPrice: entity.currentPrice,
      floatingPnl: entity.floatingPnl,
      marginUsed: entity.marginUsed,
      openTimeUs: entity.openTimeUs,
      stopLoss: Value(entity.stopLoss),
      takeProfit: Value(entity.takeProfit),
      magicNumber: entity.magicNumber,
      comment: entity.comment,
      swap: entity.swap,
      commission: entity.commission,
    );
  }

  OrderEntity _orderFromDb(OrdersTableData data) {
    return OrderEntity(
      id: data.oandaOrderId,
      oandaOrderId: data.oandaOrderId,
      symbol: data.symbol,
      orderType: OrderType.values.firstWhere((e) => e.name == data.orderType),
      direction:
          TradeDirection.values.firstWhere((e) => e.name == data.direction),
      lots: data.lots,
      units: data.units,
      price: data.price,
      stopLoss: data.stopLoss,
      takeProfit: data.takeProfit,
      status: OrderStatus.values.firstWhere((e) => e.name == data.status,
          orElse: () => OrderStatus.pending),
      createTimeUs: data.createTimeUs,
      expiryTimeUs: data.expiryTimeUs,
      distanceFromMarket: data.distanceFromMarket,
    );
  }

  OrdersTableCompanion _orderToCompanion(OrderEntity entity) {
    return OrdersTableCompanion.insert(
      oandaOrderId: entity.oandaOrderId,
      symbol: entity.symbol,
      orderType: entity.orderType.name,
      direction: entity.direction.name,
      lots: entity.lots,
      units: entity.units,
      price: entity.price,
      status: entity.status.name,
      createTimeUs: entity.createTimeUs,
      stopLoss: Value(entity.stopLoss),
      takeProfit: Value(entity.takeProfit),
      magicNumber: 0,
      comment: '',
      expiryTimeUs: Value(entity.expiryTimeUs),
      distanceFromMarket: Value(entity.distanceFromMarket),
      lastModifiedUs: entity.createTimeUs,
      timeInForce: 'GTC',
    );
  }
}

final tradingRepositoryProvider = Provider<ITradingRepository>((ref) {
  final dataSource = ref.watch(oandaRestDataSourceProvider);
  final positionsDao = ref.watch(appDatabaseProvider).positionsDao;
  final ordersDao = ref.watch(appDatabaseProvider).ordersDao;
  return TradingRepositoryImpl(dataSource, positionsDao, ordersDao);
});
