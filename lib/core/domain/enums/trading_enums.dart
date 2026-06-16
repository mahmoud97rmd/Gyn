// Path: lib/core/domain/enums/trading_enums.dart
import 'package:flutter/material.dart';

enum TradeDirection {
  buy,
  sell;

  Color get color => this == TradeDirection.buy ? Colors.green : Colors.red;
  String get oandaValue => this == TradeDirection.buy ? 'LONG' : 'SHORT';
  TradeDirection get opposite =>
      this == TradeDirection.buy ? TradeDirection.sell : TradeDirection.buy;
}

enum OrderType {
  market,
  buyLimit,
  sellLimit,
  buyStop,
  sellStop,
  buyStopLimit,
  sellStopLimit;

  String get oandaType {
    switch (this) {
      case OrderType.market:
        return 'MARKET';
      case OrderType.buyLimit:
      case OrderType.sellLimit:
        return 'LIMIT';
      case OrderType.buyStop:
      case OrderType.sellStop:
        return 'STOP';
      case OrderType.buyStopLimit:
      case OrderType.sellStopLimit:
        return 'STOP_LIMIT';
    }
  }

  TradeDirection get direction {
    if (name.toLowerCase().startsWith('buy') || this == OrderType.market)
      return TradeDirection.buy;
    return TradeDirection.sell;
  }

  bool get isPending => this != OrderType.market;
}

enum OrderStatus {
  pending,
  filled,
  cancelled,
  rejected;

  static OrderStatus fromString(String val) => OrderStatus.values.firstWhere(
      (e) => e.name.toUpperCase() == val.toUpperCase(),
      orElse: () => OrderStatus.rejected);
  Color get color {
    switch (this) {
      case OrderStatus.pending:
        return Colors.orange;
      case OrderStatus.filled:
        return Colors.green;
      case OrderStatus.cancelled:
        return Colors.grey;
      case OrderStatus.rejected:
        return Colors.red;
    }
  }
}

enum CloseReason {
  manual,
  stopLoss,
  takeProfit,
  marginCall,
  ea,
  unknown;

  static CloseReason fromString(String val) => CloseReason.values.firstWhere(
      (e) => e.name.toUpperCase() == val.toUpperCase(),
      orElse: () => CloseReason.unknown);
  Color get color {
    switch (this) {
      case CloseReason.stopLoss:
        return Colors.red;
      case CloseReason.takeProfit:
        return Colors.green;
      default:
        return Colors.blueGrey;
    }
  }
}

enum Timeframe {
  m1,
  m5,
  m10,
  m15,
  m30,
  h1,
  h2,
  h4,
  h6,
  h8,
  h12,
  d1,
  w1,
  mn;

  String get displayName => name.toUpperCase();
  String get oandaGranularity {
    switch (this) {
      case Timeframe.m1:
        return 'M1';
      case Timeframe.m5:
        return 'M5';
      case Timeframe.m10:
        return 'M10';
      case Timeframe.m15:
        return 'M15';
      case Timeframe.m30:
        return 'M30';
      case Timeframe.h1:
        return 'H1';
      case Timeframe.h2:
        return 'H2';
      case Timeframe.h4:
        return 'H4';
      case Timeframe.h6:
        return 'H6';
      case Timeframe.h8:
        return 'H8';
      case Timeframe.h12:
        return 'H12';
      case Timeframe.d1:
        return 'D';
      case Timeframe.w1:
        return 'W';
      case Timeframe.mn:
        return 'M';
    }
  }

  Duration get candleDuration {
    switch (this) {
      case Timeframe.m1:
        return const Duration(minutes: 1);
      case Timeframe.m5:
        return const Duration(minutes: 5);
      case Timeframe.m10:
        return const Duration(minutes: 10);
      case Timeframe.m15:
        return const Duration(minutes: 15);
      case Timeframe.m30:
        return const Duration(minutes: 30);
      case Timeframe.h1:
        return const Duration(hours: 1);
      case Timeframe.h2:
        return const Duration(hours: 2);
      case Timeframe.h4:
        return const Duration(hours: 4);
      case Timeframe.h6:
        return const Duration(hours: 6);
      case Timeframe.h8:
        return const Duration(hours: 8);
      case Timeframe.h12:
        return const Duration(hours: 12);
      case Timeframe.d1:
        return const Duration(days: 1);
      case Timeframe.w1:
        return const Duration(days: 7);
      case Timeframe.mn:
        return const Duration(days: 30);
    }
  }

  int get defaultFetchCount => 300;

  static Timeframe fromString(String val) => Timeframe.values.firstWhere(
      (e) => e.name.toLowerCase() == val.toLowerCase(),
      orElse: () => Timeframe.h1);
}

enum InstrumentType {
  currency,
  cfd,
  metal,
  unknown;

  static InstrumentType fromString(String val) => InstrumentType.values
      .firstWhere((e) => e.name.toUpperCase() == val.toUpperCase(),
          orElse: () => InstrumentType.unknown);
  String get displayName => name.toUpperCase();
}

enum EaStatus {
  idle,
  running,
  paused,
  error,
  stopped;

  static EaStatus fromString(String val) => EaStatus.values.firstWhere(
      (e) => e.name.toUpperCase() == val.toUpperCase(),
      orElse: () => EaStatus.idle);
  Color get color {
    switch (this) {
      case EaStatus.running:
        return Colors.green;
      case EaStatus.error:
        return Colors.red;
      case EaStatus.paused:
        return Colors.orange;
      default:
        return Colors.grey;
    }
  }

  bool get isActive => this == EaStatus.running || this == EaStatus.paused;
}

enum LogLevel {
  debug,
  info,
  warn,
  error,
  critical,
  trade;

  static LogLevel fromString(String val) => LogLevel.values.firstWhere(
      (e) => e.name.toUpperCase() == val.toUpperCase(),
      orElse: () => LogLevel.info);
  Color get color {
    switch (this) {
      case LogLevel.debug:
        return Colors.grey;
      case LogLevel.info:
        return Colors.blue;
      case LogLevel.warn:
        return Colors.orange;
      case LogLevel.error:
        return Colors.red;
      case LogLevel.critical:
        return Colors.purple;
      case LogLevel.trade:
        return Colors.green;
    }
  }

  String get displayName => name.toUpperCase();
}

enum HistoryPeriod {
  today,
  lastWeek,
  lastMonth,
  last3Months,
  lastYear,
  custom;

  String get displayName {
    switch (this) {
      case HistoryPeriod.today:
        return 'Today';
      case HistoryPeriod.lastWeek:
        return 'Last Week';
      case HistoryPeriod.lastMonth:
        return 'Last Month';
      case HistoryPeriod.last3Months:
        return 'Last 3 Months';
      case HistoryPeriod.lastYear:
        return 'Last Year';
      case HistoryPeriod.custom:
        return 'Custom';
    }
  }

  DateTimeRange get dateRange {
    final now = DateTime.now();
    switch (this) {
      case HistoryPeriod.today:
        return DateTimeRange(
            start: DateTime(now.year, now.month, now.day), end: now);
      case HistoryPeriod.lastWeek:
        return DateTimeRange(
            start: now.subtract(const Duration(days: 7)), end: now);
      case HistoryPeriod.lastMonth:
        return DateTimeRange(
            start: now.subtract(const Duration(days: 30)), end: now);
      case HistoryPeriod.last3Months:
        return DateTimeRange(
            start: now.subtract(const Duration(days: 90)), end: now);
      case HistoryPeriod.lastYear:
        return DateTimeRange(
            start: now.subtract(const Duration(days: 365)), end: now);
      case HistoryPeriod.custom:
        return DateTimeRange(start: now, end: now);
    }
  }
}

enum CandleColor {
  bull,
  bear,
  doji;

  factory CandleColor.fromOHLC(double open, double close) {
    if (close > open) return CandleColor.bull;
    if (close < open) return CandleColor.bear;
    return CandleColor.doji;
  }

  Color get color {
    switch (this) {
      case CandleColor.bull:
        return Colors.green;
      case CandleColor.bear:
        return Colors.red;
      case CandleColor.doji:
        return Colors.grey;
    }
  }

  Color get wickColor => color;
}
