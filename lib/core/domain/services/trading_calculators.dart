// Path: lib/core/domain/services/trading_calculators.dart
import 'dart:math';
import '../enums/trading_enums.dart';

class PnlCalculator {
  static double calculateFloatingPnl(TradeDirection direction, double openPrice,
      double currentPrice, double lots, double unitsPerLot, double pipSize) {
    final diff = direction == TradeDirection.buy
        ? currentPrice - openPrice
        : openPrice - currentPrice;
    return (diff / pipSize) * calculatePipValue(lots, unitsPerLot, pipSize);
  }

  static double calculatePnlFromLots(
      double pips, double lots, double unitsPerLot, double pipSize) {
    return pips * calculatePipValue(lots, unitsPerLot, pipSize);
  }

  static double convertPnlToAccountCurrency(double pnl, double exchangeRate) =>
      pnl / exchangeRate; // Simplified
  static double calculateRealizedPnl(TradeDirection direction, double openPrice,
      double closePrice, double lots, double unitsPerLot, double pipSize) {
    return calculateFloatingPnl(
        direction, openPrice, closePrice, lots, unitsPerLot, pipSize);
  }

  static double calculatePnlInPips(TradeDirection direction, double openPrice,
      double closePrice, double pipSize) {
    final diff = direction == TradeDirection.buy
        ? closePrice - openPrice
        : openPrice - closePrice;
    return diff / pipSize;
  }

  static double calculatePipValue(
          double lots, double unitsPerLot, double pipSize) =>
      (lots * unitsPerLot) * pipSize;
}

class MarginCalculator {
  static double calculateRequiredMargin(
      double lots, double currentPrice, double marginRate, double unitsPerLot) {
    return (lots * unitsPerLot) * currentPrice * marginRate;
  }

  static double calculateMarginFromLots(
      double lots, double marginRate, double unitsPerLot) {
    return lots * unitsPerLot * marginRate;
  }

  static double calculateMarginLevel(double equity, double usedMargin) =>
      usedMargin > 0 ? (equity / usedMargin) * 100 : double.infinity;
  static double calculateEquity(double balance, double floatingPnl) =>
      balance + floatingPnl;
  static double calculateFreeMargin(double equity, double usedMargin) =>
      equity - usedMargin;
  static double calculateMaxLots(double freeMargin, double currentPrice,
      double marginRate, double unitsPerLot) {
    if (marginRate == 0 || currentPrice == 0 || unitsPerLot == 0) return 0;
    return freeMargin / (currentPrice * marginRate * unitsPerLot);
  }

  static bool hasSufficientMargin(double requiredMargin, double freeMargin) =>
      freeMargin >= requiredMargin;
}

class PipCalculator {
  static double priceToPips(double price, double pipSize) => price / pipSize;
  static double pipsToPrice(double pips, double pipSize) => pips * pipSize;
  static double calculateSlPrice(TradeDirection direction, double openPrice,
      double pipsRisk, double pipSize) {
    return direction == TradeDirection.buy
        ? openPrice - (pipsRisk * pipSize)
        : openPrice + (pipsRisk * pipSize);
  }

  static double calculateTpPrice(TradeDirection direction, double openPrice,
      double pipsProfit, double pipSize) {
    return direction == TradeDirection.buy
        ? openPrice + (pipsProfit * pipSize)
        : openPrice - (pipsProfit * pipSize);
  }

  static double calculateRiskRewardRatio(double riskPips, double rewardPips) =>
      riskPips > 0 ? rewardPips / riskPips : 0;
  static double calculateLotSizeFromRisk(
      double riskAmount, double riskPips, double pipValuePerLot) {
    if (riskPips == 0 || pipValuePerLot == 0) return 0;
    return riskAmount / (riskPips * pipValuePerLot);
  }

  static double pipSizeFromLocation(int pipLocation) =>
      pow(10, pipLocation).toDouble();
  static bool isValidStopLoss(
      TradeDirection direction, double currentPrice, double slPrice) {
    return direction == TradeDirection.buy
        ? slPrice < currentPrice
        : slPrice > currentPrice;
  }

  static bool isValidTakeProfit(
      TradeDirection direction, double currentPrice, double tpPrice) {
    return direction == TradeDirection.buy
        ? tpPrice > currentPrice
        : tpPrice < currentPrice;
  }
}

class PositionMetrics {
  final double floatingPnl;
  final double marginUsed;
  PositionMetrics(this.floatingPnl, this.marginUsed);
}

class AccountMetrics {
  final double equity;
  final double freeMargin;
  final double marginLevel;
  AccountMetrics(this.equity, this.freeMargin, this.marginLevel);
}

class AccountMathEngineService {
  static AccountMetrics recalculate(
      double balance, List<PositionMetrics> positions) {
    double totalPnl = 0;
    double totalMargin = 0;
    for (var p in positions) {
      totalPnl += p.floatingPnl;
      totalMargin += p.marginUsed;
    }
    final equity = balance + totalPnl;
    final freeMargin = equity - totalMargin;
    final marginLevel =
        totalMargin > 0 ? (equity / totalMargin) * 100 : double.infinity;
    return AccountMetrics(equity, freeMargin, marginLevel);
  }
}
