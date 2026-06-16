// Path: lib/features/trading/data/mappers/oanda_mappers.dart
import 'dart:math';
import '../../../../core/domain/entities/account_entity.dart';
import '../../../../core/domain/entities/candle_entity.dart';
import '../../../../core/domain/entities/closed_trade_entity.dart';
import '../../../../core/domain/entities/order_entity.dart';
import '../../../../core/domain/entities/position_entity.dart';
import '../../../../core/domain/entities/symbol_entity.dart';
import '../../../../core/domain/entities/tick_entity.dart';
import '../../../../core/domain/enums/trading_enums.dart';
import '../../../account/data/models/account_dto.dart';
import '../../../account/data/models/instrument_dto.dart';
import '../models/trade_order_dto.dart';
import '../models/transaction_candle_dto.dart';

class AccountMapper {
  static AccountEntity fromDto(AccountSummaryDto dto) {
    return AccountEntity(
      accountId: dto.id,
      balance: dto.balance,
      equity: dto.nav,
      marginUsed: dto.marginUsed,
      marginAvailable: dto.marginAvailable,
      marginLevel: dto.marginCloseoutPercent * 100, // approximate
      openPositionCount: dto.openPositionCount,
      unrealizedPnl: dto.unrealizedPL,
      totalDailyPnl: dto.pl, // simplified
    );
  }
}

class SymbolMapper {
  static SymbolEntity fromDto(InstrumentDto dto) {
    return SymbolEntity(
      name: dto.name,
      displayName: dto.displayName,
      displayExPrecision: dto.displayPrecision,
      type: dto.type,
      pipLocation: dto.pipLocation.toString(),
      displayPrecision: dto.displayPrecision,
      minimumTradeSize: dto.minimumTradeSize,
      marginRate: dto.marginRate,
      tradeUnitsPrecision: dto.tradeUnitsPrecision,
      isWatchlisted: _isDefaultWatchlisted(dto.name),
    );
  }

  static List<SymbolEntity> fromDtoList(List<InstrumentDto> dtos) {
    return dtos.map(fromDto).toList()
      ..sort((a, b) => _defaultOrder(a.name).compareTo(_defaultOrder(b.name)));
  }

  static bool _isDefaultWatchlisted(String name) {
    const defaultList = ['EUR_USD', 'GBP_USD', 'USD_JPY', 'XAU_USD'];
    return defaultList.contains(name);
  }

  static int _defaultOrder(String name) {
    const defaultList = [
      'EUR_USD',
      'GBP_USD',
      'USD_JPY',
      'USD_CHF',
      'AUD_USD',
      'USD_CAD',
      'NZD_USD',
      'XAU_USD'
    ];
    final idx = defaultList.indexOf(name);
    return idx == -1 ? 999 : idx;
  }
}

class PositionMapper {
  static PositionEntity fromTradeDto(TradeDto dto) {
    final direction =
        dto.initialUnits > 0 ? TradeDirection.buy : TradeDirection.sell;
    final units = dto.currentUnits.abs();
    final lots = units / 100000; // Simplified contract size
    final openTime = DateTime.parse(dto.openTime).microsecondsSinceEpoch;

    return PositionEntity(
      id: dto.id,
      oandaTradeId: dto.id,
      symbol: dto.instrument,
      direction: direction,
      lots: lots,
      units: units,
      openPrice: dto.price,
      currentPrice: dto.price, // Will be updated by tick stream
      stopLoss: dto.stopLossOrder?.price,
      takeProfit: dto.takeProfitOrder?.price,
      floatingPnl: dto.unrealizedPL,
      swap: dto.financing,
      commission: dto.dividendAdjustment,
      marginUsed: dto.marginUsed,
      openTimeUs: openTime,
      magicNumber: _extractMagicNumber(dto.clientExtensions),
      comment: dto.clientExtensions?.comment ?? '',
    );
  }

  static List<PositionEntity> fromTradeDtoList(List<TradeDto> dtos) {
    return dtos.map(fromTradeDto).toList();
  }

  static int _extractMagicNumber(ClientExtensionsDto? ext) {
    if (ext == null || ext.tag.isEmpty) return 0;
    if (ext.tag.startsWith('EA_')) {
      return int.tryParse(ext.tag.substring(3)) ?? 0;
    }
    return 0;
  }
}

class OrderMapper {
  static OrderEntity fromOrderDto(OrderDto dto) {
    final direction = dto.units > 0 ? TradeDirection.buy : TradeDirection.sell;
    final units = dto.units.abs();
    final lots = units / 100000;
    final createTime = DateTime.parse(dto.createTime).microsecondsSinceEpoch;

    return OrderEntity(
      id: dto.id,
      oandaOrderId: dto.id,
      symbol: dto.instrument,
      orderType: _mapOrderType(dto.type, direction),
      direction: direction,
      lots: lots,
      units: units,
      price: dto.price ?? 0.0,
      stopLoss: dto.stopLossOnFill != null
          ? double.tryParse(dto.stopLossOnFill!.price)
          : null,
      takeProfit: dto.takeProfitOnFill != null
          ? double.tryParse(dto.takeProfitOnFill!.price)
          : null,
      status: OrderStatus.pending,
      createTimeUs: createTime,
    );
  }

  static List<OrderEntity> fromOrderDtoList(List<OrderDto> dtos) {
    return dtos.map(fromOrderDto).toList();
  }

  static OrderType _mapOrderType(String type, TradeDirection direction) {
    if (type == 'LIMIT')
      return direction == TradeDirection.buy
          ? OrderType.buyLimit
          : OrderType.sellLimit;
    if (type == 'STOP')
      return direction == TradeDirection.buy
          ? OrderType.buyStop
          : OrderType.sellStop;
    if (type == 'MARKET_IF_TOUCHED')
      return direction == TradeDirection.buy
          ? OrderType.buyLimit
          : OrderType.sellLimit; // Close enough for now
    return OrderType.market;
  }
}

class ClosedTradeMapper {
  static List<ClosedTradeEntity> fromTransaction(TransactionDto dto) {
    if (dto.tradesClosed == null || dto.tradesClosed!.isEmpty) return [];

    final closeTime = DateTime.parse(dto.time).microsecondsSinceEpoch;
    final reason = _mapCloseReason(dto.reason);
    final instrument = dto.instrument ?? '';

    return dto.tradesClosed!.map((tc) {
      final units = double.tryParse(tc.units) ?? 0.0;
      // Actually, units here might be negative if we closed a long position (we sell to close).
      final origDirection =
          units < 0 ? TradeDirection.buy : TradeDirection.sell;
      final absUnits = units.abs();

      return ClosedTradeEntity(
        oandaTradeId: tc.tradeID,
        symbol: instrument,
        direction: origDirection,
        lots: absUnits / 100000,
        units: absUnits,
        openPrice:
            0.0, // Need to get from original open transaction or trade state if possible. Fallback to 0 for now.
        closePrice: double.tryParse(tc.price) ?? 0.0,
        realizedPnl: double.tryParse(tc.realizedPL) ?? 0.0,
        netProfit: (double.tryParse(tc.realizedPL) ?? 0.0) +
            (double.tryParse(tc.financing) ?? 0.0),
        swap: double.tryParse(tc.financing) ?? 0.0,
        commission: 0.0, // Simplified
        closeReason: reason,
        openTimeUs:
            closeTime, // Accurate openTime would need another lookup. Use closeTime temporarily.
        closeTimeUs: closeTime,
        magicNumber: 0,
      );
    }).toList();
  }

  static CloseReason _mapCloseReason(String? reason) {
    if (reason == 'STOP_LOSS_ORDER') return CloseReason.stopLoss;
    if (reason == 'TAKE_PROFIT_ORDER') return CloseReason.takeProfit;
    if (reason == 'MARGIN_CALL') return CloseReason.marginCall;
    return CloseReason.manual;
  }
}

class CandleMapper {
  static CandleEntity fromDto(
      CandleDto dto, String symbol, Timeframe timeframe) {
    return CandleEntity(
      symbol: symbol,
      timeframe: timeframe,
      open: dto.mid.o,
      high: dto.mid.h,
      low: dto.mid.l,
      close: dto.mid.c,
      tickVolume: dto.volume,
      openTimeUs: DateTime.parse(dto.time).microsecondsSinceEpoch,
      isComplete: dto.complete,
    );
  }

  static List<CandleEntity> fromDtoList(
      List<CandleDto> dtos, String symbol, Timeframe timeframe) {
    return dtos.map((dto) => fromDto(dto, symbol, timeframe)).toList();
  }
}

class TickMapper {
  static TickEntity fromPriceDto(PriceDto dto, int pipLocation) {
    final spread = dto.bestAsk - dto.bestBid;
    final pipSize = pow(10, pipLocation).toDouble();
    return TickEntity(
      symbol: dto.instrument,
      bid: dto.bestBid,
      ask: dto.bestAsk,
      spread: spread,
      spreadPips: spread / pipSize,
      dailyHigh: 0.0, // Not provided directly in price stream
      dailyLow: 0.0,
      timestamp: DateTime.parse(dto.time).microsecondsSinceEpoch,
      isLive: true,
    );
  }
}
