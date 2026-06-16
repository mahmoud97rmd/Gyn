// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_database.dart';

// ignore_for_file: type=lint
class $TicksTableTable extends TicksTable
    with TableInfo<$TicksTableTable, Tick> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $TicksTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _symbolMeta = const VerificationMeta('symbol');
  @override
  late final GeneratedColumn<String> symbol = GeneratedColumn<String>(
      'symbol', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _bidMeta = const VerificationMeta('bid');
  @override
  late final GeneratedColumn<double> bid = GeneratedColumn<double>(
      'bid', aliasedName, false,
      type: DriftSqlType.double, requiredDuringInsert: true);
  static const VerificationMeta _askMeta = const VerificationMeta('ask');
  @override
  late final GeneratedColumn<double> ask = GeneratedColumn<double>(
      'ask', aliasedName, false,
      type: DriftSqlType.double, requiredDuringInsert: true);
  static const VerificationMeta _spreadMeta = const VerificationMeta('spread');
  @override
  late final GeneratedColumn<double> spread = GeneratedColumn<double>(
      'spread', aliasedName, false,
      type: DriftSqlType.double, requiredDuringInsert: true);
  static const VerificationMeta _spreadPipsMeta =
      const VerificationMeta('spreadPips');
  @override
  late final GeneratedColumn<double> spreadPips = GeneratedColumn<double>(
      'spread_pips', aliasedName, false,
      type: DriftSqlType.double, requiredDuringInsert: true);
  static const VerificationMeta _dailyHighMeta =
      const VerificationMeta('dailyHigh');
  @override
  late final GeneratedColumn<double> dailyHigh = GeneratedColumn<double>(
      'daily_high', aliasedName, false,
      type: DriftSqlType.double, requiredDuringInsert: true);
  static const VerificationMeta _dailyLowMeta =
      const VerificationMeta('dailyLow');
  @override
  late final GeneratedColumn<double> dailyLow = GeneratedColumn<double>(
      'daily_low', aliasedName, false,
      type: DriftSqlType.double, requiredDuringInsert: true);
  static const VerificationMeta _timestampUsMeta =
      const VerificationMeta('timestampUs');
  @override
  late final GeneratedColumn<int> timestampUs = GeneratedColumn<int>(
      'timestamp_us', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _oandaTimestampMeta =
      const VerificationMeta('oandaTimestamp');
  @override
  late final GeneratedColumn<int> oandaTimestamp = GeneratedColumn<int>(
      'oanda_timestamp', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _isLiveMeta = const VerificationMeta('isLive');
  @override
  late final GeneratedColumn<bool> isLive = GeneratedColumn<bool>(
      'is_live', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('CHECK ("is_live" IN (0, 1))'),
      defaultValue: const Constant(true));
  @override
  List<GeneratedColumn> get $columns => [
        id,
        symbol,
        bid,
        ask,
        spread,
        spreadPips,
        dailyHigh,
        dailyLow,
        timestampUs,
        oandaTimestamp,
        isLive
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'ticks_table';
  @override
  VerificationContext validateIntegrity(Insertable<Tick> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('symbol')) {
      context.handle(_symbolMeta,
          symbol.isAcceptableOrUnknown(data['symbol']!, _symbolMeta));
    } else if (isInserting) {
      context.missing(_symbolMeta);
    }
    if (data.containsKey('bid')) {
      context.handle(
          _bidMeta, bid.isAcceptableOrUnknown(data['bid']!, _bidMeta));
    } else if (isInserting) {
      context.missing(_bidMeta);
    }
    if (data.containsKey('ask')) {
      context.handle(
          _askMeta, ask.isAcceptableOrUnknown(data['ask']!, _askMeta));
    } else if (isInserting) {
      context.missing(_askMeta);
    }
    if (data.containsKey('spread')) {
      context.handle(_spreadMeta,
          spread.isAcceptableOrUnknown(data['spread']!, _spreadMeta));
    } else if (isInserting) {
      context.missing(_spreadMeta);
    }
    if (data.containsKey('spread_pips')) {
      context.handle(
          _spreadPipsMeta,
          spreadPips.isAcceptableOrUnknown(
              data['spread_pips']!, _spreadPipsMeta));
    } else if (isInserting) {
      context.missing(_spreadPipsMeta);
    }
    if (data.containsKey('daily_high')) {
      context.handle(_dailyHighMeta,
          dailyHigh.isAcceptableOrUnknown(data['daily_high']!, _dailyHighMeta));
    } else if (isInserting) {
      context.missing(_dailyHighMeta);
    }
    if (data.containsKey('daily_low')) {
      context.handle(_dailyLowMeta,
          dailyLow.isAcceptableOrUnknown(data['daily_low']!, _dailyLowMeta));
    } else if (isInserting) {
      context.missing(_dailyLowMeta);
    }
    if (data.containsKey('timestamp_us')) {
      context.handle(
          _timestampUsMeta,
          timestampUs.isAcceptableOrUnknown(
              data['timestamp_us']!, _timestampUsMeta));
    } else if (isInserting) {
      context.missing(_timestampUsMeta);
    }
    if (data.containsKey('oanda_timestamp')) {
      context.handle(
          _oandaTimestampMeta,
          oandaTimestamp.isAcceptableOrUnknown(
              data['oanda_timestamp']!, _oandaTimestampMeta));
    } else if (isInserting) {
      context.missing(_oandaTimestampMeta);
    }
    if (data.containsKey('is_live')) {
      context.handle(_isLiveMeta,
          isLive.isAcceptableOrUnknown(data['is_live']!, _isLiveMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Tick map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Tick(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      symbol: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}symbol'])!,
      bid: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}bid'])!,
      ask: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}ask'])!,
      spread: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}spread'])!,
      spreadPips: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}spread_pips'])!,
      dailyHigh: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}daily_high'])!,
      dailyLow: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}daily_low'])!,
      timestampUs: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}timestamp_us'])!,
      oandaTimestamp: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}oanda_timestamp'])!,
      isLive: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}is_live'])!,
    );
  }

  @override
  $TicksTableTable createAlias(String alias) {
    return $TicksTableTable(attachedDatabase, alias);
  }
}

class Tick extends DataClass implements Insertable<Tick> {
  final int id;
  final String symbol;
  final double bid;
  final double ask;
  final double spread;
  final double spreadPips;
  final double dailyHigh;
  final double dailyLow;
  final int timestampUs;
  final int oandaTimestamp;
  final bool isLive;
  const Tick(
      {required this.id,
      required this.symbol,
      required this.bid,
      required this.ask,
      required this.spread,
      required this.spreadPips,
      required this.dailyHigh,
      required this.dailyLow,
      required this.timestampUs,
      required this.oandaTimestamp,
      required this.isLive});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['symbol'] = Variable<String>(symbol);
    map['bid'] = Variable<double>(bid);
    map['ask'] = Variable<double>(ask);
    map['spread'] = Variable<double>(spread);
    map['spread_pips'] = Variable<double>(spreadPips);
    map['daily_high'] = Variable<double>(dailyHigh);
    map['daily_low'] = Variable<double>(dailyLow);
    map['timestamp_us'] = Variable<int>(timestampUs);
    map['oanda_timestamp'] = Variable<int>(oandaTimestamp);
    map['is_live'] = Variable<bool>(isLive);
    return map;
  }

  TicksTableCompanion toCompanion(bool nullToAbsent) {
    return TicksTableCompanion(
      id: Value(id),
      symbol: Value(symbol),
      bid: Value(bid),
      ask: Value(ask),
      spread: Value(spread),
      spreadPips: Value(spreadPips),
      dailyHigh: Value(dailyHigh),
      dailyLow: Value(dailyLow),
      timestampUs: Value(timestampUs),
      oandaTimestamp: Value(oandaTimestamp),
      isLive: Value(isLive),
    );
  }

  factory Tick.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Tick(
      id: serializer.fromJson<int>(json['id']),
      symbol: serializer.fromJson<String>(json['symbol']),
      bid: serializer.fromJson<double>(json['bid']),
      ask: serializer.fromJson<double>(json['ask']),
      spread: serializer.fromJson<double>(json['spread']),
      spreadPips: serializer.fromJson<double>(json['spreadPips']),
      dailyHigh: serializer.fromJson<double>(json['dailyHigh']),
      dailyLow: serializer.fromJson<double>(json['dailyLow']),
      timestampUs: serializer.fromJson<int>(json['timestampUs']),
      oandaTimestamp: serializer.fromJson<int>(json['oandaTimestamp']),
      isLive: serializer.fromJson<bool>(json['isLive']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'symbol': serializer.toJson<String>(symbol),
      'bid': serializer.toJson<double>(bid),
      'ask': serializer.toJson<double>(ask),
      'spread': serializer.toJson<double>(spread),
      'spreadPips': serializer.toJson<double>(spreadPips),
      'dailyHigh': serializer.toJson<double>(dailyHigh),
      'dailyLow': serializer.toJson<double>(dailyLow),
      'timestampUs': serializer.toJson<int>(timestampUs),
      'oandaTimestamp': serializer.toJson<int>(oandaTimestamp),
      'isLive': serializer.toJson<bool>(isLive),
    };
  }

  Tick copyWith(
          {int? id,
          String? symbol,
          double? bid,
          double? ask,
          double? spread,
          double? spreadPips,
          double? dailyHigh,
          double? dailyLow,
          int? timestampUs,
          int? oandaTimestamp,
          bool? isLive}) =>
      Tick(
        id: id ?? this.id,
        symbol: symbol ?? this.symbol,
        bid: bid ?? this.bid,
        ask: ask ?? this.ask,
        spread: spread ?? this.spread,
        spreadPips: spreadPips ?? this.spreadPips,
        dailyHigh: dailyHigh ?? this.dailyHigh,
        dailyLow: dailyLow ?? this.dailyLow,
        timestampUs: timestampUs ?? this.timestampUs,
        oandaTimestamp: oandaTimestamp ?? this.oandaTimestamp,
        isLive: isLive ?? this.isLive,
      );
  Tick copyWithCompanion(TicksTableCompanion data) {
    return Tick(
      id: data.id.present ? data.id.value : this.id,
      symbol: data.symbol.present ? data.symbol.value : this.symbol,
      bid: data.bid.present ? data.bid.value : this.bid,
      ask: data.ask.present ? data.ask.value : this.ask,
      spread: data.spread.present ? data.spread.value : this.spread,
      spreadPips:
          data.spreadPips.present ? data.spreadPips.value : this.spreadPips,
      dailyHigh: data.dailyHigh.present ? data.dailyHigh.value : this.dailyHigh,
      dailyLow: data.dailyLow.present ? data.dailyLow.value : this.dailyLow,
      timestampUs:
          data.timestampUs.present ? data.timestampUs.value : this.timestampUs,
      oandaTimestamp: data.oandaTimestamp.present
          ? data.oandaTimestamp.value
          : this.oandaTimestamp,
      isLive: data.isLive.present ? data.isLive.value : this.isLive,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Tick(')
          ..write('id: $id, ')
          ..write('symbol: $symbol, ')
          ..write('bid: $bid, ')
          ..write('ask: $ask, ')
          ..write('spread: $spread, ')
          ..write('spreadPips: $spreadPips, ')
          ..write('dailyHigh: $dailyHigh, ')
          ..write('dailyLow: $dailyLow, ')
          ..write('timestampUs: $timestampUs, ')
          ..write('oandaTimestamp: $oandaTimestamp, ')
          ..write('isLive: $isLive')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, symbol, bid, ask, spread, spreadPips,
      dailyHigh, dailyLow, timestampUs, oandaTimestamp, isLive);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Tick &&
          other.id == this.id &&
          other.symbol == this.symbol &&
          other.bid == this.bid &&
          other.ask == this.ask &&
          other.spread == this.spread &&
          other.spreadPips == this.spreadPips &&
          other.dailyHigh == this.dailyHigh &&
          other.dailyLow == this.dailyLow &&
          other.timestampUs == this.timestampUs &&
          other.oandaTimestamp == this.oandaTimestamp &&
          other.isLive == this.isLive);
}

class TicksTableCompanion extends UpdateCompanion<Tick> {
  final Value<int> id;
  final Value<String> symbol;
  final Value<double> bid;
  final Value<double> ask;
  final Value<double> spread;
  final Value<double> spreadPips;
  final Value<double> dailyHigh;
  final Value<double> dailyLow;
  final Value<int> timestampUs;
  final Value<int> oandaTimestamp;
  final Value<bool> isLive;
  const TicksTableCompanion({
    this.id = const Value.absent(),
    this.symbol = const Value.absent(),
    this.bid = const Value.absent(),
    this.ask = const Value.absent(),
    this.spread = const Value.absent(),
    this.spreadPips = const Value.absent(),
    this.dailyHigh = const Value.absent(),
    this.dailyLow = const Value.absent(),
    this.timestampUs = const Value.absent(),
    this.oandaTimestamp = const Value.absent(),
    this.isLive = const Value.absent(),
  });
  TicksTableCompanion.insert({
    this.id = const Value.absent(),
    required String symbol,
    required double bid,
    required double ask,
    required double spread,
    required double spreadPips,
    required double dailyHigh,
    required double dailyLow,
    required int timestampUs,
    required int oandaTimestamp,
    this.isLive = const Value.absent(),
  })  : symbol = Value(symbol),
        bid = Value(bid),
        ask = Value(ask),
        spread = Value(spread),
        spreadPips = Value(spreadPips),
        dailyHigh = Value(dailyHigh),
        dailyLow = Value(dailyLow),
        timestampUs = Value(timestampUs),
        oandaTimestamp = Value(oandaTimestamp);
  static Insertable<Tick> custom({
    Expression<int>? id,
    Expression<String>? symbol,
    Expression<double>? bid,
    Expression<double>? ask,
    Expression<double>? spread,
    Expression<double>? spreadPips,
    Expression<double>? dailyHigh,
    Expression<double>? dailyLow,
    Expression<int>? timestampUs,
    Expression<int>? oandaTimestamp,
    Expression<bool>? isLive,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (symbol != null) 'symbol': symbol,
      if (bid != null) 'bid': bid,
      if (ask != null) 'ask': ask,
      if (spread != null) 'spread': spread,
      if (spreadPips != null) 'spread_pips': spreadPips,
      if (dailyHigh != null) 'daily_high': dailyHigh,
      if (dailyLow != null) 'daily_low': dailyLow,
      if (timestampUs != null) 'timestamp_us': timestampUs,
      if (oandaTimestamp != null) 'oanda_timestamp': oandaTimestamp,
      if (isLive != null) 'is_live': isLive,
    });
  }

  TicksTableCompanion copyWith(
      {Value<int>? id,
      Value<String>? symbol,
      Value<double>? bid,
      Value<double>? ask,
      Value<double>? spread,
      Value<double>? spreadPips,
      Value<double>? dailyHigh,
      Value<double>? dailyLow,
      Value<int>? timestampUs,
      Value<int>? oandaTimestamp,
      Value<bool>? isLive}) {
    return TicksTableCompanion(
      id: id ?? this.id,
      symbol: symbol ?? this.symbol,
      bid: bid ?? this.bid,
      ask: ask ?? this.ask,
      spread: spread ?? this.spread,
      spreadPips: spreadPips ?? this.spreadPips,
      dailyHigh: dailyHigh ?? this.dailyHigh,
      dailyLow: dailyLow ?? this.dailyLow,
      timestampUs: timestampUs ?? this.timestampUs,
      oandaTimestamp: oandaTimestamp ?? this.oandaTimestamp,
      isLive: isLive ?? this.isLive,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (symbol.present) {
      map['symbol'] = Variable<String>(symbol.value);
    }
    if (bid.present) {
      map['bid'] = Variable<double>(bid.value);
    }
    if (ask.present) {
      map['ask'] = Variable<double>(ask.value);
    }
    if (spread.present) {
      map['spread'] = Variable<double>(spread.value);
    }
    if (spreadPips.present) {
      map['spread_pips'] = Variable<double>(spreadPips.value);
    }
    if (dailyHigh.present) {
      map['daily_high'] = Variable<double>(dailyHigh.value);
    }
    if (dailyLow.present) {
      map['daily_low'] = Variable<double>(dailyLow.value);
    }
    if (timestampUs.present) {
      map['timestamp_us'] = Variable<int>(timestampUs.value);
    }
    if (oandaTimestamp.present) {
      map['oanda_timestamp'] = Variable<int>(oandaTimestamp.value);
    }
    if (isLive.present) {
      map['is_live'] = Variable<bool>(isLive.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('TicksTableCompanion(')
          ..write('id: $id, ')
          ..write('symbol: $symbol, ')
          ..write('bid: $bid, ')
          ..write('ask: $ask, ')
          ..write('spread: $spread, ')
          ..write('spreadPips: $spreadPips, ')
          ..write('dailyHigh: $dailyHigh, ')
          ..write('dailyLow: $dailyLow, ')
          ..write('timestampUs: $timestampUs, ')
          ..write('oandaTimestamp: $oandaTimestamp, ')
          ..write('isLive: $isLive')
          ..write(')'))
        .toString();
  }
}

class $SymbolsTableTable extends SymbolsTable
    with TableInfo<$SymbolsTableTable, SymbolsTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $SymbolsTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _displayNameMeta =
      const VerificationMeta('displayName');
  @override
  late final GeneratedColumn<String> displayName = GeneratedColumn<String>(
      'display_name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _displayExPrecisionMeta =
      const VerificationMeta('displayExPrecision');
  @override
  late final GeneratedColumn<int> displayExPrecision = GeneratedColumn<int>(
      'display_ex_precision', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _typeMeta = const VerificationMeta('type');
  @override
  late final GeneratedColumn<String> type = GeneratedColumn<String>(
      'type', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _pipLocationMeta =
      const VerificationMeta('pipLocation');
  @override
  late final GeneratedColumn<String> pipLocation = GeneratedColumn<String>(
      'pip_location', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _displayPrecisionMeta =
      const VerificationMeta('displayPrecision');
  @override
  late final GeneratedColumn<int> displayPrecision = GeneratedColumn<int>(
      'display_precision', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _minimumTradeSizeMeta =
      const VerificationMeta('minimumTradeSize');
  @override
  late final GeneratedColumn<double> minimumTradeSize = GeneratedColumn<double>(
      'minimum_trade_size', aliasedName, false,
      type: DriftSqlType.double, requiredDuringInsert: true);
  static const VerificationMeta _marginRateMeta =
      const VerificationMeta('marginRate');
  @override
  late final GeneratedColumn<double> marginRate = GeneratedColumn<double>(
      'margin_rate', aliasedName, false,
      type: DriftSqlType.double, requiredDuringInsert: true);
  static const VerificationMeta _tradeUnitsPrecisionMeta =
      const VerificationMeta('tradeUnitsPrecision');
  @override
  late final GeneratedColumn<int> tradeUnitsPrecision = GeneratedColumn<int>(
      'trade_units_precision', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _isWatchlistedMeta =
      const VerificationMeta('isWatchlisted');
  @override
  late final GeneratedColumn<bool> isWatchlisted = GeneratedColumn<bool>(
      'is_watchlisted', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'CHECK ("is_watchlisted" IN (0, 1))'),
      defaultValue: const Constant(false));
  static const VerificationMeta _watchlistSortOrderMeta =
      const VerificationMeta('watchlistSortOrder');
  @override
  late final GeneratedColumn<int> watchlistSortOrder = GeneratedColumn<int>(
      'watchlist_sort_order', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultValue: const Constant(0));
  static const VerificationMeta _lastUpdatedUsMeta =
      const VerificationMeta('lastUpdatedUs');
  @override
  late final GeneratedColumn<int> lastUpdatedUs = GeneratedColumn<int>(
      'last_updated_us', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [
        name,
        displayName,
        displayExPrecision,
        type,
        pipLocation,
        displayPrecision,
        minimumTradeSize,
        marginRate,
        tradeUnitsPrecision,
        isWatchlisted,
        watchlistSortOrder,
        lastUpdatedUs
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'symbols_table';
  @override
  VerificationContext validateIntegrity(Insertable<SymbolsTableData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('display_name')) {
      context.handle(
          _displayNameMeta,
          displayName.isAcceptableOrUnknown(
              data['display_name']!, _displayNameMeta));
    } else if (isInserting) {
      context.missing(_displayNameMeta);
    }
    if (data.containsKey('display_ex_precision')) {
      context.handle(
          _displayExPrecisionMeta,
          displayExPrecision.isAcceptableOrUnknown(
              data['display_ex_precision']!, _displayExPrecisionMeta));
    } else if (isInserting) {
      context.missing(_displayExPrecisionMeta);
    }
    if (data.containsKey('type')) {
      context.handle(
          _typeMeta, type.isAcceptableOrUnknown(data['type']!, _typeMeta));
    } else if (isInserting) {
      context.missing(_typeMeta);
    }
    if (data.containsKey('pip_location')) {
      context.handle(
          _pipLocationMeta,
          pipLocation.isAcceptableOrUnknown(
              data['pip_location']!, _pipLocationMeta));
    } else if (isInserting) {
      context.missing(_pipLocationMeta);
    }
    if (data.containsKey('display_precision')) {
      context.handle(
          _displayPrecisionMeta,
          displayPrecision.isAcceptableOrUnknown(
              data['display_precision']!, _displayPrecisionMeta));
    } else if (isInserting) {
      context.missing(_displayPrecisionMeta);
    }
    if (data.containsKey('minimum_trade_size')) {
      context.handle(
          _minimumTradeSizeMeta,
          minimumTradeSize.isAcceptableOrUnknown(
              data['minimum_trade_size']!, _minimumTradeSizeMeta));
    } else if (isInserting) {
      context.missing(_minimumTradeSizeMeta);
    }
    if (data.containsKey('margin_rate')) {
      context.handle(
          _marginRateMeta,
          marginRate.isAcceptableOrUnknown(
              data['margin_rate']!, _marginRateMeta));
    } else if (isInserting) {
      context.missing(_marginRateMeta);
    }
    if (data.containsKey('trade_units_precision')) {
      context.handle(
          _tradeUnitsPrecisionMeta,
          tradeUnitsPrecision.isAcceptableOrUnknown(
              data['trade_units_precision']!, _tradeUnitsPrecisionMeta));
    } else if (isInserting) {
      context.missing(_tradeUnitsPrecisionMeta);
    }
    if (data.containsKey('is_watchlisted')) {
      context.handle(
          _isWatchlistedMeta,
          isWatchlisted.isAcceptableOrUnknown(
              data['is_watchlisted']!, _isWatchlistedMeta));
    }
    if (data.containsKey('watchlist_sort_order')) {
      context.handle(
          _watchlistSortOrderMeta,
          watchlistSortOrder.isAcceptableOrUnknown(
              data['watchlist_sort_order']!, _watchlistSortOrderMeta));
    }
    if (data.containsKey('last_updated_us')) {
      context.handle(
          _lastUpdatedUsMeta,
          lastUpdatedUs.isAcceptableOrUnknown(
              data['last_updated_us']!, _lastUpdatedUsMeta));
    } else if (isInserting) {
      context.missing(_lastUpdatedUsMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {name};
  @override
  SymbolsTableData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return SymbolsTableData(
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
      displayName: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}display_name'])!,
      displayExPrecision: attachedDatabase.typeMapping.read(
          DriftSqlType.int, data['${effectivePrefix}display_ex_precision'])!,
      type: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}type'])!,
      pipLocation: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}pip_location'])!,
      displayPrecision: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}display_precision'])!,
      minimumTradeSize: attachedDatabase.typeMapping.read(
          DriftSqlType.double, data['${effectivePrefix}minimum_trade_size'])!,
      marginRate: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}margin_rate'])!,
      tradeUnitsPrecision: attachedDatabase.typeMapping.read(
          DriftSqlType.int, data['${effectivePrefix}trade_units_precision'])!,
      isWatchlisted: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}is_watchlisted'])!,
      watchlistSortOrder: attachedDatabase.typeMapping.read(
          DriftSqlType.int, data['${effectivePrefix}watchlist_sort_order'])!,
      lastUpdatedUs: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}last_updated_us'])!,
    );
  }

  @override
  $SymbolsTableTable createAlias(String alias) {
    return $SymbolsTableTable(attachedDatabase, alias);
  }
}

class SymbolsTableData extends DataClass
    implements Insertable<SymbolsTableData> {
  final String name;
  final String displayName;
  final int displayExPrecision;
  final String type;
  final String pipLocation;
  final int displayPrecision;
  final double minimumTradeSize;
  final double marginRate;
  final int tradeUnitsPrecision;
  final bool isWatchlisted;
  final int watchlistSortOrder;
  final int lastUpdatedUs;
  const SymbolsTableData(
      {required this.name,
      required this.displayName,
      required this.displayExPrecision,
      required this.type,
      required this.pipLocation,
      required this.displayPrecision,
      required this.minimumTradeSize,
      required this.marginRate,
      required this.tradeUnitsPrecision,
      required this.isWatchlisted,
      required this.watchlistSortOrder,
      required this.lastUpdatedUs});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['name'] = Variable<String>(name);
    map['display_name'] = Variable<String>(displayName);
    map['display_ex_precision'] = Variable<int>(displayExPrecision);
    map['type'] = Variable<String>(type);
    map['pip_location'] = Variable<String>(pipLocation);
    map['display_precision'] = Variable<int>(displayPrecision);
    map['minimum_trade_size'] = Variable<double>(minimumTradeSize);
    map['margin_rate'] = Variable<double>(marginRate);
    map['trade_units_precision'] = Variable<int>(tradeUnitsPrecision);
    map['is_watchlisted'] = Variable<bool>(isWatchlisted);
    map['watchlist_sort_order'] = Variable<int>(watchlistSortOrder);
    map['last_updated_us'] = Variable<int>(lastUpdatedUs);
    return map;
  }

  SymbolsTableCompanion toCompanion(bool nullToAbsent) {
    return SymbolsTableCompanion(
      name: Value(name),
      displayName: Value(displayName),
      displayExPrecision: Value(displayExPrecision),
      type: Value(type),
      pipLocation: Value(pipLocation),
      displayPrecision: Value(displayPrecision),
      minimumTradeSize: Value(minimumTradeSize),
      marginRate: Value(marginRate),
      tradeUnitsPrecision: Value(tradeUnitsPrecision),
      isWatchlisted: Value(isWatchlisted),
      watchlistSortOrder: Value(watchlistSortOrder),
      lastUpdatedUs: Value(lastUpdatedUs),
    );
  }

  factory SymbolsTableData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return SymbolsTableData(
      name: serializer.fromJson<String>(json['name']),
      displayName: serializer.fromJson<String>(json['displayName']),
      displayExPrecision: serializer.fromJson<int>(json['displayExPrecision']),
      type: serializer.fromJson<String>(json['type']),
      pipLocation: serializer.fromJson<String>(json['pipLocation']),
      displayPrecision: serializer.fromJson<int>(json['displayPrecision']),
      minimumTradeSize: serializer.fromJson<double>(json['minimumTradeSize']),
      marginRate: serializer.fromJson<double>(json['marginRate']),
      tradeUnitsPrecision:
          serializer.fromJson<int>(json['tradeUnitsPrecision']),
      isWatchlisted: serializer.fromJson<bool>(json['isWatchlisted']),
      watchlistSortOrder: serializer.fromJson<int>(json['watchlistSortOrder']),
      lastUpdatedUs: serializer.fromJson<int>(json['lastUpdatedUs']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'name': serializer.toJson<String>(name),
      'displayName': serializer.toJson<String>(displayName),
      'displayExPrecision': serializer.toJson<int>(displayExPrecision),
      'type': serializer.toJson<String>(type),
      'pipLocation': serializer.toJson<String>(pipLocation),
      'displayPrecision': serializer.toJson<int>(displayPrecision),
      'minimumTradeSize': serializer.toJson<double>(minimumTradeSize),
      'marginRate': serializer.toJson<double>(marginRate),
      'tradeUnitsPrecision': serializer.toJson<int>(tradeUnitsPrecision),
      'isWatchlisted': serializer.toJson<bool>(isWatchlisted),
      'watchlistSortOrder': serializer.toJson<int>(watchlistSortOrder),
      'lastUpdatedUs': serializer.toJson<int>(lastUpdatedUs),
    };
  }

  SymbolsTableData copyWith(
          {String? name,
          String? displayName,
          int? displayExPrecision,
          String? type,
          String? pipLocation,
          int? displayPrecision,
          double? minimumTradeSize,
          double? marginRate,
          int? tradeUnitsPrecision,
          bool? isWatchlisted,
          int? watchlistSortOrder,
          int? lastUpdatedUs}) =>
      SymbolsTableData(
        name: name ?? this.name,
        displayName: displayName ?? this.displayName,
        displayExPrecision: displayExPrecision ?? this.displayExPrecision,
        type: type ?? this.type,
        pipLocation: pipLocation ?? this.pipLocation,
        displayPrecision: displayPrecision ?? this.displayPrecision,
        minimumTradeSize: minimumTradeSize ?? this.minimumTradeSize,
        marginRate: marginRate ?? this.marginRate,
        tradeUnitsPrecision: tradeUnitsPrecision ?? this.tradeUnitsPrecision,
        isWatchlisted: isWatchlisted ?? this.isWatchlisted,
        watchlistSortOrder: watchlistSortOrder ?? this.watchlistSortOrder,
        lastUpdatedUs: lastUpdatedUs ?? this.lastUpdatedUs,
      );
  SymbolsTableData copyWithCompanion(SymbolsTableCompanion data) {
    return SymbolsTableData(
      name: data.name.present ? data.name.value : this.name,
      displayName:
          data.displayName.present ? data.displayName.value : this.displayName,
      displayExPrecision: data.displayExPrecision.present
          ? data.displayExPrecision.value
          : this.displayExPrecision,
      type: data.type.present ? data.type.value : this.type,
      pipLocation:
          data.pipLocation.present ? data.pipLocation.value : this.pipLocation,
      displayPrecision: data.displayPrecision.present
          ? data.displayPrecision.value
          : this.displayPrecision,
      minimumTradeSize: data.minimumTradeSize.present
          ? data.minimumTradeSize.value
          : this.minimumTradeSize,
      marginRate:
          data.marginRate.present ? data.marginRate.value : this.marginRate,
      tradeUnitsPrecision: data.tradeUnitsPrecision.present
          ? data.tradeUnitsPrecision.value
          : this.tradeUnitsPrecision,
      isWatchlisted: data.isWatchlisted.present
          ? data.isWatchlisted.value
          : this.isWatchlisted,
      watchlistSortOrder: data.watchlistSortOrder.present
          ? data.watchlistSortOrder.value
          : this.watchlistSortOrder,
      lastUpdatedUs: data.lastUpdatedUs.present
          ? data.lastUpdatedUs.value
          : this.lastUpdatedUs,
    );
  }

  @override
  String toString() {
    return (StringBuffer('SymbolsTableData(')
          ..write('name: $name, ')
          ..write('displayName: $displayName, ')
          ..write('displayExPrecision: $displayExPrecision, ')
          ..write('type: $type, ')
          ..write('pipLocation: $pipLocation, ')
          ..write('displayPrecision: $displayPrecision, ')
          ..write('minimumTradeSize: $minimumTradeSize, ')
          ..write('marginRate: $marginRate, ')
          ..write('tradeUnitsPrecision: $tradeUnitsPrecision, ')
          ..write('isWatchlisted: $isWatchlisted, ')
          ..write('watchlistSortOrder: $watchlistSortOrder, ')
          ..write('lastUpdatedUs: $lastUpdatedUs')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      name,
      displayName,
      displayExPrecision,
      type,
      pipLocation,
      displayPrecision,
      minimumTradeSize,
      marginRate,
      tradeUnitsPrecision,
      isWatchlisted,
      watchlistSortOrder,
      lastUpdatedUs);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is SymbolsTableData &&
          other.name == this.name &&
          other.displayName == this.displayName &&
          other.displayExPrecision == this.displayExPrecision &&
          other.type == this.type &&
          other.pipLocation == this.pipLocation &&
          other.displayPrecision == this.displayPrecision &&
          other.minimumTradeSize == this.minimumTradeSize &&
          other.marginRate == this.marginRate &&
          other.tradeUnitsPrecision == this.tradeUnitsPrecision &&
          other.isWatchlisted == this.isWatchlisted &&
          other.watchlistSortOrder == this.watchlistSortOrder &&
          other.lastUpdatedUs == this.lastUpdatedUs);
}

class SymbolsTableCompanion extends UpdateCompanion<SymbolsTableData> {
  final Value<String> name;
  final Value<String> displayName;
  final Value<int> displayExPrecision;
  final Value<String> type;
  final Value<String> pipLocation;
  final Value<int> displayPrecision;
  final Value<double> minimumTradeSize;
  final Value<double> marginRate;
  final Value<int> tradeUnitsPrecision;
  final Value<bool> isWatchlisted;
  final Value<int> watchlistSortOrder;
  final Value<int> lastUpdatedUs;
  final Value<int> rowid;
  const SymbolsTableCompanion({
    this.name = const Value.absent(),
    this.displayName = const Value.absent(),
    this.displayExPrecision = const Value.absent(),
    this.type = const Value.absent(),
    this.pipLocation = const Value.absent(),
    this.displayPrecision = const Value.absent(),
    this.minimumTradeSize = const Value.absent(),
    this.marginRate = const Value.absent(),
    this.tradeUnitsPrecision = const Value.absent(),
    this.isWatchlisted = const Value.absent(),
    this.watchlistSortOrder = const Value.absent(),
    this.lastUpdatedUs = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  SymbolsTableCompanion.insert({
    required String name,
    required String displayName,
    required int displayExPrecision,
    required String type,
    required String pipLocation,
    required int displayPrecision,
    required double minimumTradeSize,
    required double marginRate,
    required int tradeUnitsPrecision,
    this.isWatchlisted = const Value.absent(),
    this.watchlistSortOrder = const Value.absent(),
    required int lastUpdatedUs,
    this.rowid = const Value.absent(),
  })  : name = Value(name),
        displayName = Value(displayName),
        displayExPrecision = Value(displayExPrecision),
        type = Value(type),
        pipLocation = Value(pipLocation),
        displayPrecision = Value(displayPrecision),
        minimumTradeSize = Value(minimumTradeSize),
        marginRate = Value(marginRate),
        tradeUnitsPrecision = Value(tradeUnitsPrecision),
        lastUpdatedUs = Value(lastUpdatedUs);
  static Insertable<SymbolsTableData> custom({
    Expression<String>? name,
    Expression<String>? displayName,
    Expression<int>? displayExPrecision,
    Expression<String>? type,
    Expression<String>? pipLocation,
    Expression<int>? displayPrecision,
    Expression<double>? minimumTradeSize,
    Expression<double>? marginRate,
    Expression<int>? tradeUnitsPrecision,
    Expression<bool>? isWatchlisted,
    Expression<int>? watchlistSortOrder,
    Expression<int>? lastUpdatedUs,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (name != null) 'name': name,
      if (displayName != null) 'display_name': displayName,
      if (displayExPrecision != null)
        'display_ex_precision': displayExPrecision,
      if (type != null) 'type': type,
      if (pipLocation != null) 'pip_location': pipLocation,
      if (displayPrecision != null) 'display_precision': displayPrecision,
      if (minimumTradeSize != null) 'minimum_trade_size': minimumTradeSize,
      if (marginRate != null) 'margin_rate': marginRate,
      if (tradeUnitsPrecision != null)
        'trade_units_precision': tradeUnitsPrecision,
      if (isWatchlisted != null) 'is_watchlisted': isWatchlisted,
      if (watchlistSortOrder != null)
        'watchlist_sort_order': watchlistSortOrder,
      if (lastUpdatedUs != null) 'last_updated_us': lastUpdatedUs,
      if (rowid != null) 'rowid': rowid,
    });
  }

  SymbolsTableCompanion copyWith(
      {Value<String>? name,
      Value<String>? displayName,
      Value<int>? displayExPrecision,
      Value<String>? type,
      Value<String>? pipLocation,
      Value<int>? displayPrecision,
      Value<double>? minimumTradeSize,
      Value<double>? marginRate,
      Value<int>? tradeUnitsPrecision,
      Value<bool>? isWatchlisted,
      Value<int>? watchlistSortOrder,
      Value<int>? lastUpdatedUs,
      Value<int>? rowid}) {
    return SymbolsTableCompanion(
      name: name ?? this.name,
      displayName: displayName ?? this.displayName,
      displayExPrecision: displayExPrecision ?? this.displayExPrecision,
      type: type ?? this.type,
      pipLocation: pipLocation ?? this.pipLocation,
      displayPrecision: displayPrecision ?? this.displayPrecision,
      minimumTradeSize: minimumTradeSize ?? this.minimumTradeSize,
      marginRate: marginRate ?? this.marginRate,
      tradeUnitsPrecision: tradeUnitsPrecision ?? this.tradeUnitsPrecision,
      isWatchlisted: isWatchlisted ?? this.isWatchlisted,
      watchlistSortOrder: watchlistSortOrder ?? this.watchlistSortOrder,
      lastUpdatedUs: lastUpdatedUs ?? this.lastUpdatedUs,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (displayName.present) {
      map['display_name'] = Variable<String>(displayName.value);
    }
    if (displayExPrecision.present) {
      map['display_ex_precision'] = Variable<int>(displayExPrecision.value);
    }
    if (type.present) {
      map['type'] = Variable<String>(type.value);
    }
    if (pipLocation.present) {
      map['pip_location'] = Variable<String>(pipLocation.value);
    }
    if (displayPrecision.present) {
      map['display_precision'] = Variable<int>(displayPrecision.value);
    }
    if (minimumTradeSize.present) {
      map['minimum_trade_size'] = Variable<double>(minimumTradeSize.value);
    }
    if (marginRate.present) {
      map['margin_rate'] = Variable<double>(marginRate.value);
    }
    if (tradeUnitsPrecision.present) {
      map['trade_units_precision'] = Variable<int>(tradeUnitsPrecision.value);
    }
    if (isWatchlisted.present) {
      map['is_watchlisted'] = Variable<bool>(isWatchlisted.value);
    }
    if (watchlistSortOrder.present) {
      map['watchlist_sort_order'] = Variable<int>(watchlistSortOrder.value);
    }
    if (lastUpdatedUs.present) {
      map['last_updated_us'] = Variable<int>(lastUpdatedUs.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('SymbolsTableCompanion(')
          ..write('name: $name, ')
          ..write('displayName: $displayName, ')
          ..write('displayExPrecision: $displayExPrecision, ')
          ..write('type: $type, ')
          ..write('pipLocation: $pipLocation, ')
          ..write('displayPrecision: $displayPrecision, ')
          ..write('minimumTradeSize: $minimumTradeSize, ')
          ..write('marginRate: $marginRate, ')
          ..write('tradeUnitsPrecision: $tradeUnitsPrecision, ')
          ..write('isWatchlisted: $isWatchlisted, ')
          ..write('watchlistSortOrder: $watchlistSortOrder, ')
          ..write('lastUpdatedUs: $lastUpdatedUs, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $PositionsTableTable extends PositionsTable
    with TableInfo<$PositionsTableTable, PositionsTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $PositionsTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _oandaTradeIdMeta =
      const VerificationMeta('oandaTradeId');
  @override
  late final GeneratedColumn<String> oandaTradeId = GeneratedColumn<String>(
      'oanda_trade_id', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      defaultConstraints: GeneratedColumn.constraintIsAlways('UNIQUE'));
  static const VerificationMeta _symbolMeta = const VerificationMeta('symbol');
  @override
  late final GeneratedColumn<String> symbol = GeneratedColumn<String>(
      'symbol', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _directionMeta =
      const VerificationMeta('direction');
  @override
  late final GeneratedColumn<String> direction = GeneratedColumn<String>(
      'direction', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _lotsMeta = const VerificationMeta('lots');
  @override
  late final GeneratedColumn<double> lots = GeneratedColumn<double>(
      'lots', aliasedName, false,
      type: DriftSqlType.double, requiredDuringInsert: true);
  static const VerificationMeta _unitsMeta = const VerificationMeta('units');
  @override
  late final GeneratedColumn<double> units = GeneratedColumn<double>(
      'units', aliasedName, false,
      type: DriftSqlType.double, requiredDuringInsert: true);
  static const VerificationMeta _openPriceMeta =
      const VerificationMeta('openPrice');
  @override
  late final GeneratedColumn<double> openPrice = GeneratedColumn<double>(
      'open_price', aliasedName, false,
      type: DriftSqlType.double, requiredDuringInsert: true);
  static const VerificationMeta _currentPriceMeta =
      const VerificationMeta('currentPrice');
  @override
  late final GeneratedColumn<double> currentPrice = GeneratedColumn<double>(
      'current_price', aliasedName, false,
      type: DriftSqlType.double, requiredDuringInsert: true);
  static const VerificationMeta _stopLossMeta =
      const VerificationMeta('stopLoss');
  @override
  late final GeneratedColumn<double> stopLoss = GeneratedColumn<double>(
      'stop_loss', aliasedName, true,
      type: DriftSqlType.double, requiredDuringInsert: false);
  static const VerificationMeta _takeProfitMeta =
      const VerificationMeta('takeProfit');
  @override
  late final GeneratedColumn<double> takeProfit = GeneratedColumn<double>(
      'take_profit', aliasedName, true,
      type: DriftSqlType.double, requiredDuringInsert: false);
  static const VerificationMeta _floatingPnlMeta =
      const VerificationMeta('floatingPnl');
  @override
  late final GeneratedColumn<double> floatingPnl = GeneratedColumn<double>(
      'floating_pnl', aliasedName, false,
      type: DriftSqlType.double, requiredDuringInsert: true);
  static const VerificationMeta _swapMeta = const VerificationMeta('swap');
  @override
  late final GeneratedColumn<double> swap = GeneratedColumn<double>(
      'swap', aliasedName, false,
      type: DriftSqlType.double, requiredDuringInsert: true);
  static const VerificationMeta _commissionMeta =
      const VerificationMeta('commission');
  @override
  late final GeneratedColumn<double> commission = GeneratedColumn<double>(
      'commission', aliasedName, false,
      type: DriftSqlType.double, requiredDuringInsert: true);
  static const VerificationMeta _marginUsedMeta =
      const VerificationMeta('marginUsed');
  @override
  late final GeneratedColumn<double> marginUsed = GeneratedColumn<double>(
      'margin_used', aliasedName, false,
      type: DriftSqlType.double, requiredDuringInsert: true);
  static const VerificationMeta _openTimeUsMeta =
      const VerificationMeta('openTimeUs');
  @override
  late final GeneratedColumn<int> openTimeUs = GeneratedColumn<int>(
      'open_time_us', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _magicNumberMeta =
      const VerificationMeta('magicNumber');
  @override
  late final GeneratedColumn<int> magicNumber = GeneratedColumn<int>(
      'magic_number', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _commentMeta =
      const VerificationMeta('comment');
  @override
  late final GeneratedColumn<String> comment = GeneratedColumn<String>(
      'comment', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _isModifyingMeta =
      const VerificationMeta('isModifying');
  @override
  late final GeneratedColumn<bool> isModifying = GeneratedColumn<bool>(
      'is_modifying', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'CHECK ("is_modifying" IN (0, 1))'),
      defaultValue: const Constant(false));
  @override
  List<GeneratedColumn> get $columns => [
        id,
        oandaTradeId,
        symbol,
        direction,
        lots,
        units,
        openPrice,
        currentPrice,
        stopLoss,
        takeProfit,
        floatingPnl,
        swap,
        commission,
        marginUsed,
        openTimeUs,
        magicNumber,
        comment,
        isModifying
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'positions_table';
  @override
  VerificationContext validateIntegrity(Insertable<PositionsTableData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('oanda_trade_id')) {
      context.handle(
          _oandaTradeIdMeta,
          oandaTradeId.isAcceptableOrUnknown(
              data['oanda_trade_id']!, _oandaTradeIdMeta));
    } else if (isInserting) {
      context.missing(_oandaTradeIdMeta);
    }
    if (data.containsKey('symbol')) {
      context.handle(_symbolMeta,
          symbol.isAcceptableOrUnknown(data['symbol']!, _symbolMeta));
    } else if (isInserting) {
      context.missing(_symbolMeta);
    }
    if (data.containsKey('direction')) {
      context.handle(_directionMeta,
          direction.isAcceptableOrUnknown(data['direction']!, _directionMeta));
    } else if (isInserting) {
      context.missing(_directionMeta);
    }
    if (data.containsKey('lots')) {
      context.handle(
          _lotsMeta, lots.isAcceptableOrUnknown(data['lots']!, _lotsMeta));
    } else if (isInserting) {
      context.missing(_lotsMeta);
    }
    if (data.containsKey('units')) {
      context.handle(
          _unitsMeta, units.isAcceptableOrUnknown(data['units']!, _unitsMeta));
    } else if (isInserting) {
      context.missing(_unitsMeta);
    }
    if (data.containsKey('open_price')) {
      context.handle(_openPriceMeta,
          openPrice.isAcceptableOrUnknown(data['open_price']!, _openPriceMeta));
    } else if (isInserting) {
      context.missing(_openPriceMeta);
    }
    if (data.containsKey('current_price')) {
      context.handle(
          _currentPriceMeta,
          currentPrice.isAcceptableOrUnknown(
              data['current_price']!, _currentPriceMeta));
    } else if (isInserting) {
      context.missing(_currentPriceMeta);
    }
    if (data.containsKey('stop_loss')) {
      context.handle(_stopLossMeta,
          stopLoss.isAcceptableOrUnknown(data['stop_loss']!, _stopLossMeta));
    }
    if (data.containsKey('take_profit')) {
      context.handle(
          _takeProfitMeta,
          takeProfit.isAcceptableOrUnknown(
              data['take_profit']!, _takeProfitMeta));
    }
    if (data.containsKey('floating_pnl')) {
      context.handle(
          _floatingPnlMeta,
          floatingPnl.isAcceptableOrUnknown(
              data['floating_pnl']!, _floatingPnlMeta));
    } else if (isInserting) {
      context.missing(_floatingPnlMeta);
    }
    if (data.containsKey('swap')) {
      context.handle(
          _swapMeta, swap.isAcceptableOrUnknown(data['swap']!, _swapMeta));
    } else if (isInserting) {
      context.missing(_swapMeta);
    }
    if (data.containsKey('commission')) {
      context.handle(
          _commissionMeta,
          commission.isAcceptableOrUnknown(
              data['commission']!, _commissionMeta));
    } else if (isInserting) {
      context.missing(_commissionMeta);
    }
    if (data.containsKey('margin_used')) {
      context.handle(
          _marginUsedMeta,
          marginUsed.isAcceptableOrUnknown(
              data['margin_used']!, _marginUsedMeta));
    } else if (isInserting) {
      context.missing(_marginUsedMeta);
    }
    if (data.containsKey('open_time_us')) {
      context.handle(
          _openTimeUsMeta,
          openTimeUs.isAcceptableOrUnknown(
              data['open_time_us']!, _openTimeUsMeta));
    } else if (isInserting) {
      context.missing(_openTimeUsMeta);
    }
    if (data.containsKey('magic_number')) {
      context.handle(
          _magicNumberMeta,
          magicNumber.isAcceptableOrUnknown(
              data['magic_number']!, _magicNumberMeta));
    } else if (isInserting) {
      context.missing(_magicNumberMeta);
    }
    if (data.containsKey('comment')) {
      context.handle(_commentMeta,
          comment.isAcceptableOrUnknown(data['comment']!, _commentMeta));
    } else if (isInserting) {
      context.missing(_commentMeta);
    }
    if (data.containsKey('is_modifying')) {
      context.handle(
          _isModifyingMeta,
          isModifying.isAcceptableOrUnknown(
              data['is_modifying']!, _isModifyingMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  PositionsTableData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return PositionsTableData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      oandaTradeId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}oanda_trade_id'])!,
      symbol: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}symbol'])!,
      direction: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}direction'])!,
      lots: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}lots'])!,
      units: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}units'])!,
      openPrice: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}open_price'])!,
      currentPrice: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}current_price'])!,
      stopLoss: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}stop_loss']),
      takeProfit: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}take_profit']),
      floatingPnl: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}floating_pnl'])!,
      swap: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}swap'])!,
      commission: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}commission'])!,
      marginUsed: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}margin_used'])!,
      openTimeUs: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}open_time_us'])!,
      magicNumber: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}magic_number'])!,
      comment: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}comment'])!,
      isModifying: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}is_modifying'])!,
    );
  }

  @override
  $PositionsTableTable createAlias(String alias) {
    return $PositionsTableTable(attachedDatabase, alias);
  }
}

class PositionsTableData extends DataClass
    implements Insertable<PositionsTableData> {
  final int id;
  final String oandaTradeId;
  final String symbol;
  final String direction;
  final double lots;
  final double units;
  final double openPrice;
  final double currentPrice;
  final double? stopLoss;
  final double? takeProfit;
  final double floatingPnl;
  final double swap;
  final double commission;
  final double marginUsed;
  final int openTimeUs;
  final int magicNumber;
  final String comment;
  final bool isModifying;
  const PositionsTableData(
      {required this.id,
      required this.oandaTradeId,
      required this.symbol,
      required this.direction,
      required this.lots,
      required this.units,
      required this.openPrice,
      required this.currentPrice,
      this.stopLoss,
      this.takeProfit,
      required this.floatingPnl,
      required this.swap,
      required this.commission,
      required this.marginUsed,
      required this.openTimeUs,
      required this.magicNumber,
      required this.comment,
      required this.isModifying});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['oanda_trade_id'] = Variable<String>(oandaTradeId);
    map['symbol'] = Variable<String>(symbol);
    map['direction'] = Variable<String>(direction);
    map['lots'] = Variable<double>(lots);
    map['units'] = Variable<double>(units);
    map['open_price'] = Variable<double>(openPrice);
    map['current_price'] = Variable<double>(currentPrice);
    if (!nullToAbsent || stopLoss != null) {
      map['stop_loss'] = Variable<double>(stopLoss);
    }
    if (!nullToAbsent || takeProfit != null) {
      map['take_profit'] = Variable<double>(takeProfit);
    }
    map['floating_pnl'] = Variable<double>(floatingPnl);
    map['swap'] = Variable<double>(swap);
    map['commission'] = Variable<double>(commission);
    map['margin_used'] = Variable<double>(marginUsed);
    map['open_time_us'] = Variable<int>(openTimeUs);
    map['magic_number'] = Variable<int>(magicNumber);
    map['comment'] = Variable<String>(comment);
    map['is_modifying'] = Variable<bool>(isModifying);
    return map;
  }

  PositionsTableCompanion toCompanion(bool nullToAbsent) {
    return PositionsTableCompanion(
      id: Value(id),
      oandaTradeId: Value(oandaTradeId),
      symbol: Value(symbol),
      direction: Value(direction),
      lots: Value(lots),
      units: Value(units),
      openPrice: Value(openPrice),
      currentPrice: Value(currentPrice),
      stopLoss: stopLoss == null && nullToAbsent
          ? const Value.absent()
          : Value(stopLoss),
      takeProfit: takeProfit == null && nullToAbsent
          ? const Value.absent()
          : Value(takeProfit),
      floatingPnl: Value(floatingPnl),
      swap: Value(swap),
      commission: Value(commission),
      marginUsed: Value(marginUsed),
      openTimeUs: Value(openTimeUs),
      magicNumber: Value(magicNumber),
      comment: Value(comment),
      isModifying: Value(isModifying),
    );
  }

  factory PositionsTableData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return PositionsTableData(
      id: serializer.fromJson<int>(json['id']),
      oandaTradeId: serializer.fromJson<String>(json['oandaTradeId']),
      symbol: serializer.fromJson<String>(json['symbol']),
      direction: serializer.fromJson<String>(json['direction']),
      lots: serializer.fromJson<double>(json['lots']),
      units: serializer.fromJson<double>(json['units']),
      openPrice: serializer.fromJson<double>(json['openPrice']),
      currentPrice: serializer.fromJson<double>(json['currentPrice']),
      stopLoss: serializer.fromJson<double?>(json['stopLoss']),
      takeProfit: serializer.fromJson<double?>(json['takeProfit']),
      floatingPnl: serializer.fromJson<double>(json['floatingPnl']),
      swap: serializer.fromJson<double>(json['swap']),
      commission: serializer.fromJson<double>(json['commission']),
      marginUsed: serializer.fromJson<double>(json['marginUsed']),
      openTimeUs: serializer.fromJson<int>(json['openTimeUs']),
      magicNumber: serializer.fromJson<int>(json['magicNumber']),
      comment: serializer.fromJson<String>(json['comment']),
      isModifying: serializer.fromJson<bool>(json['isModifying']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'oandaTradeId': serializer.toJson<String>(oandaTradeId),
      'symbol': serializer.toJson<String>(symbol),
      'direction': serializer.toJson<String>(direction),
      'lots': serializer.toJson<double>(lots),
      'units': serializer.toJson<double>(units),
      'openPrice': serializer.toJson<double>(openPrice),
      'currentPrice': serializer.toJson<double>(currentPrice),
      'stopLoss': serializer.toJson<double?>(stopLoss),
      'takeProfit': serializer.toJson<double?>(takeProfit),
      'floatingPnl': serializer.toJson<double>(floatingPnl),
      'swap': serializer.toJson<double>(swap),
      'commission': serializer.toJson<double>(commission),
      'marginUsed': serializer.toJson<double>(marginUsed),
      'openTimeUs': serializer.toJson<int>(openTimeUs),
      'magicNumber': serializer.toJson<int>(magicNumber),
      'comment': serializer.toJson<String>(comment),
      'isModifying': serializer.toJson<bool>(isModifying),
    };
  }

  PositionsTableData copyWith(
          {int? id,
          String? oandaTradeId,
          String? symbol,
          String? direction,
          double? lots,
          double? units,
          double? openPrice,
          double? currentPrice,
          Value<double?> stopLoss = const Value.absent(),
          Value<double?> takeProfit = const Value.absent(),
          double? floatingPnl,
          double? swap,
          double? commission,
          double? marginUsed,
          int? openTimeUs,
          int? magicNumber,
          String? comment,
          bool? isModifying}) =>
      PositionsTableData(
        id: id ?? this.id,
        oandaTradeId: oandaTradeId ?? this.oandaTradeId,
        symbol: symbol ?? this.symbol,
        direction: direction ?? this.direction,
        lots: lots ?? this.lots,
        units: units ?? this.units,
        openPrice: openPrice ?? this.openPrice,
        currentPrice: currentPrice ?? this.currentPrice,
        stopLoss: stopLoss.present ? stopLoss.value : this.stopLoss,
        takeProfit: takeProfit.present ? takeProfit.value : this.takeProfit,
        floatingPnl: floatingPnl ?? this.floatingPnl,
        swap: swap ?? this.swap,
        commission: commission ?? this.commission,
        marginUsed: marginUsed ?? this.marginUsed,
        openTimeUs: openTimeUs ?? this.openTimeUs,
        magicNumber: magicNumber ?? this.magicNumber,
        comment: comment ?? this.comment,
        isModifying: isModifying ?? this.isModifying,
      );
  PositionsTableData copyWithCompanion(PositionsTableCompanion data) {
    return PositionsTableData(
      id: data.id.present ? data.id.value : this.id,
      oandaTradeId: data.oandaTradeId.present
          ? data.oandaTradeId.value
          : this.oandaTradeId,
      symbol: data.symbol.present ? data.symbol.value : this.symbol,
      direction: data.direction.present ? data.direction.value : this.direction,
      lots: data.lots.present ? data.lots.value : this.lots,
      units: data.units.present ? data.units.value : this.units,
      openPrice: data.openPrice.present ? data.openPrice.value : this.openPrice,
      currentPrice: data.currentPrice.present
          ? data.currentPrice.value
          : this.currentPrice,
      stopLoss: data.stopLoss.present ? data.stopLoss.value : this.stopLoss,
      takeProfit:
          data.takeProfit.present ? data.takeProfit.value : this.takeProfit,
      floatingPnl:
          data.floatingPnl.present ? data.floatingPnl.value : this.floatingPnl,
      swap: data.swap.present ? data.swap.value : this.swap,
      commission:
          data.commission.present ? data.commission.value : this.commission,
      marginUsed:
          data.marginUsed.present ? data.marginUsed.value : this.marginUsed,
      openTimeUs:
          data.openTimeUs.present ? data.openTimeUs.value : this.openTimeUs,
      magicNumber:
          data.magicNumber.present ? data.magicNumber.value : this.magicNumber,
      comment: data.comment.present ? data.comment.value : this.comment,
      isModifying:
          data.isModifying.present ? data.isModifying.value : this.isModifying,
    );
  }

  @override
  String toString() {
    return (StringBuffer('PositionsTableData(')
          ..write('id: $id, ')
          ..write('oandaTradeId: $oandaTradeId, ')
          ..write('symbol: $symbol, ')
          ..write('direction: $direction, ')
          ..write('lots: $lots, ')
          ..write('units: $units, ')
          ..write('openPrice: $openPrice, ')
          ..write('currentPrice: $currentPrice, ')
          ..write('stopLoss: $stopLoss, ')
          ..write('takeProfit: $takeProfit, ')
          ..write('floatingPnl: $floatingPnl, ')
          ..write('swap: $swap, ')
          ..write('commission: $commission, ')
          ..write('marginUsed: $marginUsed, ')
          ..write('openTimeUs: $openTimeUs, ')
          ..write('magicNumber: $magicNumber, ')
          ..write('comment: $comment, ')
          ..write('isModifying: $isModifying')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      id,
      oandaTradeId,
      symbol,
      direction,
      lots,
      units,
      openPrice,
      currentPrice,
      stopLoss,
      takeProfit,
      floatingPnl,
      swap,
      commission,
      marginUsed,
      openTimeUs,
      magicNumber,
      comment,
      isModifying);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is PositionsTableData &&
          other.id == this.id &&
          other.oandaTradeId == this.oandaTradeId &&
          other.symbol == this.symbol &&
          other.direction == this.direction &&
          other.lots == this.lots &&
          other.units == this.units &&
          other.openPrice == this.openPrice &&
          other.currentPrice == this.currentPrice &&
          other.stopLoss == this.stopLoss &&
          other.takeProfit == this.takeProfit &&
          other.floatingPnl == this.floatingPnl &&
          other.swap == this.swap &&
          other.commission == this.commission &&
          other.marginUsed == this.marginUsed &&
          other.openTimeUs == this.openTimeUs &&
          other.magicNumber == this.magicNumber &&
          other.comment == this.comment &&
          other.isModifying == this.isModifying);
}

class PositionsTableCompanion extends UpdateCompanion<PositionsTableData> {
  final Value<int> id;
  final Value<String> oandaTradeId;
  final Value<String> symbol;
  final Value<String> direction;
  final Value<double> lots;
  final Value<double> units;
  final Value<double> openPrice;
  final Value<double> currentPrice;
  final Value<double?> stopLoss;
  final Value<double?> takeProfit;
  final Value<double> floatingPnl;
  final Value<double> swap;
  final Value<double> commission;
  final Value<double> marginUsed;
  final Value<int> openTimeUs;
  final Value<int> magicNumber;
  final Value<String> comment;
  final Value<bool> isModifying;
  const PositionsTableCompanion({
    this.id = const Value.absent(),
    this.oandaTradeId = const Value.absent(),
    this.symbol = const Value.absent(),
    this.direction = const Value.absent(),
    this.lots = const Value.absent(),
    this.units = const Value.absent(),
    this.openPrice = const Value.absent(),
    this.currentPrice = const Value.absent(),
    this.stopLoss = const Value.absent(),
    this.takeProfit = const Value.absent(),
    this.floatingPnl = const Value.absent(),
    this.swap = const Value.absent(),
    this.commission = const Value.absent(),
    this.marginUsed = const Value.absent(),
    this.openTimeUs = const Value.absent(),
    this.magicNumber = const Value.absent(),
    this.comment = const Value.absent(),
    this.isModifying = const Value.absent(),
  });
  PositionsTableCompanion.insert({
    this.id = const Value.absent(),
    required String oandaTradeId,
    required String symbol,
    required String direction,
    required double lots,
    required double units,
    required double openPrice,
    required double currentPrice,
    this.stopLoss = const Value.absent(),
    this.takeProfit = const Value.absent(),
    required double floatingPnl,
    required double swap,
    required double commission,
    required double marginUsed,
    required int openTimeUs,
    required int magicNumber,
    required String comment,
    this.isModifying = const Value.absent(),
  })  : oandaTradeId = Value(oandaTradeId),
        symbol = Value(symbol),
        direction = Value(direction),
        lots = Value(lots),
        units = Value(units),
        openPrice = Value(openPrice),
        currentPrice = Value(currentPrice),
        floatingPnl = Value(floatingPnl),
        swap = Value(swap),
        commission = Value(commission),
        marginUsed = Value(marginUsed),
        openTimeUs = Value(openTimeUs),
        magicNumber = Value(magicNumber),
        comment = Value(comment);
  static Insertable<PositionsTableData> custom({
    Expression<int>? id,
    Expression<String>? oandaTradeId,
    Expression<String>? symbol,
    Expression<String>? direction,
    Expression<double>? lots,
    Expression<double>? units,
    Expression<double>? openPrice,
    Expression<double>? currentPrice,
    Expression<double>? stopLoss,
    Expression<double>? takeProfit,
    Expression<double>? floatingPnl,
    Expression<double>? swap,
    Expression<double>? commission,
    Expression<double>? marginUsed,
    Expression<int>? openTimeUs,
    Expression<int>? magicNumber,
    Expression<String>? comment,
    Expression<bool>? isModifying,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (oandaTradeId != null) 'oanda_trade_id': oandaTradeId,
      if (symbol != null) 'symbol': symbol,
      if (direction != null) 'direction': direction,
      if (lots != null) 'lots': lots,
      if (units != null) 'units': units,
      if (openPrice != null) 'open_price': openPrice,
      if (currentPrice != null) 'current_price': currentPrice,
      if (stopLoss != null) 'stop_loss': stopLoss,
      if (takeProfit != null) 'take_profit': takeProfit,
      if (floatingPnl != null) 'floating_pnl': floatingPnl,
      if (swap != null) 'swap': swap,
      if (commission != null) 'commission': commission,
      if (marginUsed != null) 'margin_used': marginUsed,
      if (openTimeUs != null) 'open_time_us': openTimeUs,
      if (magicNumber != null) 'magic_number': magicNumber,
      if (comment != null) 'comment': comment,
      if (isModifying != null) 'is_modifying': isModifying,
    });
  }

  PositionsTableCompanion copyWith(
      {Value<int>? id,
      Value<String>? oandaTradeId,
      Value<String>? symbol,
      Value<String>? direction,
      Value<double>? lots,
      Value<double>? units,
      Value<double>? openPrice,
      Value<double>? currentPrice,
      Value<double?>? stopLoss,
      Value<double?>? takeProfit,
      Value<double>? floatingPnl,
      Value<double>? swap,
      Value<double>? commission,
      Value<double>? marginUsed,
      Value<int>? openTimeUs,
      Value<int>? magicNumber,
      Value<String>? comment,
      Value<bool>? isModifying}) {
    return PositionsTableCompanion(
      id: id ?? this.id,
      oandaTradeId: oandaTradeId ?? this.oandaTradeId,
      symbol: symbol ?? this.symbol,
      direction: direction ?? this.direction,
      lots: lots ?? this.lots,
      units: units ?? this.units,
      openPrice: openPrice ?? this.openPrice,
      currentPrice: currentPrice ?? this.currentPrice,
      stopLoss: stopLoss ?? this.stopLoss,
      takeProfit: takeProfit ?? this.takeProfit,
      floatingPnl: floatingPnl ?? this.floatingPnl,
      swap: swap ?? this.swap,
      commission: commission ?? this.commission,
      marginUsed: marginUsed ?? this.marginUsed,
      openTimeUs: openTimeUs ?? this.openTimeUs,
      magicNumber: magicNumber ?? this.magicNumber,
      comment: comment ?? this.comment,
      isModifying: isModifying ?? this.isModifying,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (oandaTradeId.present) {
      map['oanda_trade_id'] = Variable<String>(oandaTradeId.value);
    }
    if (symbol.present) {
      map['symbol'] = Variable<String>(symbol.value);
    }
    if (direction.present) {
      map['direction'] = Variable<String>(direction.value);
    }
    if (lots.present) {
      map['lots'] = Variable<double>(lots.value);
    }
    if (units.present) {
      map['units'] = Variable<double>(units.value);
    }
    if (openPrice.present) {
      map['open_price'] = Variable<double>(openPrice.value);
    }
    if (currentPrice.present) {
      map['current_price'] = Variable<double>(currentPrice.value);
    }
    if (stopLoss.present) {
      map['stop_loss'] = Variable<double>(stopLoss.value);
    }
    if (takeProfit.present) {
      map['take_profit'] = Variable<double>(takeProfit.value);
    }
    if (floatingPnl.present) {
      map['floating_pnl'] = Variable<double>(floatingPnl.value);
    }
    if (swap.present) {
      map['swap'] = Variable<double>(swap.value);
    }
    if (commission.present) {
      map['commission'] = Variable<double>(commission.value);
    }
    if (marginUsed.present) {
      map['margin_used'] = Variable<double>(marginUsed.value);
    }
    if (openTimeUs.present) {
      map['open_time_us'] = Variable<int>(openTimeUs.value);
    }
    if (magicNumber.present) {
      map['magic_number'] = Variable<int>(magicNumber.value);
    }
    if (comment.present) {
      map['comment'] = Variable<String>(comment.value);
    }
    if (isModifying.present) {
      map['is_modifying'] = Variable<bool>(isModifying.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('PositionsTableCompanion(')
          ..write('id: $id, ')
          ..write('oandaTradeId: $oandaTradeId, ')
          ..write('symbol: $symbol, ')
          ..write('direction: $direction, ')
          ..write('lots: $lots, ')
          ..write('units: $units, ')
          ..write('openPrice: $openPrice, ')
          ..write('currentPrice: $currentPrice, ')
          ..write('stopLoss: $stopLoss, ')
          ..write('takeProfit: $takeProfit, ')
          ..write('floatingPnl: $floatingPnl, ')
          ..write('swap: $swap, ')
          ..write('commission: $commission, ')
          ..write('marginUsed: $marginUsed, ')
          ..write('openTimeUs: $openTimeUs, ')
          ..write('magicNumber: $magicNumber, ')
          ..write('comment: $comment, ')
          ..write('isModifying: $isModifying')
          ..write(')'))
        .toString();
  }
}

class $OrdersTableTable extends OrdersTable
    with TableInfo<$OrdersTableTable, OrdersTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $OrdersTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _oandaOrderIdMeta =
      const VerificationMeta('oandaOrderId');
  @override
  late final GeneratedColumn<String> oandaOrderId = GeneratedColumn<String>(
      'oanda_order_id', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      defaultConstraints: GeneratedColumn.constraintIsAlways('UNIQUE'));
  static const VerificationMeta _symbolMeta = const VerificationMeta('symbol');
  @override
  late final GeneratedColumn<String> symbol = GeneratedColumn<String>(
      'symbol', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _orderTypeMeta =
      const VerificationMeta('orderType');
  @override
  late final GeneratedColumn<String> orderType = GeneratedColumn<String>(
      'order_type', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _directionMeta =
      const VerificationMeta('direction');
  @override
  late final GeneratedColumn<String> direction = GeneratedColumn<String>(
      'direction', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _lotsMeta = const VerificationMeta('lots');
  @override
  late final GeneratedColumn<double> lots = GeneratedColumn<double>(
      'lots', aliasedName, false,
      type: DriftSqlType.double, requiredDuringInsert: true);
  static const VerificationMeta _unitsMeta = const VerificationMeta('units');
  @override
  late final GeneratedColumn<double> units = GeneratedColumn<double>(
      'units', aliasedName, false,
      type: DriftSqlType.double, requiredDuringInsert: true);
  static const VerificationMeta _priceMeta = const VerificationMeta('price');
  @override
  late final GeneratedColumn<double> price = GeneratedColumn<double>(
      'price', aliasedName, false,
      type: DriftSqlType.double, requiredDuringInsert: true);
  static const VerificationMeta _priceBoundMeta =
      const VerificationMeta('priceBound');
  @override
  late final GeneratedColumn<double> priceBound = GeneratedColumn<double>(
      'price_bound', aliasedName, true,
      type: DriftSqlType.double, requiredDuringInsert: false);
  static const VerificationMeta _stopLossMeta =
      const VerificationMeta('stopLoss');
  @override
  late final GeneratedColumn<double> stopLoss = GeneratedColumn<double>(
      'stop_loss', aliasedName, true,
      type: DriftSqlType.double, requiredDuringInsert: false);
  static const VerificationMeta _takeProfitMeta =
      const VerificationMeta('takeProfit');
  @override
  late final GeneratedColumn<double> takeProfit = GeneratedColumn<double>(
      'take_profit', aliasedName, true,
      type: DriftSqlType.double, requiredDuringInsert: false);
  static const VerificationMeta _timeInForceMeta =
      const VerificationMeta('timeInForce');
  @override
  late final GeneratedColumn<String> timeInForce = GeneratedColumn<String>(
      'time_in_force', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _expiryTimeUsMeta =
      const VerificationMeta('expiryTimeUs');
  @override
  late final GeneratedColumn<int> expiryTimeUs = GeneratedColumn<int>(
      'expiry_time_us', aliasedName, true,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _statusMeta = const VerificationMeta('status');
  @override
  late final GeneratedColumn<String> status = GeneratedColumn<String>(
      'status', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _createTimeUsMeta =
      const VerificationMeta('createTimeUs');
  @override
  late final GeneratedColumn<int> createTimeUs = GeneratedColumn<int>(
      'create_time_us', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _lastModifiedUsMeta =
      const VerificationMeta('lastModifiedUs');
  @override
  late final GeneratedColumn<int> lastModifiedUs = GeneratedColumn<int>(
      'last_modified_us', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _magicNumberMeta =
      const VerificationMeta('magicNumber');
  @override
  late final GeneratedColumn<int> magicNumber = GeneratedColumn<int>(
      'magic_number', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _commentMeta =
      const VerificationMeta('comment');
  @override
  late final GeneratedColumn<String> comment = GeneratedColumn<String>(
      'comment', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _distanceFromMarketMeta =
      const VerificationMeta('distanceFromMarket');
  @override
  late final GeneratedColumn<double> distanceFromMarket =
      GeneratedColumn<double>('distance_from_market', aliasedName, true,
          type: DriftSqlType.double, requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns => [
        id,
        oandaOrderId,
        symbol,
        orderType,
        direction,
        lots,
        units,
        price,
        priceBound,
        stopLoss,
        takeProfit,
        timeInForce,
        expiryTimeUs,
        status,
        createTimeUs,
        lastModifiedUs,
        magicNumber,
        comment,
        distanceFromMarket
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'orders_table';
  @override
  VerificationContext validateIntegrity(Insertable<OrdersTableData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('oanda_order_id')) {
      context.handle(
          _oandaOrderIdMeta,
          oandaOrderId.isAcceptableOrUnknown(
              data['oanda_order_id']!, _oandaOrderIdMeta));
    } else if (isInserting) {
      context.missing(_oandaOrderIdMeta);
    }
    if (data.containsKey('symbol')) {
      context.handle(_symbolMeta,
          symbol.isAcceptableOrUnknown(data['symbol']!, _symbolMeta));
    } else if (isInserting) {
      context.missing(_symbolMeta);
    }
    if (data.containsKey('order_type')) {
      context.handle(_orderTypeMeta,
          orderType.isAcceptableOrUnknown(data['order_type']!, _orderTypeMeta));
    } else if (isInserting) {
      context.missing(_orderTypeMeta);
    }
    if (data.containsKey('direction')) {
      context.handle(_directionMeta,
          direction.isAcceptableOrUnknown(data['direction']!, _directionMeta));
    } else if (isInserting) {
      context.missing(_directionMeta);
    }
    if (data.containsKey('lots')) {
      context.handle(
          _lotsMeta, lots.isAcceptableOrUnknown(data['lots']!, _lotsMeta));
    } else if (isInserting) {
      context.missing(_lotsMeta);
    }
    if (data.containsKey('units')) {
      context.handle(
          _unitsMeta, units.isAcceptableOrUnknown(data['units']!, _unitsMeta));
    } else if (isInserting) {
      context.missing(_unitsMeta);
    }
    if (data.containsKey('price')) {
      context.handle(
          _priceMeta, price.isAcceptableOrUnknown(data['price']!, _priceMeta));
    } else if (isInserting) {
      context.missing(_priceMeta);
    }
    if (data.containsKey('price_bound')) {
      context.handle(
          _priceBoundMeta,
          priceBound.isAcceptableOrUnknown(
              data['price_bound']!, _priceBoundMeta));
    }
    if (data.containsKey('stop_loss')) {
      context.handle(_stopLossMeta,
          stopLoss.isAcceptableOrUnknown(data['stop_loss']!, _stopLossMeta));
    }
    if (data.containsKey('take_profit')) {
      context.handle(
          _takeProfitMeta,
          takeProfit.isAcceptableOrUnknown(
              data['take_profit']!, _takeProfitMeta));
    }
    if (data.containsKey('time_in_force')) {
      context.handle(
          _timeInForceMeta,
          timeInForce.isAcceptableOrUnknown(
              data['time_in_force']!, _timeInForceMeta));
    } else if (isInserting) {
      context.missing(_timeInForceMeta);
    }
    if (data.containsKey('expiry_time_us')) {
      context.handle(
          _expiryTimeUsMeta,
          expiryTimeUs.isAcceptableOrUnknown(
              data['expiry_time_us']!, _expiryTimeUsMeta));
    }
    if (data.containsKey('status')) {
      context.handle(_statusMeta,
          status.isAcceptableOrUnknown(data['status']!, _statusMeta));
    } else if (isInserting) {
      context.missing(_statusMeta);
    }
    if (data.containsKey('create_time_us')) {
      context.handle(
          _createTimeUsMeta,
          createTimeUs.isAcceptableOrUnknown(
              data['create_time_us']!, _createTimeUsMeta));
    } else if (isInserting) {
      context.missing(_createTimeUsMeta);
    }
    if (data.containsKey('last_modified_us')) {
      context.handle(
          _lastModifiedUsMeta,
          lastModifiedUs.isAcceptableOrUnknown(
              data['last_modified_us']!, _lastModifiedUsMeta));
    } else if (isInserting) {
      context.missing(_lastModifiedUsMeta);
    }
    if (data.containsKey('magic_number')) {
      context.handle(
          _magicNumberMeta,
          magicNumber.isAcceptableOrUnknown(
              data['magic_number']!, _magicNumberMeta));
    } else if (isInserting) {
      context.missing(_magicNumberMeta);
    }
    if (data.containsKey('comment')) {
      context.handle(_commentMeta,
          comment.isAcceptableOrUnknown(data['comment']!, _commentMeta));
    } else if (isInserting) {
      context.missing(_commentMeta);
    }
    if (data.containsKey('distance_from_market')) {
      context.handle(
          _distanceFromMarketMeta,
          distanceFromMarket.isAcceptableOrUnknown(
              data['distance_from_market']!, _distanceFromMarketMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  OrdersTableData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return OrdersTableData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      oandaOrderId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}oanda_order_id'])!,
      symbol: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}symbol'])!,
      orderType: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}order_type'])!,
      direction: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}direction'])!,
      lots: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}lots'])!,
      units: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}units'])!,
      price: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}price'])!,
      priceBound: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}price_bound']),
      stopLoss: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}stop_loss']),
      takeProfit: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}take_profit']),
      timeInForce: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}time_in_force'])!,
      expiryTimeUs: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}expiry_time_us']),
      status: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}status'])!,
      createTimeUs: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}create_time_us'])!,
      lastModifiedUs: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}last_modified_us'])!,
      magicNumber: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}magic_number'])!,
      comment: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}comment'])!,
      distanceFromMarket: attachedDatabase.typeMapping.read(
          DriftSqlType.double, data['${effectivePrefix}distance_from_market']),
    );
  }

  @override
  $OrdersTableTable createAlias(String alias) {
    return $OrdersTableTable(attachedDatabase, alias);
  }
}

class OrdersTableData extends DataClass implements Insertable<OrdersTableData> {
  final int id;
  final String oandaOrderId;
  final String symbol;
  final String orderType;
  final String direction;
  final double lots;
  final double units;
  final double price;
  final double? priceBound;
  final double? stopLoss;
  final double? takeProfit;
  final String timeInForce;
  final int? expiryTimeUs;
  final String status;
  final int createTimeUs;
  final int lastModifiedUs;
  final int magicNumber;
  final String comment;
  final double? distanceFromMarket;
  const OrdersTableData(
      {required this.id,
      required this.oandaOrderId,
      required this.symbol,
      required this.orderType,
      required this.direction,
      required this.lots,
      required this.units,
      required this.price,
      this.priceBound,
      this.stopLoss,
      this.takeProfit,
      required this.timeInForce,
      this.expiryTimeUs,
      required this.status,
      required this.createTimeUs,
      required this.lastModifiedUs,
      required this.magicNumber,
      required this.comment,
      this.distanceFromMarket});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['oanda_order_id'] = Variable<String>(oandaOrderId);
    map['symbol'] = Variable<String>(symbol);
    map['order_type'] = Variable<String>(orderType);
    map['direction'] = Variable<String>(direction);
    map['lots'] = Variable<double>(lots);
    map['units'] = Variable<double>(units);
    map['price'] = Variable<double>(price);
    if (!nullToAbsent || priceBound != null) {
      map['price_bound'] = Variable<double>(priceBound);
    }
    if (!nullToAbsent || stopLoss != null) {
      map['stop_loss'] = Variable<double>(stopLoss);
    }
    if (!nullToAbsent || takeProfit != null) {
      map['take_profit'] = Variable<double>(takeProfit);
    }
    map['time_in_force'] = Variable<String>(timeInForce);
    if (!nullToAbsent || expiryTimeUs != null) {
      map['expiry_time_us'] = Variable<int>(expiryTimeUs);
    }
    map['status'] = Variable<String>(status);
    map['create_time_us'] = Variable<int>(createTimeUs);
    map['last_modified_us'] = Variable<int>(lastModifiedUs);
    map['magic_number'] = Variable<int>(magicNumber);
    map['comment'] = Variable<String>(comment);
    if (!nullToAbsent || distanceFromMarket != null) {
      map['distance_from_market'] = Variable<double>(distanceFromMarket);
    }
    return map;
  }

  OrdersTableCompanion toCompanion(bool nullToAbsent) {
    return OrdersTableCompanion(
      id: Value(id),
      oandaOrderId: Value(oandaOrderId),
      symbol: Value(symbol),
      orderType: Value(orderType),
      direction: Value(direction),
      lots: Value(lots),
      units: Value(units),
      price: Value(price),
      priceBound: priceBound == null && nullToAbsent
          ? const Value.absent()
          : Value(priceBound),
      stopLoss: stopLoss == null && nullToAbsent
          ? const Value.absent()
          : Value(stopLoss),
      takeProfit: takeProfit == null && nullToAbsent
          ? const Value.absent()
          : Value(takeProfit),
      timeInForce: Value(timeInForce),
      expiryTimeUs: expiryTimeUs == null && nullToAbsent
          ? const Value.absent()
          : Value(expiryTimeUs),
      status: Value(status),
      createTimeUs: Value(createTimeUs),
      lastModifiedUs: Value(lastModifiedUs),
      magicNumber: Value(magicNumber),
      comment: Value(comment),
      distanceFromMarket: distanceFromMarket == null && nullToAbsent
          ? const Value.absent()
          : Value(distanceFromMarket),
    );
  }

  factory OrdersTableData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return OrdersTableData(
      id: serializer.fromJson<int>(json['id']),
      oandaOrderId: serializer.fromJson<String>(json['oandaOrderId']),
      symbol: serializer.fromJson<String>(json['symbol']),
      orderType: serializer.fromJson<String>(json['orderType']),
      direction: serializer.fromJson<String>(json['direction']),
      lots: serializer.fromJson<double>(json['lots']),
      units: serializer.fromJson<double>(json['units']),
      price: serializer.fromJson<double>(json['price']),
      priceBound: serializer.fromJson<double?>(json['priceBound']),
      stopLoss: serializer.fromJson<double?>(json['stopLoss']),
      takeProfit: serializer.fromJson<double?>(json['takeProfit']),
      timeInForce: serializer.fromJson<String>(json['timeInForce']),
      expiryTimeUs: serializer.fromJson<int?>(json['expiryTimeUs']),
      status: serializer.fromJson<String>(json['status']),
      createTimeUs: serializer.fromJson<int>(json['createTimeUs']),
      lastModifiedUs: serializer.fromJson<int>(json['lastModifiedUs']),
      magicNumber: serializer.fromJson<int>(json['magicNumber']),
      comment: serializer.fromJson<String>(json['comment']),
      distanceFromMarket:
          serializer.fromJson<double?>(json['distanceFromMarket']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'oandaOrderId': serializer.toJson<String>(oandaOrderId),
      'symbol': serializer.toJson<String>(symbol),
      'orderType': serializer.toJson<String>(orderType),
      'direction': serializer.toJson<String>(direction),
      'lots': serializer.toJson<double>(lots),
      'units': serializer.toJson<double>(units),
      'price': serializer.toJson<double>(price),
      'priceBound': serializer.toJson<double?>(priceBound),
      'stopLoss': serializer.toJson<double?>(stopLoss),
      'takeProfit': serializer.toJson<double?>(takeProfit),
      'timeInForce': serializer.toJson<String>(timeInForce),
      'expiryTimeUs': serializer.toJson<int?>(expiryTimeUs),
      'status': serializer.toJson<String>(status),
      'createTimeUs': serializer.toJson<int>(createTimeUs),
      'lastModifiedUs': serializer.toJson<int>(lastModifiedUs),
      'magicNumber': serializer.toJson<int>(magicNumber),
      'comment': serializer.toJson<String>(comment),
      'distanceFromMarket': serializer.toJson<double?>(distanceFromMarket),
    };
  }

  OrdersTableData copyWith(
          {int? id,
          String? oandaOrderId,
          String? symbol,
          String? orderType,
          String? direction,
          double? lots,
          double? units,
          double? price,
          Value<double?> priceBound = const Value.absent(),
          Value<double?> stopLoss = const Value.absent(),
          Value<double?> takeProfit = const Value.absent(),
          String? timeInForce,
          Value<int?> expiryTimeUs = const Value.absent(),
          String? status,
          int? createTimeUs,
          int? lastModifiedUs,
          int? magicNumber,
          String? comment,
          Value<double?> distanceFromMarket = const Value.absent()}) =>
      OrdersTableData(
        id: id ?? this.id,
        oandaOrderId: oandaOrderId ?? this.oandaOrderId,
        symbol: symbol ?? this.symbol,
        orderType: orderType ?? this.orderType,
        direction: direction ?? this.direction,
        lots: lots ?? this.lots,
        units: units ?? this.units,
        price: price ?? this.price,
        priceBound: priceBound.present ? priceBound.value : this.priceBound,
        stopLoss: stopLoss.present ? stopLoss.value : this.stopLoss,
        takeProfit: takeProfit.present ? takeProfit.value : this.takeProfit,
        timeInForce: timeInForce ?? this.timeInForce,
        expiryTimeUs:
            expiryTimeUs.present ? expiryTimeUs.value : this.expiryTimeUs,
        status: status ?? this.status,
        createTimeUs: createTimeUs ?? this.createTimeUs,
        lastModifiedUs: lastModifiedUs ?? this.lastModifiedUs,
        magicNumber: magicNumber ?? this.magicNumber,
        comment: comment ?? this.comment,
        distanceFromMarket: distanceFromMarket.present
            ? distanceFromMarket.value
            : this.distanceFromMarket,
      );
  OrdersTableData copyWithCompanion(OrdersTableCompanion data) {
    return OrdersTableData(
      id: data.id.present ? data.id.value : this.id,
      oandaOrderId: data.oandaOrderId.present
          ? data.oandaOrderId.value
          : this.oandaOrderId,
      symbol: data.symbol.present ? data.symbol.value : this.symbol,
      orderType: data.orderType.present ? data.orderType.value : this.orderType,
      direction: data.direction.present ? data.direction.value : this.direction,
      lots: data.lots.present ? data.lots.value : this.lots,
      units: data.units.present ? data.units.value : this.units,
      price: data.price.present ? data.price.value : this.price,
      priceBound:
          data.priceBound.present ? data.priceBound.value : this.priceBound,
      stopLoss: data.stopLoss.present ? data.stopLoss.value : this.stopLoss,
      takeProfit:
          data.takeProfit.present ? data.takeProfit.value : this.takeProfit,
      timeInForce:
          data.timeInForce.present ? data.timeInForce.value : this.timeInForce,
      expiryTimeUs: data.expiryTimeUs.present
          ? data.expiryTimeUs.value
          : this.expiryTimeUs,
      status: data.status.present ? data.status.value : this.status,
      createTimeUs: data.createTimeUs.present
          ? data.createTimeUs.value
          : this.createTimeUs,
      lastModifiedUs: data.lastModifiedUs.present
          ? data.lastModifiedUs.value
          : this.lastModifiedUs,
      magicNumber:
          data.magicNumber.present ? data.magicNumber.value : this.magicNumber,
      comment: data.comment.present ? data.comment.value : this.comment,
      distanceFromMarket: data.distanceFromMarket.present
          ? data.distanceFromMarket.value
          : this.distanceFromMarket,
    );
  }

  @override
  String toString() {
    return (StringBuffer('OrdersTableData(')
          ..write('id: $id, ')
          ..write('oandaOrderId: $oandaOrderId, ')
          ..write('symbol: $symbol, ')
          ..write('orderType: $orderType, ')
          ..write('direction: $direction, ')
          ..write('lots: $lots, ')
          ..write('units: $units, ')
          ..write('price: $price, ')
          ..write('priceBound: $priceBound, ')
          ..write('stopLoss: $stopLoss, ')
          ..write('takeProfit: $takeProfit, ')
          ..write('timeInForce: $timeInForce, ')
          ..write('expiryTimeUs: $expiryTimeUs, ')
          ..write('status: $status, ')
          ..write('createTimeUs: $createTimeUs, ')
          ..write('lastModifiedUs: $lastModifiedUs, ')
          ..write('magicNumber: $magicNumber, ')
          ..write('comment: $comment, ')
          ..write('distanceFromMarket: $distanceFromMarket')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      id,
      oandaOrderId,
      symbol,
      orderType,
      direction,
      lots,
      units,
      price,
      priceBound,
      stopLoss,
      takeProfit,
      timeInForce,
      expiryTimeUs,
      status,
      createTimeUs,
      lastModifiedUs,
      magicNumber,
      comment,
      distanceFromMarket);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is OrdersTableData &&
          other.id == this.id &&
          other.oandaOrderId == this.oandaOrderId &&
          other.symbol == this.symbol &&
          other.orderType == this.orderType &&
          other.direction == this.direction &&
          other.lots == this.lots &&
          other.units == this.units &&
          other.price == this.price &&
          other.priceBound == this.priceBound &&
          other.stopLoss == this.stopLoss &&
          other.takeProfit == this.takeProfit &&
          other.timeInForce == this.timeInForce &&
          other.expiryTimeUs == this.expiryTimeUs &&
          other.status == this.status &&
          other.createTimeUs == this.createTimeUs &&
          other.lastModifiedUs == this.lastModifiedUs &&
          other.magicNumber == this.magicNumber &&
          other.comment == this.comment &&
          other.distanceFromMarket == this.distanceFromMarket);
}

class OrdersTableCompanion extends UpdateCompanion<OrdersTableData> {
  final Value<int> id;
  final Value<String> oandaOrderId;
  final Value<String> symbol;
  final Value<String> orderType;
  final Value<String> direction;
  final Value<double> lots;
  final Value<double> units;
  final Value<double> price;
  final Value<double?> priceBound;
  final Value<double?> stopLoss;
  final Value<double?> takeProfit;
  final Value<String> timeInForce;
  final Value<int?> expiryTimeUs;
  final Value<String> status;
  final Value<int> createTimeUs;
  final Value<int> lastModifiedUs;
  final Value<int> magicNumber;
  final Value<String> comment;
  final Value<double?> distanceFromMarket;
  const OrdersTableCompanion({
    this.id = const Value.absent(),
    this.oandaOrderId = const Value.absent(),
    this.symbol = const Value.absent(),
    this.orderType = const Value.absent(),
    this.direction = const Value.absent(),
    this.lots = const Value.absent(),
    this.units = const Value.absent(),
    this.price = const Value.absent(),
    this.priceBound = const Value.absent(),
    this.stopLoss = const Value.absent(),
    this.takeProfit = const Value.absent(),
    this.timeInForce = const Value.absent(),
    this.expiryTimeUs = const Value.absent(),
    this.status = const Value.absent(),
    this.createTimeUs = const Value.absent(),
    this.lastModifiedUs = const Value.absent(),
    this.magicNumber = const Value.absent(),
    this.comment = const Value.absent(),
    this.distanceFromMarket = const Value.absent(),
  });
  OrdersTableCompanion.insert({
    this.id = const Value.absent(),
    required String oandaOrderId,
    required String symbol,
    required String orderType,
    required String direction,
    required double lots,
    required double units,
    required double price,
    this.priceBound = const Value.absent(),
    this.stopLoss = const Value.absent(),
    this.takeProfit = const Value.absent(),
    required String timeInForce,
    this.expiryTimeUs = const Value.absent(),
    required String status,
    required int createTimeUs,
    required int lastModifiedUs,
    required int magicNumber,
    required String comment,
    this.distanceFromMarket = const Value.absent(),
  })  : oandaOrderId = Value(oandaOrderId),
        symbol = Value(symbol),
        orderType = Value(orderType),
        direction = Value(direction),
        lots = Value(lots),
        units = Value(units),
        price = Value(price),
        timeInForce = Value(timeInForce),
        status = Value(status),
        createTimeUs = Value(createTimeUs),
        lastModifiedUs = Value(lastModifiedUs),
        magicNumber = Value(magicNumber),
        comment = Value(comment);
  static Insertable<OrdersTableData> custom({
    Expression<int>? id,
    Expression<String>? oandaOrderId,
    Expression<String>? symbol,
    Expression<String>? orderType,
    Expression<String>? direction,
    Expression<double>? lots,
    Expression<double>? units,
    Expression<double>? price,
    Expression<double>? priceBound,
    Expression<double>? stopLoss,
    Expression<double>? takeProfit,
    Expression<String>? timeInForce,
    Expression<int>? expiryTimeUs,
    Expression<String>? status,
    Expression<int>? createTimeUs,
    Expression<int>? lastModifiedUs,
    Expression<int>? magicNumber,
    Expression<String>? comment,
    Expression<double>? distanceFromMarket,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (oandaOrderId != null) 'oanda_order_id': oandaOrderId,
      if (symbol != null) 'symbol': symbol,
      if (orderType != null) 'order_type': orderType,
      if (direction != null) 'direction': direction,
      if (lots != null) 'lots': lots,
      if (units != null) 'units': units,
      if (price != null) 'price': price,
      if (priceBound != null) 'price_bound': priceBound,
      if (stopLoss != null) 'stop_loss': stopLoss,
      if (takeProfit != null) 'take_profit': takeProfit,
      if (timeInForce != null) 'time_in_force': timeInForce,
      if (expiryTimeUs != null) 'expiry_time_us': expiryTimeUs,
      if (status != null) 'status': status,
      if (createTimeUs != null) 'create_time_us': createTimeUs,
      if (lastModifiedUs != null) 'last_modified_us': lastModifiedUs,
      if (magicNumber != null) 'magic_number': magicNumber,
      if (comment != null) 'comment': comment,
      if (distanceFromMarket != null)
        'distance_from_market': distanceFromMarket,
    });
  }

  OrdersTableCompanion copyWith(
      {Value<int>? id,
      Value<String>? oandaOrderId,
      Value<String>? symbol,
      Value<String>? orderType,
      Value<String>? direction,
      Value<double>? lots,
      Value<double>? units,
      Value<double>? price,
      Value<double?>? priceBound,
      Value<double?>? stopLoss,
      Value<double?>? takeProfit,
      Value<String>? timeInForce,
      Value<int?>? expiryTimeUs,
      Value<String>? status,
      Value<int>? createTimeUs,
      Value<int>? lastModifiedUs,
      Value<int>? magicNumber,
      Value<String>? comment,
      Value<double?>? distanceFromMarket}) {
    return OrdersTableCompanion(
      id: id ?? this.id,
      oandaOrderId: oandaOrderId ?? this.oandaOrderId,
      symbol: symbol ?? this.symbol,
      orderType: orderType ?? this.orderType,
      direction: direction ?? this.direction,
      lots: lots ?? this.lots,
      units: units ?? this.units,
      price: price ?? this.price,
      priceBound: priceBound ?? this.priceBound,
      stopLoss: stopLoss ?? this.stopLoss,
      takeProfit: takeProfit ?? this.takeProfit,
      timeInForce: timeInForce ?? this.timeInForce,
      expiryTimeUs: expiryTimeUs ?? this.expiryTimeUs,
      status: status ?? this.status,
      createTimeUs: createTimeUs ?? this.createTimeUs,
      lastModifiedUs: lastModifiedUs ?? this.lastModifiedUs,
      magicNumber: magicNumber ?? this.magicNumber,
      comment: comment ?? this.comment,
      distanceFromMarket: distanceFromMarket ?? this.distanceFromMarket,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (oandaOrderId.present) {
      map['oanda_order_id'] = Variable<String>(oandaOrderId.value);
    }
    if (symbol.present) {
      map['symbol'] = Variable<String>(symbol.value);
    }
    if (orderType.present) {
      map['order_type'] = Variable<String>(orderType.value);
    }
    if (direction.present) {
      map['direction'] = Variable<String>(direction.value);
    }
    if (lots.present) {
      map['lots'] = Variable<double>(lots.value);
    }
    if (units.present) {
      map['units'] = Variable<double>(units.value);
    }
    if (price.present) {
      map['price'] = Variable<double>(price.value);
    }
    if (priceBound.present) {
      map['price_bound'] = Variable<double>(priceBound.value);
    }
    if (stopLoss.present) {
      map['stop_loss'] = Variable<double>(stopLoss.value);
    }
    if (takeProfit.present) {
      map['take_profit'] = Variable<double>(takeProfit.value);
    }
    if (timeInForce.present) {
      map['time_in_force'] = Variable<String>(timeInForce.value);
    }
    if (expiryTimeUs.present) {
      map['expiry_time_us'] = Variable<int>(expiryTimeUs.value);
    }
    if (status.present) {
      map['status'] = Variable<String>(status.value);
    }
    if (createTimeUs.present) {
      map['create_time_us'] = Variable<int>(createTimeUs.value);
    }
    if (lastModifiedUs.present) {
      map['last_modified_us'] = Variable<int>(lastModifiedUs.value);
    }
    if (magicNumber.present) {
      map['magic_number'] = Variable<int>(magicNumber.value);
    }
    if (comment.present) {
      map['comment'] = Variable<String>(comment.value);
    }
    if (distanceFromMarket.present) {
      map['distance_from_market'] = Variable<double>(distanceFromMarket.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('OrdersTableCompanion(')
          ..write('id: $id, ')
          ..write('oandaOrderId: $oandaOrderId, ')
          ..write('symbol: $symbol, ')
          ..write('orderType: $orderType, ')
          ..write('direction: $direction, ')
          ..write('lots: $lots, ')
          ..write('units: $units, ')
          ..write('price: $price, ')
          ..write('priceBound: $priceBound, ')
          ..write('stopLoss: $stopLoss, ')
          ..write('takeProfit: $takeProfit, ')
          ..write('timeInForce: $timeInForce, ')
          ..write('expiryTimeUs: $expiryTimeUs, ')
          ..write('status: $status, ')
          ..write('createTimeUs: $createTimeUs, ')
          ..write('lastModifiedUs: $lastModifiedUs, ')
          ..write('magicNumber: $magicNumber, ')
          ..write('comment: $comment, ')
          ..write('distanceFromMarket: $distanceFromMarket')
          ..write(')'))
        .toString();
  }
}

class $ClosedTradesTableTable extends ClosedTradesTable
    with TableInfo<$ClosedTradesTableTable, ClosedTradesTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ClosedTradesTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _oandaTradeIdMeta =
      const VerificationMeta('oandaTradeId');
  @override
  late final GeneratedColumn<String> oandaTradeId = GeneratedColumn<String>(
      'oanda_trade_id', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      defaultConstraints: GeneratedColumn.constraintIsAlways('UNIQUE'));
  static const VerificationMeta _symbolMeta = const VerificationMeta('symbol');
  @override
  late final GeneratedColumn<String> symbol = GeneratedColumn<String>(
      'symbol', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _directionMeta =
      const VerificationMeta('direction');
  @override
  late final GeneratedColumn<String> direction = GeneratedColumn<String>(
      'direction', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _lotsMeta = const VerificationMeta('lots');
  @override
  late final GeneratedColumn<double> lots = GeneratedColumn<double>(
      'lots', aliasedName, false,
      type: DriftSqlType.double, requiredDuringInsert: true);
  static const VerificationMeta _unitsMeta = const VerificationMeta('units');
  @override
  late final GeneratedColumn<double> units = GeneratedColumn<double>(
      'units', aliasedName, false,
      type: DriftSqlType.double, requiredDuringInsert: true);
  static const VerificationMeta _openPriceMeta =
      const VerificationMeta('openPrice');
  @override
  late final GeneratedColumn<double> openPrice = GeneratedColumn<double>(
      'open_price', aliasedName, false,
      type: DriftSqlType.double, requiredDuringInsert: true);
  static const VerificationMeta _closePriceMeta =
      const VerificationMeta('closePrice');
  @override
  late final GeneratedColumn<double> closePrice = GeneratedColumn<double>(
      'close_price', aliasedName, false,
      type: DriftSqlType.double, requiredDuringInsert: true);
  static const VerificationMeta _stopLossMeta =
      const VerificationMeta('stopLoss');
  @override
  late final GeneratedColumn<double> stopLoss = GeneratedColumn<double>(
      'stop_loss', aliasedName, true,
      type: DriftSqlType.double, requiredDuringInsert: false);
  static const VerificationMeta _takeProfitMeta =
      const VerificationMeta('takeProfit');
  @override
  late final GeneratedColumn<double> takeProfit = GeneratedColumn<double>(
      'take_profit', aliasedName, true,
      type: DriftSqlType.double, requiredDuringInsert: false);
  static const VerificationMeta _realizedPnlMeta =
      const VerificationMeta('realizedPnl');
  @override
  late final GeneratedColumn<double> realizedPnl = GeneratedColumn<double>(
      'realized_pnl', aliasedName, false,
      type: DriftSqlType.double, requiredDuringInsert: true);
  static const VerificationMeta _swapMeta = const VerificationMeta('swap');
  @override
  late final GeneratedColumn<double> swap = GeneratedColumn<double>(
      'swap', aliasedName, false,
      type: DriftSqlType.double, requiredDuringInsert: true);
  static const VerificationMeta _commissionMeta =
      const VerificationMeta('commission');
  @override
  late final GeneratedColumn<double> commission = GeneratedColumn<double>(
      'commission', aliasedName, false,
      type: DriftSqlType.double, requiredDuringInsert: true);
  static const VerificationMeta _netProfitMeta =
      const VerificationMeta('netProfit');
  @override
  late final GeneratedColumn<double> netProfit = GeneratedColumn<double>(
      'net_profit', aliasedName, false,
      type: DriftSqlType.double, requiredDuringInsert: true);
  static const VerificationMeta _maxProfitMeta =
      const VerificationMeta('maxProfit');
  @override
  late final GeneratedColumn<double> maxProfit = GeneratedColumn<double>(
      'max_profit', aliasedName, false,
      type: DriftSqlType.double, requiredDuringInsert: true);
  static const VerificationMeta _maxDrawdownMeta =
      const VerificationMeta('maxDrawdown');
  @override
  late final GeneratedColumn<double> maxDrawdown = GeneratedColumn<double>(
      'max_drawdown', aliasedName, false,
      type: DriftSqlType.double, requiredDuringInsert: true);
  static const VerificationMeta _priceDeltaPipsMeta =
      const VerificationMeta('priceDeltaPips');
  @override
  late final GeneratedColumn<double> priceDeltaPips = GeneratedColumn<double>(
      'price_delta_pips', aliasedName, false,
      type: DriftSqlType.double, requiredDuringInsert: true);
  static const VerificationMeta _closeReasonMeta =
      const VerificationMeta('closeReason');
  @override
  late final GeneratedColumn<String> closeReason = GeneratedColumn<String>(
      'close_reason', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _openTimeUsMeta =
      const VerificationMeta('openTimeUs');
  @override
  late final GeneratedColumn<int> openTimeUs = GeneratedColumn<int>(
      'open_time_us', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _closeTimeUsMeta =
      const VerificationMeta('closeTimeUs');
  @override
  late final GeneratedColumn<int> closeTimeUs = GeneratedColumn<int>(
      'close_time_us', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _durationSecondsMeta =
      const VerificationMeta('durationSeconds');
  @override
  late final GeneratedColumn<int> durationSeconds = GeneratedColumn<int>(
      'duration_seconds', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _openSessionMeta =
      const VerificationMeta('openSession');
  @override
  late final GeneratedColumn<String> openSession = GeneratedColumn<String>(
      'open_session', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _magicNumberMeta =
      const VerificationMeta('magicNumber');
  @override
  late final GeneratedColumn<int> magicNumber = GeneratedColumn<int>(
      'magic_number', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _commentMeta =
      const VerificationMeta('comment');
  @override
  late final GeneratedColumn<String> comment = GeneratedColumn<String>(
      'comment', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _closeDateMeta =
      const VerificationMeta('closeDate');
  @override
  late final GeneratedColumn<String> closeDate = GeneratedColumn<String>(
      'close_date', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [
        id,
        oandaTradeId,
        symbol,
        direction,
        lots,
        units,
        openPrice,
        closePrice,
        stopLoss,
        takeProfit,
        realizedPnl,
        swap,
        commission,
        netProfit,
        maxProfit,
        maxDrawdown,
        priceDeltaPips,
        closeReason,
        openTimeUs,
        closeTimeUs,
        durationSeconds,
        openSession,
        magicNumber,
        comment,
        closeDate
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'closed_trades_table';
  @override
  VerificationContext validateIntegrity(
      Insertable<ClosedTradesTableData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('oanda_trade_id')) {
      context.handle(
          _oandaTradeIdMeta,
          oandaTradeId.isAcceptableOrUnknown(
              data['oanda_trade_id']!, _oandaTradeIdMeta));
    } else if (isInserting) {
      context.missing(_oandaTradeIdMeta);
    }
    if (data.containsKey('symbol')) {
      context.handle(_symbolMeta,
          symbol.isAcceptableOrUnknown(data['symbol']!, _symbolMeta));
    } else if (isInserting) {
      context.missing(_symbolMeta);
    }
    if (data.containsKey('direction')) {
      context.handle(_directionMeta,
          direction.isAcceptableOrUnknown(data['direction']!, _directionMeta));
    } else if (isInserting) {
      context.missing(_directionMeta);
    }
    if (data.containsKey('lots')) {
      context.handle(
          _lotsMeta, lots.isAcceptableOrUnknown(data['lots']!, _lotsMeta));
    } else if (isInserting) {
      context.missing(_lotsMeta);
    }
    if (data.containsKey('units')) {
      context.handle(
          _unitsMeta, units.isAcceptableOrUnknown(data['units']!, _unitsMeta));
    } else if (isInserting) {
      context.missing(_unitsMeta);
    }
    if (data.containsKey('open_price')) {
      context.handle(_openPriceMeta,
          openPrice.isAcceptableOrUnknown(data['open_price']!, _openPriceMeta));
    } else if (isInserting) {
      context.missing(_openPriceMeta);
    }
    if (data.containsKey('close_price')) {
      context.handle(
          _closePriceMeta,
          closePrice.isAcceptableOrUnknown(
              data['close_price']!, _closePriceMeta));
    } else if (isInserting) {
      context.missing(_closePriceMeta);
    }
    if (data.containsKey('stop_loss')) {
      context.handle(_stopLossMeta,
          stopLoss.isAcceptableOrUnknown(data['stop_loss']!, _stopLossMeta));
    }
    if (data.containsKey('take_profit')) {
      context.handle(
          _takeProfitMeta,
          takeProfit.isAcceptableOrUnknown(
              data['take_profit']!, _takeProfitMeta));
    }
    if (data.containsKey('realized_pnl')) {
      context.handle(
          _realizedPnlMeta,
          realizedPnl.isAcceptableOrUnknown(
              data['realized_pnl']!, _realizedPnlMeta));
    } else if (isInserting) {
      context.missing(_realizedPnlMeta);
    }
    if (data.containsKey('swap')) {
      context.handle(
          _swapMeta, swap.isAcceptableOrUnknown(data['swap']!, _swapMeta));
    } else if (isInserting) {
      context.missing(_swapMeta);
    }
    if (data.containsKey('commission')) {
      context.handle(
          _commissionMeta,
          commission.isAcceptableOrUnknown(
              data['commission']!, _commissionMeta));
    } else if (isInserting) {
      context.missing(_commissionMeta);
    }
    if (data.containsKey('net_profit')) {
      context.handle(_netProfitMeta,
          netProfit.isAcceptableOrUnknown(data['net_profit']!, _netProfitMeta));
    } else if (isInserting) {
      context.missing(_netProfitMeta);
    }
    if (data.containsKey('max_profit')) {
      context.handle(_maxProfitMeta,
          maxProfit.isAcceptableOrUnknown(data['max_profit']!, _maxProfitMeta));
    } else if (isInserting) {
      context.missing(_maxProfitMeta);
    }
    if (data.containsKey('max_drawdown')) {
      context.handle(
          _maxDrawdownMeta,
          maxDrawdown.isAcceptableOrUnknown(
              data['max_drawdown']!, _maxDrawdownMeta));
    } else if (isInserting) {
      context.missing(_maxDrawdownMeta);
    }
    if (data.containsKey('price_delta_pips')) {
      context.handle(
          _priceDeltaPipsMeta,
          priceDeltaPips.isAcceptableOrUnknown(
              data['price_delta_pips']!, _priceDeltaPipsMeta));
    } else if (isInserting) {
      context.missing(_priceDeltaPipsMeta);
    }
    if (data.containsKey('close_reason')) {
      context.handle(
          _closeReasonMeta,
          closeReason.isAcceptableOrUnknown(
              data['close_reason']!, _closeReasonMeta));
    } else if (isInserting) {
      context.missing(_closeReasonMeta);
    }
    if (data.containsKey('open_time_us')) {
      context.handle(
          _openTimeUsMeta,
          openTimeUs.isAcceptableOrUnknown(
              data['open_time_us']!, _openTimeUsMeta));
    } else if (isInserting) {
      context.missing(_openTimeUsMeta);
    }
    if (data.containsKey('close_time_us')) {
      context.handle(
          _closeTimeUsMeta,
          closeTimeUs.isAcceptableOrUnknown(
              data['close_time_us']!, _closeTimeUsMeta));
    } else if (isInserting) {
      context.missing(_closeTimeUsMeta);
    }
    if (data.containsKey('duration_seconds')) {
      context.handle(
          _durationSecondsMeta,
          durationSeconds.isAcceptableOrUnknown(
              data['duration_seconds']!, _durationSecondsMeta));
    } else if (isInserting) {
      context.missing(_durationSecondsMeta);
    }
    if (data.containsKey('open_session')) {
      context.handle(
          _openSessionMeta,
          openSession.isAcceptableOrUnknown(
              data['open_session']!, _openSessionMeta));
    } else if (isInserting) {
      context.missing(_openSessionMeta);
    }
    if (data.containsKey('magic_number')) {
      context.handle(
          _magicNumberMeta,
          magicNumber.isAcceptableOrUnknown(
              data['magic_number']!, _magicNumberMeta));
    } else if (isInserting) {
      context.missing(_magicNumberMeta);
    }
    if (data.containsKey('comment')) {
      context.handle(_commentMeta,
          comment.isAcceptableOrUnknown(data['comment']!, _commentMeta));
    } else if (isInserting) {
      context.missing(_commentMeta);
    }
    if (data.containsKey('close_date')) {
      context.handle(_closeDateMeta,
          closeDate.isAcceptableOrUnknown(data['close_date']!, _closeDateMeta));
    } else if (isInserting) {
      context.missing(_closeDateMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  ClosedTradesTableData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return ClosedTradesTableData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      oandaTradeId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}oanda_trade_id'])!,
      symbol: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}symbol'])!,
      direction: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}direction'])!,
      lots: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}lots'])!,
      units: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}units'])!,
      openPrice: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}open_price'])!,
      closePrice: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}close_price'])!,
      stopLoss: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}stop_loss']),
      takeProfit: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}take_profit']),
      realizedPnl: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}realized_pnl'])!,
      swap: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}swap'])!,
      commission: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}commission'])!,
      netProfit: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}net_profit'])!,
      maxProfit: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}max_profit'])!,
      maxDrawdown: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}max_drawdown'])!,
      priceDeltaPips: attachedDatabase.typeMapping.read(
          DriftSqlType.double, data['${effectivePrefix}price_delta_pips'])!,
      closeReason: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}close_reason'])!,
      openTimeUs: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}open_time_us'])!,
      closeTimeUs: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}close_time_us'])!,
      durationSeconds: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}duration_seconds'])!,
      openSession: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}open_session'])!,
      magicNumber: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}magic_number'])!,
      comment: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}comment'])!,
      closeDate: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}close_date'])!,
    );
  }

  @override
  $ClosedTradesTableTable createAlias(String alias) {
    return $ClosedTradesTableTable(attachedDatabase, alias);
  }
}

class ClosedTradesTableData extends DataClass
    implements Insertable<ClosedTradesTableData> {
  final int id;
  final String oandaTradeId;
  final String symbol;
  final String direction;
  final double lots;
  final double units;
  final double openPrice;
  final double closePrice;
  final double? stopLoss;
  final double? takeProfit;
  final double realizedPnl;
  final double swap;
  final double commission;
  final double netProfit;
  final double maxProfit;
  final double maxDrawdown;
  final double priceDeltaPips;
  final String closeReason;
  final int openTimeUs;
  final int closeTimeUs;
  final int durationSeconds;
  final String openSession;
  final int magicNumber;
  final String comment;
  final String closeDate;
  const ClosedTradesTableData(
      {required this.id,
      required this.oandaTradeId,
      required this.symbol,
      required this.direction,
      required this.lots,
      required this.units,
      required this.openPrice,
      required this.closePrice,
      this.stopLoss,
      this.takeProfit,
      required this.realizedPnl,
      required this.swap,
      required this.commission,
      required this.netProfit,
      required this.maxProfit,
      required this.maxDrawdown,
      required this.priceDeltaPips,
      required this.closeReason,
      required this.openTimeUs,
      required this.closeTimeUs,
      required this.durationSeconds,
      required this.openSession,
      required this.magicNumber,
      required this.comment,
      required this.closeDate});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['oanda_trade_id'] = Variable<String>(oandaTradeId);
    map['symbol'] = Variable<String>(symbol);
    map['direction'] = Variable<String>(direction);
    map['lots'] = Variable<double>(lots);
    map['units'] = Variable<double>(units);
    map['open_price'] = Variable<double>(openPrice);
    map['close_price'] = Variable<double>(closePrice);
    if (!nullToAbsent || stopLoss != null) {
      map['stop_loss'] = Variable<double>(stopLoss);
    }
    if (!nullToAbsent || takeProfit != null) {
      map['take_profit'] = Variable<double>(takeProfit);
    }
    map['realized_pnl'] = Variable<double>(realizedPnl);
    map['swap'] = Variable<double>(swap);
    map['commission'] = Variable<double>(commission);
    map['net_profit'] = Variable<double>(netProfit);
    map['max_profit'] = Variable<double>(maxProfit);
    map['max_drawdown'] = Variable<double>(maxDrawdown);
    map['price_delta_pips'] = Variable<double>(priceDeltaPips);
    map['close_reason'] = Variable<String>(closeReason);
    map['open_time_us'] = Variable<int>(openTimeUs);
    map['close_time_us'] = Variable<int>(closeTimeUs);
    map['duration_seconds'] = Variable<int>(durationSeconds);
    map['open_session'] = Variable<String>(openSession);
    map['magic_number'] = Variable<int>(magicNumber);
    map['comment'] = Variable<String>(comment);
    map['close_date'] = Variable<String>(closeDate);
    return map;
  }

  ClosedTradesTableCompanion toCompanion(bool nullToAbsent) {
    return ClosedTradesTableCompanion(
      id: Value(id),
      oandaTradeId: Value(oandaTradeId),
      symbol: Value(symbol),
      direction: Value(direction),
      lots: Value(lots),
      units: Value(units),
      openPrice: Value(openPrice),
      closePrice: Value(closePrice),
      stopLoss: stopLoss == null && nullToAbsent
          ? const Value.absent()
          : Value(stopLoss),
      takeProfit: takeProfit == null && nullToAbsent
          ? const Value.absent()
          : Value(takeProfit),
      realizedPnl: Value(realizedPnl),
      swap: Value(swap),
      commission: Value(commission),
      netProfit: Value(netProfit),
      maxProfit: Value(maxProfit),
      maxDrawdown: Value(maxDrawdown),
      priceDeltaPips: Value(priceDeltaPips),
      closeReason: Value(closeReason),
      openTimeUs: Value(openTimeUs),
      closeTimeUs: Value(closeTimeUs),
      durationSeconds: Value(durationSeconds),
      openSession: Value(openSession),
      magicNumber: Value(magicNumber),
      comment: Value(comment),
      closeDate: Value(closeDate),
    );
  }

  factory ClosedTradesTableData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return ClosedTradesTableData(
      id: serializer.fromJson<int>(json['id']),
      oandaTradeId: serializer.fromJson<String>(json['oandaTradeId']),
      symbol: serializer.fromJson<String>(json['symbol']),
      direction: serializer.fromJson<String>(json['direction']),
      lots: serializer.fromJson<double>(json['lots']),
      units: serializer.fromJson<double>(json['units']),
      openPrice: serializer.fromJson<double>(json['openPrice']),
      closePrice: serializer.fromJson<double>(json['closePrice']),
      stopLoss: serializer.fromJson<double?>(json['stopLoss']),
      takeProfit: serializer.fromJson<double?>(json['takeProfit']),
      realizedPnl: serializer.fromJson<double>(json['realizedPnl']),
      swap: serializer.fromJson<double>(json['swap']),
      commission: serializer.fromJson<double>(json['commission']),
      netProfit: serializer.fromJson<double>(json['netProfit']),
      maxProfit: serializer.fromJson<double>(json['maxProfit']),
      maxDrawdown: serializer.fromJson<double>(json['maxDrawdown']),
      priceDeltaPips: serializer.fromJson<double>(json['priceDeltaPips']),
      closeReason: serializer.fromJson<String>(json['closeReason']),
      openTimeUs: serializer.fromJson<int>(json['openTimeUs']),
      closeTimeUs: serializer.fromJson<int>(json['closeTimeUs']),
      durationSeconds: serializer.fromJson<int>(json['durationSeconds']),
      openSession: serializer.fromJson<String>(json['openSession']),
      magicNumber: serializer.fromJson<int>(json['magicNumber']),
      comment: serializer.fromJson<String>(json['comment']),
      closeDate: serializer.fromJson<String>(json['closeDate']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'oandaTradeId': serializer.toJson<String>(oandaTradeId),
      'symbol': serializer.toJson<String>(symbol),
      'direction': serializer.toJson<String>(direction),
      'lots': serializer.toJson<double>(lots),
      'units': serializer.toJson<double>(units),
      'openPrice': serializer.toJson<double>(openPrice),
      'closePrice': serializer.toJson<double>(closePrice),
      'stopLoss': serializer.toJson<double?>(stopLoss),
      'takeProfit': serializer.toJson<double?>(takeProfit),
      'realizedPnl': serializer.toJson<double>(realizedPnl),
      'swap': serializer.toJson<double>(swap),
      'commission': serializer.toJson<double>(commission),
      'netProfit': serializer.toJson<double>(netProfit),
      'maxProfit': serializer.toJson<double>(maxProfit),
      'maxDrawdown': serializer.toJson<double>(maxDrawdown),
      'priceDeltaPips': serializer.toJson<double>(priceDeltaPips),
      'closeReason': serializer.toJson<String>(closeReason),
      'openTimeUs': serializer.toJson<int>(openTimeUs),
      'closeTimeUs': serializer.toJson<int>(closeTimeUs),
      'durationSeconds': serializer.toJson<int>(durationSeconds),
      'openSession': serializer.toJson<String>(openSession),
      'magicNumber': serializer.toJson<int>(magicNumber),
      'comment': serializer.toJson<String>(comment),
      'closeDate': serializer.toJson<String>(closeDate),
    };
  }

  ClosedTradesTableData copyWith(
          {int? id,
          String? oandaTradeId,
          String? symbol,
          String? direction,
          double? lots,
          double? units,
          double? openPrice,
          double? closePrice,
          Value<double?> stopLoss = const Value.absent(),
          Value<double?> takeProfit = const Value.absent(),
          double? realizedPnl,
          double? swap,
          double? commission,
          double? netProfit,
          double? maxProfit,
          double? maxDrawdown,
          double? priceDeltaPips,
          String? closeReason,
          int? openTimeUs,
          int? closeTimeUs,
          int? durationSeconds,
          String? openSession,
          int? magicNumber,
          String? comment,
          String? closeDate}) =>
      ClosedTradesTableData(
        id: id ?? this.id,
        oandaTradeId: oandaTradeId ?? this.oandaTradeId,
        symbol: symbol ?? this.symbol,
        direction: direction ?? this.direction,
        lots: lots ?? this.lots,
        units: units ?? this.units,
        openPrice: openPrice ?? this.openPrice,
        closePrice: closePrice ?? this.closePrice,
        stopLoss: stopLoss.present ? stopLoss.value : this.stopLoss,
        takeProfit: takeProfit.present ? takeProfit.value : this.takeProfit,
        realizedPnl: realizedPnl ?? this.realizedPnl,
        swap: swap ?? this.swap,
        commission: commission ?? this.commission,
        netProfit: netProfit ?? this.netProfit,
        maxProfit: maxProfit ?? this.maxProfit,
        maxDrawdown: maxDrawdown ?? this.maxDrawdown,
        priceDeltaPips: priceDeltaPips ?? this.priceDeltaPips,
        closeReason: closeReason ?? this.closeReason,
        openTimeUs: openTimeUs ?? this.openTimeUs,
        closeTimeUs: closeTimeUs ?? this.closeTimeUs,
        durationSeconds: durationSeconds ?? this.durationSeconds,
        openSession: openSession ?? this.openSession,
        magicNumber: magicNumber ?? this.magicNumber,
        comment: comment ?? this.comment,
        closeDate: closeDate ?? this.closeDate,
      );
  ClosedTradesTableData copyWithCompanion(ClosedTradesTableCompanion data) {
    return ClosedTradesTableData(
      id: data.id.present ? data.id.value : this.id,
      oandaTradeId: data.oandaTradeId.present
          ? data.oandaTradeId.value
          : this.oandaTradeId,
      symbol: data.symbol.present ? data.symbol.value : this.symbol,
      direction: data.direction.present ? data.direction.value : this.direction,
      lots: data.lots.present ? data.lots.value : this.lots,
      units: data.units.present ? data.units.value : this.units,
      openPrice: data.openPrice.present ? data.openPrice.value : this.openPrice,
      closePrice:
          data.closePrice.present ? data.closePrice.value : this.closePrice,
      stopLoss: data.stopLoss.present ? data.stopLoss.value : this.stopLoss,
      takeProfit:
          data.takeProfit.present ? data.takeProfit.value : this.takeProfit,
      realizedPnl:
          data.realizedPnl.present ? data.realizedPnl.value : this.realizedPnl,
      swap: data.swap.present ? data.swap.value : this.swap,
      commission:
          data.commission.present ? data.commission.value : this.commission,
      netProfit: data.netProfit.present ? data.netProfit.value : this.netProfit,
      maxProfit: data.maxProfit.present ? data.maxProfit.value : this.maxProfit,
      maxDrawdown:
          data.maxDrawdown.present ? data.maxDrawdown.value : this.maxDrawdown,
      priceDeltaPips: data.priceDeltaPips.present
          ? data.priceDeltaPips.value
          : this.priceDeltaPips,
      closeReason:
          data.closeReason.present ? data.closeReason.value : this.closeReason,
      openTimeUs:
          data.openTimeUs.present ? data.openTimeUs.value : this.openTimeUs,
      closeTimeUs:
          data.closeTimeUs.present ? data.closeTimeUs.value : this.closeTimeUs,
      durationSeconds: data.durationSeconds.present
          ? data.durationSeconds.value
          : this.durationSeconds,
      openSession:
          data.openSession.present ? data.openSession.value : this.openSession,
      magicNumber:
          data.magicNumber.present ? data.magicNumber.value : this.magicNumber,
      comment: data.comment.present ? data.comment.value : this.comment,
      closeDate: data.closeDate.present ? data.closeDate.value : this.closeDate,
    );
  }

  @override
  String toString() {
    return (StringBuffer('ClosedTradesTableData(')
          ..write('id: $id, ')
          ..write('oandaTradeId: $oandaTradeId, ')
          ..write('symbol: $symbol, ')
          ..write('direction: $direction, ')
          ..write('lots: $lots, ')
          ..write('units: $units, ')
          ..write('openPrice: $openPrice, ')
          ..write('closePrice: $closePrice, ')
          ..write('stopLoss: $stopLoss, ')
          ..write('takeProfit: $takeProfit, ')
          ..write('realizedPnl: $realizedPnl, ')
          ..write('swap: $swap, ')
          ..write('commission: $commission, ')
          ..write('netProfit: $netProfit, ')
          ..write('maxProfit: $maxProfit, ')
          ..write('maxDrawdown: $maxDrawdown, ')
          ..write('priceDeltaPips: $priceDeltaPips, ')
          ..write('closeReason: $closeReason, ')
          ..write('openTimeUs: $openTimeUs, ')
          ..write('closeTimeUs: $closeTimeUs, ')
          ..write('durationSeconds: $durationSeconds, ')
          ..write('openSession: $openSession, ')
          ..write('magicNumber: $magicNumber, ')
          ..write('comment: $comment, ')
          ..write('closeDate: $closeDate')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hashAll([
        id,
        oandaTradeId,
        symbol,
        direction,
        lots,
        units,
        openPrice,
        closePrice,
        stopLoss,
        takeProfit,
        realizedPnl,
        swap,
        commission,
        netProfit,
        maxProfit,
        maxDrawdown,
        priceDeltaPips,
        closeReason,
        openTimeUs,
        closeTimeUs,
        durationSeconds,
        openSession,
        magicNumber,
        comment,
        closeDate
      ]);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ClosedTradesTableData &&
          other.id == this.id &&
          other.oandaTradeId == this.oandaTradeId &&
          other.symbol == this.symbol &&
          other.direction == this.direction &&
          other.lots == this.lots &&
          other.units == this.units &&
          other.openPrice == this.openPrice &&
          other.closePrice == this.closePrice &&
          other.stopLoss == this.stopLoss &&
          other.takeProfit == this.takeProfit &&
          other.realizedPnl == this.realizedPnl &&
          other.swap == this.swap &&
          other.commission == this.commission &&
          other.netProfit == this.netProfit &&
          other.maxProfit == this.maxProfit &&
          other.maxDrawdown == this.maxDrawdown &&
          other.priceDeltaPips == this.priceDeltaPips &&
          other.closeReason == this.closeReason &&
          other.openTimeUs == this.openTimeUs &&
          other.closeTimeUs == this.closeTimeUs &&
          other.durationSeconds == this.durationSeconds &&
          other.openSession == this.openSession &&
          other.magicNumber == this.magicNumber &&
          other.comment == this.comment &&
          other.closeDate == this.closeDate);
}

class ClosedTradesTableCompanion
    extends UpdateCompanion<ClosedTradesTableData> {
  final Value<int> id;
  final Value<String> oandaTradeId;
  final Value<String> symbol;
  final Value<String> direction;
  final Value<double> lots;
  final Value<double> units;
  final Value<double> openPrice;
  final Value<double> closePrice;
  final Value<double?> stopLoss;
  final Value<double?> takeProfit;
  final Value<double> realizedPnl;
  final Value<double> swap;
  final Value<double> commission;
  final Value<double> netProfit;
  final Value<double> maxProfit;
  final Value<double> maxDrawdown;
  final Value<double> priceDeltaPips;
  final Value<String> closeReason;
  final Value<int> openTimeUs;
  final Value<int> closeTimeUs;
  final Value<int> durationSeconds;
  final Value<String> openSession;
  final Value<int> magicNumber;
  final Value<String> comment;
  final Value<String> closeDate;
  const ClosedTradesTableCompanion({
    this.id = const Value.absent(),
    this.oandaTradeId = const Value.absent(),
    this.symbol = const Value.absent(),
    this.direction = const Value.absent(),
    this.lots = const Value.absent(),
    this.units = const Value.absent(),
    this.openPrice = const Value.absent(),
    this.closePrice = const Value.absent(),
    this.stopLoss = const Value.absent(),
    this.takeProfit = const Value.absent(),
    this.realizedPnl = const Value.absent(),
    this.swap = const Value.absent(),
    this.commission = const Value.absent(),
    this.netProfit = const Value.absent(),
    this.maxProfit = const Value.absent(),
    this.maxDrawdown = const Value.absent(),
    this.priceDeltaPips = const Value.absent(),
    this.closeReason = const Value.absent(),
    this.openTimeUs = const Value.absent(),
    this.closeTimeUs = const Value.absent(),
    this.durationSeconds = const Value.absent(),
    this.openSession = const Value.absent(),
    this.magicNumber = const Value.absent(),
    this.comment = const Value.absent(),
    this.closeDate = const Value.absent(),
  });
  ClosedTradesTableCompanion.insert({
    this.id = const Value.absent(),
    required String oandaTradeId,
    required String symbol,
    required String direction,
    required double lots,
    required double units,
    required double openPrice,
    required double closePrice,
    this.stopLoss = const Value.absent(),
    this.takeProfit = const Value.absent(),
    required double realizedPnl,
    required double swap,
    required double commission,
    required double netProfit,
    required double maxProfit,
    required double maxDrawdown,
    required double priceDeltaPips,
    required String closeReason,
    required int openTimeUs,
    required int closeTimeUs,
    required int durationSeconds,
    required String openSession,
    required int magicNumber,
    required String comment,
    required String closeDate,
  })  : oandaTradeId = Value(oandaTradeId),
        symbol = Value(symbol),
        direction = Value(direction),
        lots = Value(lots),
        units = Value(units),
        openPrice = Value(openPrice),
        closePrice = Value(closePrice),
        realizedPnl = Value(realizedPnl),
        swap = Value(swap),
        commission = Value(commission),
        netProfit = Value(netProfit),
        maxProfit = Value(maxProfit),
        maxDrawdown = Value(maxDrawdown),
        priceDeltaPips = Value(priceDeltaPips),
        closeReason = Value(closeReason),
        openTimeUs = Value(openTimeUs),
        closeTimeUs = Value(closeTimeUs),
        durationSeconds = Value(durationSeconds),
        openSession = Value(openSession),
        magicNumber = Value(magicNumber),
        comment = Value(comment),
        closeDate = Value(closeDate);
  static Insertable<ClosedTradesTableData> custom({
    Expression<int>? id,
    Expression<String>? oandaTradeId,
    Expression<String>? symbol,
    Expression<String>? direction,
    Expression<double>? lots,
    Expression<double>? units,
    Expression<double>? openPrice,
    Expression<double>? closePrice,
    Expression<double>? stopLoss,
    Expression<double>? takeProfit,
    Expression<double>? realizedPnl,
    Expression<double>? swap,
    Expression<double>? commission,
    Expression<double>? netProfit,
    Expression<double>? maxProfit,
    Expression<double>? maxDrawdown,
    Expression<double>? priceDeltaPips,
    Expression<String>? closeReason,
    Expression<int>? openTimeUs,
    Expression<int>? closeTimeUs,
    Expression<int>? durationSeconds,
    Expression<String>? openSession,
    Expression<int>? magicNumber,
    Expression<String>? comment,
    Expression<String>? closeDate,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (oandaTradeId != null) 'oanda_trade_id': oandaTradeId,
      if (symbol != null) 'symbol': symbol,
      if (direction != null) 'direction': direction,
      if (lots != null) 'lots': lots,
      if (units != null) 'units': units,
      if (openPrice != null) 'open_price': openPrice,
      if (closePrice != null) 'close_price': closePrice,
      if (stopLoss != null) 'stop_loss': stopLoss,
      if (takeProfit != null) 'take_profit': takeProfit,
      if (realizedPnl != null) 'realized_pnl': realizedPnl,
      if (swap != null) 'swap': swap,
      if (commission != null) 'commission': commission,
      if (netProfit != null) 'net_profit': netProfit,
      if (maxProfit != null) 'max_profit': maxProfit,
      if (maxDrawdown != null) 'max_drawdown': maxDrawdown,
      if (priceDeltaPips != null) 'price_delta_pips': priceDeltaPips,
      if (closeReason != null) 'close_reason': closeReason,
      if (openTimeUs != null) 'open_time_us': openTimeUs,
      if (closeTimeUs != null) 'close_time_us': closeTimeUs,
      if (durationSeconds != null) 'duration_seconds': durationSeconds,
      if (openSession != null) 'open_session': openSession,
      if (magicNumber != null) 'magic_number': magicNumber,
      if (comment != null) 'comment': comment,
      if (closeDate != null) 'close_date': closeDate,
    });
  }

  ClosedTradesTableCompanion copyWith(
      {Value<int>? id,
      Value<String>? oandaTradeId,
      Value<String>? symbol,
      Value<String>? direction,
      Value<double>? lots,
      Value<double>? units,
      Value<double>? openPrice,
      Value<double>? closePrice,
      Value<double?>? stopLoss,
      Value<double?>? takeProfit,
      Value<double>? realizedPnl,
      Value<double>? swap,
      Value<double>? commission,
      Value<double>? netProfit,
      Value<double>? maxProfit,
      Value<double>? maxDrawdown,
      Value<double>? priceDeltaPips,
      Value<String>? closeReason,
      Value<int>? openTimeUs,
      Value<int>? closeTimeUs,
      Value<int>? durationSeconds,
      Value<String>? openSession,
      Value<int>? magicNumber,
      Value<String>? comment,
      Value<String>? closeDate}) {
    return ClosedTradesTableCompanion(
      id: id ?? this.id,
      oandaTradeId: oandaTradeId ?? this.oandaTradeId,
      symbol: symbol ?? this.symbol,
      direction: direction ?? this.direction,
      lots: lots ?? this.lots,
      units: units ?? this.units,
      openPrice: openPrice ?? this.openPrice,
      closePrice: closePrice ?? this.closePrice,
      stopLoss: stopLoss ?? this.stopLoss,
      takeProfit: takeProfit ?? this.takeProfit,
      realizedPnl: realizedPnl ?? this.realizedPnl,
      swap: swap ?? this.swap,
      commission: commission ?? this.commission,
      netProfit: netProfit ?? this.netProfit,
      maxProfit: maxProfit ?? this.maxProfit,
      maxDrawdown: maxDrawdown ?? this.maxDrawdown,
      priceDeltaPips: priceDeltaPips ?? this.priceDeltaPips,
      closeReason: closeReason ?? this.closeReason,
      openTimeUs: openTimeUs ?? this.openTimeUs,
      closeTimeUs: closeTimeUs ?? this.closeTimeUs,
      durationSeconds: durationSeconds ?? this.durationSeconds,
      openSession: openSession ?? this.openSession,
      magicNumber: magicNumber ?? this.magicNumber,
      comment: comment ?? this.comment,
      closeDate: closeDate ?? this.closeDate,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (oandaTradeId.present) {
      map['oanda_trade_id'] = Variable<String>(oandaTradeId.value);
    }
    if (symbol.present) {
      map['symbol'] = Variable<String>(symbol.value);
    }
    if (direction.present) {
      map['direction'] = Variable<String>(direction.value);
    }
    if (lots.present) {
      map['lots'] = Variable<double>(lots.value);
    }
    if (units.present) {
      map['units'] = Variable<double>(units.value);
    }
    if (openPrice.present) {
      map['open_price'] = Variable<double>(openPrice.value);
    }
    if (closePrice.present) {
      map['close_price'] = Variable<double>(closePrice.value);
    }
    if (stopLoss.present) {
      map['stop_loss'] = Variable<double>(stopLoss.value);
    }
    if (takeProfit.present) {
      map['take_profit'] = Variable<double>(takeProfit.value);
    }
    if (realizedPnl.present) {
      map['realized_pnl'] = Variable<double>(realizedPnl.value);
    }
    if (swap.present) {
      map['swap'] = Variable<double>(swap.value);
    }
    if (commission.present) {
      map['commission'] = Variable<double>(commission.value);
    }
    if (netProfit.present) {
      map['net_profit'] = Variable<double>(netProfit.value);
    }
    if (maxProfit.present) {
      map['max_profit'] = Variable<double>(maxProfit.value);
    }
    if (maxDrawdown.present) {
      map['max_drawdown'] = Variable<double>(maxDrawdown.value);
    }
    if (priceDeltaPips.present) {
      map['price_delta_pips'] = Variable<double>(priceDeltaPips.value);
    }
    if (closeReason.present) {
      map['close_reason'] = Variable<String>(closeReason.value);
    }
    if (openTimeUs.present) {
      map['open_time_us'] = Variable<int>(openTimeUs.value);
    }
    if (closeTimeUs.present) {
      map['close_time_us'] = Variable<int>(closeTimeUs.value);
    }
    if (durationSeconds.present) {
      map['duration_seconds'] = Variable<int>(durationSeconds.value);
    }
    if (openSession.present) {
      map['open_session'] = Variable<String>(openSession.value);
    }
    if (magicNumber.present) {
      map['magic_number'] = Variable<int>(magicNumber.value);
    }
    if (comment.present) {
      map['comment'] = Variable<String>(comment.value);
    }
    if (closeDate.present) {
      map['close_date'] = Variable<String>(closeDate.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ClosedTradesTableCompanion(')
          ..write('id: $id, ')
          ..write('oandaTradeId: $oandaTradeId, ')
          ..write('symbol: $symbol, ')
          ..write('direction: $direction, ')
          ..write('lots: $lots, ')
          ..write('units: $units, ')
          ..write('openPrice: $openPrice, ')
          ..write('closePrice: $closePrice, ')
          ..write('stopLoss: $stopLoss, ')
          ..write('takeProfit: $takeProfit, ')
          ..write('realizedPnl: $realizedPnl, ')
          ..write('swap: $swap, ')
          ..write('commission: $commission, ')
          ..write('netProfit: $netProfit, ')
          ..write('maxProfit: $maxProfit, ')
          ..write('maxDrawdown: $maxDrawdown, ')
          ..write('priceDeltaPips: $priceDeltaPips, ')
          ..write('closeReason: $closeReason, ')
          ..write('openTimeUs: $openTimeUs, ')
          ..write('closeTimeUs: $closeTimeUs, ')
          ..write('durationSeconds: $durationSeconds, ')
          ..write('openSession: $openSession, ')
          ..write('magicNumber: $magicNumber, ')
          ..write('comment: $comment, ')
          ..write('closeDate: $closeDate')
          ..write(')'))
        .toString();
  }
}

class $AccountSnapshotsTableTable extends AccountSnapshotsTable
    with TableInfo<$AccountSnapshotsTableTable, AccountSnapshotsTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $AccountSnapshotsTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _accountIdMeta =
      const VerificationMeta('accountId');
  @override
  late final GeneratedColumn<String> accountId = GeneratedColumn<String>(
      'account_id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _balanceMeta =
      const VerificationMeta('balance');
  @override
  late final GeneratedColumn<double> balance = GeneratedColumn<double>(
      'balance', aliasedName, false,
      type: DriftSqlType.double, requiredDuringInsert: true);
  static const VerificationMeta _equityMeta = const VerificationMeta('equity');
  @override
  late final GeneratedColumn<double> equity = GeneratedColumn<double>(
      'equity', aliasedName, false,
      type: DriftSqlType.double, requiredDuringInsert: true);
  static const VerificationMeta _marginUsedMeta =
      const VerificationMeta('marginUsed');
  @override
  late final GeneratedColumn<double> marginUsed = GeneratedColumn<double>(
      'margin_used', aliasedName, false,
      type: DriftSqlType.double, requiredDuringInsert: true);
  static const VerificationMeta _marginAvailableMeta =
      const VerificationMeta('marginAvailable');
  @override
  late final GeneratedColumn<double> marginAvailable = GeneratedColumn<double>(
      'margin_available', aliasedName, false,
      type: DriftSqlType.double, requiredDuringInsert: true);
  static const VerificationMeta _marginLevelMeta =
      const VerificationMeta('marginLevel');
  @override
  late final GeneratedColumn<double> marginLevel = GeneratedColumn<double>(
      'margin_level', aliasedName, false,
      type: DriftSqlType.double, requiredDuringInsert: true);
  static const VerificationMeta _navMeta = const VerificationMeta('nav');
  @override
  late final GeneratedColumn<double> nav = GeneratedColumn<double>(
      'nav', aliasedName, false,
      type: DriftSqlType.double, requiredDuringInsert: true);
  static const VerificationMeta _openPositionCountMeta =
      const VerificationMeta('openPositionCount');
  @override
  late final GeneratedColumn<int> openPositionCount = GeneratedColumn<int>(
      'open_position_count', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _unrealizedPnlMeta =
      const VerificationMeta('unrealizedPnl');
  @override
  late final GeneratedColumn<double> unrealizedPnl = GeneratedColumn<double>(
      'unrealized_pnl', aliasedName, false,
      type: DriftSqlType.double, requiredDuringInsert: true);
  static const VerificationMeta _dailyRealizedPnlMeta =
      const VerificationMeta('dailyRealizedPnl');
  @override
  late final GeneratedColumn<double> dailyRealizedPnl = GeneratedColumn<double>(
      'daily_realized_pnl', aliasedName, false,
      type: DriftSqlType.double, requiredDuringInsert: true);
  static const VerificationMeta _snapshotTriggerMeta =
      const VerificationMeta('snapshotTrigger');
  @override
  late final GeneratedColumn<String> snapshotTrigger = GeneratedColumn<String>(
      'snapshot_trigger', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _timestampUsMeta =
      const VerificationMeta('timestampUs');
  @override
  late final GeneratedColumn<int> timestampUs = GeneratedColumn<int>(
      'timestamp_us', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _dateMeta = const VerificationMeta('date');
  @override
  late final GeneratedColumn<String> date = GeneratedColumn<String>(
      'date', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [
        id,
        accountId,
        balance,
        equity,
        marginUsed,
        marginAvailable,
        marginLevel,
        nav,
        openPositionCount,
        unrealizedPnl,
        dailyRealizedPnl,
        snapshotTrigger,
        timestampUs,
        date
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'account_snapshots_table';
  @override
  VerificationContext validateIntegrity(
      Insertable<AccountSnapshotsTableData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('account_id')) {
      context.handle(_accountIdMeta,
          accountId.isAcceptableOrUnknown(data['account_id']!, _accountIdMeta));
    } else if (isInserting) {
      context.missing(_accountIdMeta);
    }
    if (data.containsKey('balance')) {
      context.handle(_balanceMeta,
          balance.isAcceptableOrUnknown(data['balance']!, _balanceMeta));
    } else if (isInserting) {
      context.missing(_balanceMeta);
    }
    if (data.containsKey('equity')) {
      context.handle(_equityMeta,
          equity.isAcceptableOrUnknown(data['equity']!, _equityMeta));
    } else if (isInserting) {
      context.missing(_equityMeta);
    }
    if (data.containsKey('margin_used')) {
      context.handle(
          _marginUsedMeta,
          marginUsed.isAcceptableOrUnknown(
              data['margin_used']!, _marginUsedMeta));
    } else if (isInserting) {
      context.missing(_marginUsedMeta);
    }
    if (data.containsKey('margin_available')) {
      context.handle(
          _marginAvailableMeta,
          marginAvailable.isAcceptableOrUnknown(
              data['margin_available']!, _marginAvailableMeta));
    } else if (isInserting) {
      context.missing(_marginAvailableMeta);
    }
    if (data.containsKey('margin_level')) {
      context.handle(
          _marginLevelMeta,
          marginLevel.isAcceptableOrUnknown(
              data['margin_level']!, _marginLevelMeta));
    } else if (isInserting) {
      context.missing(_marginLevelMeta);
    }
    if (data.containsKey('nav')) {
      context.handle(
          _navMeta, nav.isAcceptableOrUnknown(data['nav']!, _navMeta));
    } else if (isInserting) {
      context.missing(_navMeta);
    }
    if (data.containsKey('open_position_count')) {
      context.handle(
          _openPositionCountMeta,
          openPositionCount.isAcceptableOrUnknown(
              data['open_position_count']!, _openPositionCountMeta));
    } else if (isInserting) {
      context.missing(_openPositionCountMeta);
    }
    if (data.containsKey('unrealized_pnl')) {
      context.handle(
          _unrealizedPnlMeta,
          unrealizedPnl.isAcceptableOrUnknown(
              data['unrealized_pnl']!, _unrealizedPnlMeta));
    } else if (isInserting) {
      context.missing(_unrealizedPnlMeta);
    }
    if (data.containsKey('daily_realized_pnl')) {
      context.handle(
          _dailyRealizedPnlMeta,
          dailyRealizedPnl.isAcceptableOrUnknown(
              data['daily_realized_pnl']!, _dailyRealizedPnlMeta));
    } else if (isInserting) {
      context.missing(_dailyRealizedPnlMeta);
    }
    if (data.containsKey('snapshot_trigger')) {
      context.handle(
          _snapshotTriggerMeta,
          snapshotTrigger.isAcceptableOrUnknown(
              data['snapshot_trigger']!, _snapshotTriggerMeta));
    } else if (isInserting) {
      context.missing(_snapshotTriggerMeta);
    }
    if (data.containsKey('timestamp_us')) {
      context.handle(
          _timestampUsMeta,
          timestampUs.isAcceptableOrUnknown(
              data['timestamp_us']!, _timestampUsMeta));
    } else if (isInserting) {
      context.missing(_timestampUsMeta);
    }
    if (data.containsKey('date')) {
      context.handle(
          _dateMeta, date.isAcceptableOrUnknown(data['date']!, _dateMeta));
    } else if (isInserting) {
      context.missing(_dateMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  AccountSnapshotsTableData map(Map<String, dynamic> data,
      {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return AccountSnapshotsTableData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      accountId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}account_id'])!,
      balance: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}balance'])!,
      equity: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}equity'])!,
      marginUsed: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}margin_used'])!,
      marginAvailable: attachedDatabase.typeMapping.read(
          DriftSqlType.double, data['${effectivePrefix}margin_available'])!,
      marginLevel: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}margin_level'])!,
      nav: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}nav'])!,
      openPositionCount: attachedDatabase.typeMapping.read(
          DriftSqlType.int, data['${effectivePrefix}open_position_count'])!,
      unrealizedPnl: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}unrealized_pnl'])!,
      dailyRealizedPnl: attachedDatabase.typeMapping.read(
          DriftSqlType.double, data['${effectivePrefix}daily_realized_pnl'])!,
      snapshotTrigger: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}snapshot_trigger'])!,
      timestampUs: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}timestamp_us'])!,
      date: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}date'])!,
    );
  }

  @override
  $AccountSnapshotsTableTable createAlias(String alias) {
    return $AccountSnapshotsTableTable(attachedDatabase, alias);
  }
}

class AccountSnapshotsTableData extends DataClass
    implements Insertable<AccountSnapshotsTableData> {
  final int id;
  final String accountId;
  final double balance;
  final double equity;
  final double marginUsed;
  final double marginAvailable;
  final double marginLevel;
  final double nav;
  final int openPositionCount;
  final double unrealizedPnl;
  final double dailyRealizedPnl;
  final String snapshotTrigger;
  final int timestampUs;
  final String date;
  const AccountSnapshotsTableData(
      {required this.id,
      required this.accountId,
      required this.balance,
      required this.equity,
      required this.marginUsed,
      required this.marginAvailable,
      required this.marginLevel,
      required this.nav,
      required this.openPositionCount,
      required this.unrealizedPnl,
      required this.dailyRealizedPnl,
      required this.snapshotTrigger,
      required this.timestampUs,
      required this.date});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['account_id'] = Variable<String>(accountId);
    map['balance'] = Variable<double>(balance);
    map['equity'] = Variable<double>(equity);
    map['margin_used'] = Variable<double>(marginUsed);
    map['margin_available'] = Variable<double>(marginAvailable);
    map['margin_level'] = Variable<double>(marginLevel);
    map['nav'] = Variable<double>(nav);
    map['open_position_count'] = Variable<int>(openPositionCount);
    map['unrealized_pnl'] = Variable<double>(unrealizedPnl);
    map['daily_realized_pnl'] = Variable<double>(dailyRealizedPnl);
    map['snapshot_trigger'] = Variable<String>(snapshotTrigger);
    map['timestamp_us'] = Variable<int>(timestampUs);
    map['date'] = Variable<String>(date);
    return map;
  }

  AccountSnapshotsTableCompanion toCompanion(bool nullToAbsent) {
    return AccountSnapshotsTableCompanion(
      id: Value(id),
      accountId: Value(accountId),
      balance: Value(balance),
      equity: Value(equity),
      marginUsed: Value(marginUsed),
      marginAvailable: Value(marginAvailable),
      marginLevel: Value(marginLevel),
      nav: Value(nav),
      openPositionCount: Value(openPositionCount),
      unrealizedPnl: Value(unrealizedPnl),
      dailyRealizedPnl: Value(dailyRealizedPnl),
      snapshotTrigger: Value(snapshotTrigger),
      timestampUs: Value(timestampUs),
      date: Value(date),
    );
  }

  factory AccountSnapshotsTableData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return AccountSnapshotsTableData(
      id: serializer.fromJson<int>(json['id']),
      accountId: serializer.fromJson<String>(json['accountId']),
      balance: serializer.fromJson<double>(json['balance']),
      equity: serializer.fromJson<double>(json['equity']),
      marginUsed: serializer.fromJson<double>(json['marginUsed']),
      marginAvailable: serializer.fromJson<double>(json['marginAvailable']),
      marginLevel: serializer.fromJson<double>(json['marginLevel']),
      nav: serializer.fromJson<double>(json['nav']),
      openPositionCount: serializer.fromJson<int>(json['openPositionCount']),
      unrealizedPnl: serializer.fromJson<double>(json['unrealizedPnl']),
      dailyRealizedPnl: serializer.fromJson<double>(json['dailyRealizedPnl']),
      snapshotTrigger: serializer.fromJson<String>(json['snapshotTrigger']),
      timestampUs: serializer.fromJson<int>(json['timestampUs']),
      date: serializer.fromJson<String>(json['date']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'accountId': serializer.toJson<String>(accountId),
      'balance': serializer.toJson<double>(balance),
      'equity': serializer.toJson<double>(equity),
      'marginUsed': serializer.toJson<double>(marginUsed),
      'marginAvailable': serializer.toJson<double>(marginAvailable),
      'marginLevel': serializer.toJson<double>(marginLevel),
      'nav': serializer.toJson<double>(nav),
      'openPositionCount': serializer.toJson<int>(openPositionCount),
      'unrealizedPnl': serializer.toJson<double>(unrealizedPnl),
      'dailyRealizedPnl': serializer.toJson<double>(dailyRealizedPnl),
      'snapshotTrigger': serializer.toJson<String>(snapshotTrigger),
      'timestampUs': serializer.toJson<int>(timestampUs),
      'date': serializer.toJson<String>(date),
    };
  }

  AccountSnapshotsTableData copyWith(
          {int? id,
          String? accountId,
          double? balance,
          double? equity,
          double? marginUsed,
          double? marginAvailable,
          double? marginLevel,
          double? nav,
          int? openPositionCount,
          double? unrealizedPnl,
          double? dailyRealizedPnl,
          String? snapshotTrigger,
          int? timestampUs,
          String? date}) =>
      AccountSnapshotsTableData(
        id: id ?? this.id,
        accountId: accountId ?? this.accountId,
        balance: balance ?? this.balance,
        equity: equity ?? this.equity,
        marginUsed: marginUsed ?? this.marginUsed,
        marginAvailable: marginAvailable ?? this.marginAvailable,
        marginLevel: marginLevel ?? this.marginLevel,
        nav: nav ?? this.nav,
        openPositionCount: openPositionCount ?? this.openPositionCount,
        unrealizedPnl: unrealizedPnl ?? this.unrealizedPnl,
        dailyRealizedPnl: dailyRealizedPnl ?? this.dailyRealizedPnl,
        snapshotTrigger: snapshotTrigger ?? this.snapshotTrigger,
        timestampUs: timestampUs ?? this.timestampUs,
        date: date ?? this.date,
      );
  AccountSnapshotsTableData copyWithCompanion(
      AccountSnapshotsTableCompanion data) {
    return AccountSnapshotsTableData(
      id: data.id.present ? data.id.value : this.id,
      accountId: data.accountId.present ? data.accountId.value : this.accountId,
      balance: data.balance.present ? data.balance.value : this.balance,
      equity: data.equity.present ? data.equity.value : this.equity,
      marginUsed:
          data.marginUsed.present ? data.marginUsed.value : this.marginUsed,
      marginAvailable: data.marginAvailable.present
          ? data.marginAvailable.value
          : this.marginAvailable,
      marginLevel:
          data.marginLevel.present ? data.marginLevel.value : this.marginLevel,
      nav: data.nav.present ? data.nav.value : this.nav,
      openPositionCount: data.openPositionCount.present
          ? data.openPositionCount.value
          : this.openPositionCount,
      unrealizedPnl: data.unrealizedPnl.present
          ? data.unrealizedPnl.value
          : this.unrealizedPnl,
      dailyRealizedPnl: data.dailyRealizedPnl.present
          ? data.dailyRealizedPnl.value
          : this.dailyRealizedPnl,
      snapshotTrigger: data.snapshotTrigger.present
          ? data.snapshotTrigger.value
          : this.snapshotTrigger,
      timestampUs:
          data.timestampUs.present ? data.timestampUs.value : this.timestampUs,
      date: data.date.present ? data.date.value : this.date,
    );
  }

  @override
  String toString() {
    return (StringBuffer('AccountSnapshotsTableData(')
          ..write('id: $id, ')
          ..write('accountId: $accountId, ')
          ..write('balance: $balance, ')
          ..write('equity: $equity, ')
          ..write('marginUsed: $marginUsed, ')
          ..write('marginAvailable: $marginAvailable, ')
          ..write('marginLevel: $marginLevel, ')
          ..write('nav: $nav, ')
          ..write('openPositionCount: $openPositionCount, ')
          ..write('unrealizedPnl: $unrealizedPnl, ')
          ..write('dailyRealizedPnl: $dailyRealizedPnl, ')
          ..write('snapshotTrigger: $snapshotTrigger, ')
          ..write('timestampUs: $timestampUs, ')
          ..write('date: $date')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      id,
      accountId,
      balance,
      equity,
      marginUsed,
      marginAvailable,
      marginLevel,
      nav,
      openPositionCount,
      unrealizedPnl,
      dailyRealizedPnl,
      snapshotTrigger,
      timestampUs,
      date);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is AccountSnapshotsTableData &&
          other.id == this.id &&
          other.accountId == this.accountId &&
          other.balance == this.balance &&
          other.equity == this.equity &&
          other.marginUsed == this.marginUsed &&
          other.marginAvailable == this.marginAvailable &&
          other.marginLevel == this.marginLevel &&
          other.nav == this.nav &&
          other.openPositionCount == this.openPositionCount &&
          other.unrealizedPnl == this.unrealizedPnl &&
          other.dailyRealizedPnl == this.dailyRealizedPnl &&
          other.snapshotTrigger == this.snapshotTrigger &&
          other.timestampUs == this.timestampUs &&
          other.date == this.date);
}

class AccountSnapshotsTableCompanion
    extends UpdateCompanion<AccountSnapshotsTableData> {
  final Value<int> id;
  final Value<String> accountId;
  final Value<double> balance;
  final Value<double> equity;
  final Value<double> marginUsed;
  final Value<double> marginAvailable;
  final Value<double> marginLevel;
  final Value<double> nav;
  final Value<int> openPositionCount;
  final Value<double> unrealizedPnl;
  final Value<double> dailyRealizedPnl;
  final Value<String> snapshotTrigger;
  final Value<int> timestampUs;
  final Value<String> date;
  const AccountSnapshotsTableCompanion({
    this.id = const Value.absent(),
    this.accountId = const Value.absent(),
    this.balance = const Value.absent(),
    this.equity = const Value.absent(),
    this.marginUsed = const Value.absent(),
    this.marginAvailable = const Value.absent(),
    this.marginLevel = const Value.absent(),
    this.nav = const Value.absent(),
    this.openPositionCount = const Value.absent(),
    this.unrealizedPnl = const Value.absent(),
    this.dailyRealizedPnl = const Value.absent(),
    this.snapshotTrigger = const Value.absent(),
    this.timestampUs = const Value.absent(),
    this.date = const Value.absent(),
  });
  AccountSnapshotsTableCompanion.insert({
    this.id = const Value.absent(),
    required String accountId,
    required double balance,
    required double equity,
    required double marginUsed,
    required double marginAvailable,
    required double marginLevel,
    required double nav,
    required int openPositionCount,
    required double unrealizedPnl,
    required double dailyRealizedPnl,
    required String snapshotTrigger,
    required int timestampUs,
    required String date,
  })  : accountId = Value(accountId),
        balance = Value(balance),
        equity = Value(equity),
        marginUsed = Value(marginUsed),
        marginAvailable = Value(marginAvailable),
        marginLevel = Value(marginLevel),
        nav = Value(nav),
        openPositionCount = Value(openPositionCount),
        unrealizedPnl = Value(unrealizedPnl),
        dailyRealizedPnl = Value(dailyRealizedPnl),
        snapshotTrigger = Value(snapshotTrigger),
        timestampUs = Value(timestampUs),
        date = Value(date);
  static Insertable<AccountSnapshotsTableData> custom({
    Expression<int>? id,
    Expression<String>? accountId,
    Expression<double>? balance,
    Expression<double>? equity,
    Expression<double>? marginUsed,
    Expression<double>? marginAvailable,
    Expression<double>? marginLevel,
    Expression<double>? nav,
    Expression<int>? openPositionCount,
    Expression<double>? unrealizedPnl,
    Expression<double>? dailyRealizedPnl,
    Expression<String>? snapshotTrigger,
    Expression<int>? timestampUs,
    Expression<String>? date,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (accountId != null) 'account_id': accountId,
      if (balance != null) 'balance': balance,
      if (equity != null) 'equity': equity,
      if (marginUsed != null) 'margin_used': marginUsed,
      if (marginAvailable != null) 'margin_available': marginAvailable,
      if (marginLevel != null) 'margin_level': marginLevel,
      if (nav != null) 'nav': nav,
      if (openPositionCount != null) 'open_position_count': openPositionCount,
      if (unrealizedPnl != null) 'unrealized_pnl': unrealizedPnl,
      if (dailyRealizedPnl != null) 'daily_realized_pnl': dailyRealizedPnl,
      if (snapshotTrigger != null) 'snapshot_trigger': snapshotTrigger,
      if (timestampUs != null) 'timestamp_us': timestampUs,
      if (date != null) 'date': date,
    });
  }

  AccountSnapshotsTableCompanion copyWith(
      {Value<int>? id,
      Value<String>? accountId,
      Value<double>? balance,
      Value<double>? equity,
      Value<double>? marginUsed,
      Value<double>? marginAvailable,
      Value<double>? marginLevel,
      Value<double>? nav,
      Value<int>? openPositionCount,
      Value<double>? unrealizedPnl,
      Value<double>? dailyRealizedPnl,
      Value<String>? snapshotTrigger,
      Value<int>? timestampUs,
      Value<String>? date}) {
    return AccountSnapshotsTableCompanion(
      id: id ?? this.id,
      accountId: accountId ?? this.accountId,
      balance: balance ?? this.balance,
      equity: equity ?? this.equity,
      marginUsed: marginUsed ?? this.marginUsed,
      marginAvailable: marginAvailable ?? this.marginAvailable,
      marginLevel: marginLevel ?? this.marginLevel,
      nav: nav ?? this.nav,
      openPositionCount: openPositionCount ?? this.openPositionCount,
      unrealizedPnl: unrealizedPnl ?? this.unrealizedPnl,
      dailyRealizedPnl: dailyRealizedPnl ?? this.dailyRealizedPnl,
      snapshotTrigger: snapshotTrigger ?? this.snapshotTrigger,
      timestampUs: timestampUs ?? this.timestampUs,
      date: date ?? this.date,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (accountId.present) {
      map['account_id'] = Variable<String>(accountId.value);
    }
    if (balance.present) {
      map['balance'] = Variable<double>(balance.value);
    }
    if (equity.present) {
      map['equity'] = Variable<double>(equity.value);
    }
    if (marginUsed.present) {
      map['margin_used'] = Variable<double>(marginUsed.value);
    }
    if (marginAvailable.present) {
      map['margin_available'] = Variable<double>(marginAvailable.value);
    }
    if (marginLevel.present) {
      map['margin_level'] = Variable<double>(marginLevel.value);
    }
    if (nav.present) {
      map['nav'] = Variable<double>(nav.value);
    }
    if (openPositionCount.present) {
      map['open_position_count'] = Variable<int>(openPositionCount.value);
    }
    if (unrealizedPnl.present) {
      map['unrealized_pnl'] = Variable<double>(unrealizedPnl.value);
    }
    if (dailyRealizedPnl.present) {
      map['daily_realized_pnl'] = Variable<double>(dailyRealizedPnl.value);
    }
    if (snapshotTrigger.present) {
      map['snapshot_trigger'] = Variable<String>(snapshotTrigger.value);
    }
    if (timestampUs.present) {
      map['timestamp_us'] = Variable<int>(timestampUs.value);
    }
    if (date.present) {
      map['date'] = Variable<String>(date.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('AccountSnapshotsTableCompanion(')
          ..write('id: $id, ')
          ..write('accountId: $accountId, ')
          ..write('balance: $balance, ')
          ..write('equity: $equity, ')
          ..write('marginUsed: $marginUsed, ')
          ..write('marginAvailable: $marginAvailable, ')
          ..write('marginLevel: $marginLevel, ')
          ..write('nav: $nav, ')
          ..write('openPositionCount: $openPositionCount, ')
          ..write('unrealizedPnl: $unrealizedPnl, ')
          ..write('dailyRealizedPnl: $dailyRealizedPnl, ')
          ..write('snapshotTrigger: $snapshotTrigger, ')
          ..write('timestampUs: $timestampUs, ')
          ..write('date: $date')
          ..write(')'))
        .toString();
  }
}

class $EaInstancesTableTable extends EaInstancesTable
    with TableInfo<$EaInstancesTableTable, EaInstancesTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $EaInstancesTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _scriptPathMeta =
      const VerificationMeta('scriptPath');
  @override
  late final GeneratedColumn<String> scriptPath = GeneratedColumn<String>(
      'script_path', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _scriptFilenameMeta =
      const VerificationMeta('scriptFilename');
  @override
  late final GeneratedColumn<String> scriptFilename = GeneratedColumn<String>(
      'script_filename', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _scriptHashMeta =
      const VerificationMeta('scriptHash');
  @override
  late final GeneratedColumn<String> scriptHash = GeneratedColumn<String>(
      'script_hash', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _scriptSizeBytesMeta =
      const VerificationMeta('scriptSizeBytes');
  @override
  late final GeneratedColumn<int> scriptSizeBytes = GeneratedColumn<int>(
      'script_size_bytes', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _symbolMeta = const VerificationMeta('symbol');
  @override
  late final GeneratedColumn<String> symbol = GeneratedColumn<String>(
      'symbol', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _magicNumberMeta =
      const VerificationMeta('magicNumber');
  @override
  late final GeneratedColumn<int> magicNumber = GeneratedColumn<int>(
      'magic_number', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _fixedLotSizeMeta =
      const VerificationMeta('fixedLotSize');
  @override
  late final GeneratedColumn<double> fixedLotSize = GeneratedColumn<double>(
      'fixed_lot_size', aliasedName, false,
      type: DriftSqlType.double, requiredDuringInsert: true);
  static const VerificationMeta _maxPositionsMeta =
      const VerificationMeta('maxPositions');
  @override
  late final GeneratedColumn<int> maxPositions = GeneratedColumn<int>(
      'max_positions', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _customParametersMeta =
      const VerificationMeta('customParameters');
  @override
  late final GeneratedColumn<String> customParameters = GeneratedColumn<String>(
      'custom_parameters', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _statusMeta = const VerificationMeta('status');
  @override
  late final GeneratedColumn<String> status = GeneratedColumn<String>(
      'status', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _autoStartMeta =
      const VerificationMeta('autoStart');
  @override
  late final GeneratedColumn<bool> autoStart = GeneratedColumn<bool>(
      'auto_start', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('CHECK ("auto_start" IN (0, 1))'),
      defaultValue: const Constant(false));
  static const VerificationMeta _killOnDisconnectSecondsMeta =
      const VerificationMeta('killOnDisconnectSeconds');
  @override
  late final GeneratedColumn<int> killOnDisconnectSeconds =
      GeneratedColumn<int>('kill_on_disconnect_seconds', aliasedName, false,
          type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _maxDailyLossLimitMeta =
      const VerificationMeta('maxDailyLossLimit');
  @override
  late final GeneratedColumn<double> maxDailyLossLimit =
      GeneratedColumn<double>('max_daily_loss_limit', aliasedName, false,
          type: DriftSqlType.double, requiredDuringInsert: true);
  static const VerificationMeta _totalTradesMeta =
      const VerificationMeta('totalTrades');
  @override
  late final GeneratedColumn<int> totalTrades = GeneratedColumn<int>(
      'total_trades', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultValue: const Constant(0));
  static const VerificationMeta _totalNetProfitMeta =
      const VerificationMeta('totalNetProfit');
  @override
  late final GeneratedColumn<double> totalNetProfit = GeneratedColumn<double>(
      'total_net_profit', aliasedName, false,
      type: DriftSqlType.double,
      requiredDuringInsert: false,
      defaultValue: const Constant(0.0));
  static const VerificationMeta _winRateMeta =
      const VerificationMeta('winRate');
  @override
  late final GeneratedColumn<double> winRate = GeneratedColumn<double>(
      'win_rate', aliasedName, false,
      type: DriftSqlType.double,
      requiredDuringInsert: false,
      defaultValue: const Constant(0.0));
  static const VerificationMeta _createdAtUsMeta =
      const VerificationMeta('createdAtUs');
  @override
  late final GeneratedColumn<int> createdAtUs = GeneratedColumn<int>(
      'created_at_us', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _lastStartedAtUsMeta =
      const VerificationMeta('lastStartedAtUs');
  @override
  late final GeneratedColumn<int> lastStartedAtUs = GeneratedColumn<int>(
      'last_started_at_us', aliasedName, true,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _lastStoppedAtUsMeta =
      const VerificationMeta('lastStoppedAtUs');
  @override
  late final GeneratedColumn<int> lastStoppedAtUs = GeneratedColumn<int>(
      'last_stopped_at_us', aliasedName, true,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _lastTickReceivedAtUsMeta =
      const VerificationMeta('lastTickReceivedAtUs');
  @override
  late final GeneratedColumn<int> lastTickReceivedAtUs = GeneratedColumn<int>(
      'last_tick_received_at_us', aliasedName, true,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _lastErrorMeta =
      const VerificationMeta('lastError');
  @override
  late final GeneratedColumn<String> lastError = GeneratedColumn<String>(
      'last_error', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns => [
        id,
        name,
        scriptPath,
        scriptFilename,
        scriptHash,
        scriptSizeBytes,
        symbol,
        magicNumber,
        fixedLotSize,
        maxPositions,
        customParameters,
        status,
        autoStart,
        killOnDisconnectSeconds,
        maxDailyLossLimit,
        totalTrades,
        totalNetProfit,
        winRate,
        createdAtUs,
        lastStartedAtUs,
        lastStoppedAtUs,
        lastTickReceivedAtUs,
        lastError
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'ea_instances_table';
  @override
  VerificationContext validateIntegrity(
      Insertable<EaInstancesTableData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('script_path')) {
      context.handle(
          _scriptPathMeta,
          scriptPath.isAcceptableOrUnknown(
              data['script_path']!, _scriptPathMeta));
    } else if (isInserting) {
      context.missing(_scriptPathMeta);
    }
    if (data.containsKey('script_filename')) {
      context.handle(
          _scriptFilenameMeta,
          scriptFilename.isAcceptableOrUnknown(
              data['script_filename']!, _scriptFilenameMeta));
    } else if (isInserting) {
      context.missing(_scriptFilenameMeta);
    }
    if (data.containsKey('script_hash')) {
      context.handle(
          _scriptHashMeta,
          scriptHash.isAcceptableOrUnknown(
              data['script_hash']!, _scriptHashMeta));
    } else if (isInserting) {
      context.missing(_scriptHashMeta);
    }
    if (data.containsKey('script_size_bytes')) {
      context.handle(
          _scriptSizeBytesMeta,
          scriptSizeBytes.isAcceptableOrUnknown(
              data['script_size_bytes']!, _scriptSizeBytesMeta));
    } else if (isInserting) {
      context.missing(_scriptSizeBytesMeta);
    }
    if (data.containsKey('symbol')) {
      context.handle(_symbolMeta,
          symbol.isAcceptableOrUnknown(data['symbol']!, _symbolMeta));
    } else if (isInserting) {
      context.missing(_symbolMeta);
    }
    if (data.containsKey('magic_number')) {
      context.handle(
          _magicNumberMeta,
          magicNumber.isAcceptableOrUnknown(
              data['magic_number']!, _magicNumberMeta));
    } else if (isInserting) {
      context.missing(_magicNumberMeta);
    }
    if (data.containsKey('fixed_lot_size')) {
      context.handle(
          _fixedLotSizeMeta,
          fixedLotSize.isAcceptableOrUnknown(
              data['fixed_lot_size']!, _fixedLotSizeMeta));
    } else if (isInserting) {
      context.missing(_fixedLotSizeMeta);
    }
    if (data.containsKey('max_positions')) {
      context.handle(
          _maxPositionsMeta,
          maxPositions.isAcceptableOrUnknown(
              data['max_positions']!, _maxPositionsMeta));
    } else if (isInserting) {
      context.missing(_maxPositionsMeta);
    }
    if (data.containsKey('custom_parameters')) {
      context.handle(
          _customParametersMeta,
          customParameters.isAcceptableOrUnknown(
              data['custom_parameters']!, _customParametersMeta));
    } else if (isInserting) {
      context.missing(_customParametersMeta);
    }
    if (data.containsKey('status')) {
      context.handle(_statusMeta,
          status.isAcceptableOrUnknown(data['status']!, _statusMeta));
    } else if (isInserting) {
      context.missing(_statusMeta);
    }
    if (data.containsKey('auto_start')) {
      context.handle(_autoStartMeta,
          autoStart.isAcceptableOrUnknown(data['auto_start']!, _autoStartMeta));
    }
    if (data.containsKey('kill_on_disconnect_seconds')) {
      context.handle(
          _killOnDisconnectSecondsMeta,
          killOnDisconnectSeconds.isAcceptableOrUnknown(
              data['kill_on_disconnect_seconds']!,
              _killOnDisconnectSecondsMeta));
    } else if (isInserting) {
      context.missing(_killOnDisconnectSecondsMeta);
    }
    if (data.containsKey('max_daily_loss_limit')) {
      context.handle(
          _maxDailyLossLimitMeta,
          maxDailyLossLimit.isAcceptableOrUnknown(
              data['max_daily_loss_limit']!, _maxDailyLossLimitMeta));
    } else if (isInserting) {
      context.missing(_maxDailyLossLimitMeta);
    }
    if (data.containsKey('total_trades')) {
      context.handle(
          _totalTradesMeta,
          totalTrades.isAcceptableOrUnknown(
              data['total_trades']!, _totalTradesMeta));
    }
    if (data.containsKey('total_net_profit')) {
      context.handle(
          _totalNetProfitMeta,
          totalNetProfit.isAcceptableOrUnknown(
              data['total_net_profit']!, _totalNetProfitMeta));
    }
    if (data.containsKey('win_rate')) {
      context.handle(_winRateMeta,
          winRate.isAcceptableOrUnknown(data['win_rate']!, _winRateMeta));
    }
    if (data.containsKey('created_at_us')) {
      context.handle(
          _createdAtUsMeta,
          createdAtUs.isAcceptableOrUnknown(
              data['created_at_us']!, _createdAtUsMeta));
    } else if (isInserting) {
      context.missing(_createdAtUsMeta);
    }
    if (data.containsKey('last_started_at_us')) {
      context.handle(
          _lastStartedAtUsMeta,
          lastStartedAtUs.isAcceptableOrUnknown(
              data['last_started_at_us']!, _lastStartedAtUsMeta));
    }
    if (data.containsKey('last_stopped_at_us')) {
      context.handle(
          _lastStoppedAtUsMeta,
          lastStoppedAtUs.isAcceptableOrUnknown(
              data['last_stopped_at_us']!, _lastStoppedAtUsMeta));
    }
    if (data.containsKey('last_tick_received_at_us')) {
      context.handle(
          _lastTickReceivedAtUsMeta,
          lastTickReceivedAtUs.isAcceptableOrUnknown(
              data['last_tick_received_at_us']!, _lastTickReceivedAtUsMeta));
    }
    if (data.containsKey('last_error')) {
      context.handle(_lastErrorMeta,
          lastError.isAcceptableOrUnknown(data['last_error']!, _lastErrorMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  EaInstancesTableData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return EaInstancesTableData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
      scriptPath: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}script_path'])!,
      scriptFilename: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}script_filename'])!,
      scriptHash: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}script_hash'])!,
      scriptSizeBytes: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}script_size_bytes'])!,
      symbol: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}symbol'])!,
      magicNumber: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}magic_number'])!,
      fixedLotSize: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}fixed_lot_size'])!,
      maxPositions: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}max_positions'])!,
      customParameters: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}custom_parameters'])!,
      status: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}status'])!,
      autoStart: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}auto_start'])!,
      killOnDisconnectSeconds: attachedDatabase.typeMapping.read(
          DriftSqlType.int,
          data['${effectivePrefix}kill_on_disconnect_seconds'])!,
      maxDailyLossLimit: attachedDatabase.typeMapping.read(
          DriftSqlType.double, data['${effectivePrefix}max_daily_loss_limit'])!,
      totalTrades: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}total_trades'])!,
      totalNetProfit: attachedDatabase.typeMapping.read(
          DriftSqlType.double, data['${effectivePrefix}total_net_profit'])!,
      winRate: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}win_rate'])!,
      createdAtUs: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}created_at_us'])!,
      lastStartedAtUs: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}last_started_at_us']),
      lastStoppedAtUs: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}last_stopped_at_us']),
      lastTickReceivedAtUs: attachedDatabase.typeMapping.read(
          DriftSqlType.int, data['${effectivePrefix}last_tick_received_at_us']),
      lastError: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}last_error']),
    );
  }

  @override
  $EaInstancesTableTable createAlias(String alias) {
    return $EaInstancesTableTable(attachedDatabase, alias);
  }
}

class EaInstancesTableData extends DataClass
    implements Insertable<EaInstancesTableData> {
  final int id;
  final String name;
  final String scriptPath;
  final String scriptFilename;
  final String scriptHash;
  final int scriptSizeBytes;
  final String symbol;
  final int magicNumber;
  final double fixedLotSize;
  final int maxPositions;
  final String customParameters;
  final String status;
  final bool autoStart;
  final int killOnDisconnectSeconds;
  final double maxDailyLossLimit;
  final int totalTrades;
  final double totalNetProfit;
  final double winRate;
  final int createdAtUs;
  final int? lastStartedAtUs;
  final int? lastStoppedAtUs;
  final int? lastTickReceivedAtUs;
  final String? lastError;
  const EaInstancesTableData(
      {required this.id,
      required this.name,
      required this.scriptPath,
      required this.scriptFilename,
      required this.scriptHash,
      required this.scriptSizeBytes,
      required this.symbol,
      required this.magicNumber,
      required this.fixedLotSize,
      required this.maxPositions,
      required this.customParameters,
      required this.status,
      required this.autoStart,
      required this.killOnDisconnectSeconds,
      required this.maxDailyLossLimit,
      required this.totalTrades,
      required this.totalNetProfit,
      required this.winRate,
      required this.createdAtUs,
      this.lastStartedAtUs,
      this.lastStoppedAtUs,
      this.lastTickReceivedAtUs,
      this.lastError});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['name'] = Variable<String>(name);
    map['script_path'] = Variable<String>(scriptPath);
    map['script_filename'] = Variable<String>(scriptFilename);
    map['script_hash'] = Variable<String>(scriptHash);
    map['script_size_bytes'] = Variable<int>(scriptSizeBytes);
    map['symbol'] = Variable<String>(symbol);
    map['magic_number'] = Variable<int>(magicNumber);
    map['fixed_lot_size'] = Variable<double>(fixedLotSize);
    map['max_positions'] = Variable<int>(maxPositions);
    map['custom_parameters'] = Variable<String>(customParameters);
    map['status'] = Variable<String>(status);
    map['auto_start'] = Variable<bool>(autoStart);
    map['kill_on_disconnect_seconds'] = Variable<int>(killOnDisconnectSeconds);
    map['max_daily_loss_limit'] = Variable<double>(maxDailyLossLimit);
    map['total_trades'] = Variable<int>(totalTrades);
    map['total_net_profit'] = Variable<double>(totalNetProfit);
    map['win_rate'] = Variable<double>(winRate);
    map['created_at_us'] = Variable<int>(createdAtUs);
    if (!nullToAbsent || lastStartedAtUs != null) {
      map['last_started_at_us'] = Variable<int>(lastStartedAtUs);
    }
    if (!nullToAbsent || lastStoppedAtUs != null) {
      map['last_stopped_at_us'] = Variable<int>(lastStoppedAtUs);
    }
    if (!nullToAbsent || lastTickReceivedAtUs != null) {
      map['last_tick_received_at_us'] = Variable<int>(lastTickReceivedAtUs);
    }
    if (!nullToAbsent || lastError != null) {
      map['last_error'] = Variable<String>(lastError);
    }
    return map;
  }

  EaInstancesTableCompanion toCompanion(bool nullToAbsent) {
    return EaInstancesTableCompanion(
      id: Value(id),
      name: Value(name),
      scriptPath: Value(scriptPath),
      scriptFilename: Value(scriptFilename),
      scriptHash: Value(scriptHash),
      scriptSizeBytes: Value(scriptSizeBytes),
      symbol: Value(symbol),
      magicNumber: Value(magicNumber),
      fixedLotSize: Value(fixedLotSize),
      maxPositions: Value(maxPositions),
      customParameters: Value(customParameters),
      status: Value(status),
      autoStart: Value(autoStart),
      killOnDisconnectSeconds: Value(killOnDisconnectSeconds),
      maxDailyLossLimit: Value(maxDailyLossLimit),
      totalTrades: Value(totalTrades),
      totalNetProfit: Value(totalNetProfit),
      winRate: Value(winRate),
      createdAtUs: Value(createdAtUs),
      lastStartedAtUs: lastStartedAtUs == null && nullToAbsent
          ? const Value.absent()
          : Value(lastStartedAtUs),
      lastStoppedAtUs: lastStoppedAtUs == null && nullToAbsent
          ? const Value.absent()
          : Value(lastStoppedAtUs),
      lastTickReceivedAtUs: lastTickReceivedAtUs == null && nullToAbsent
          ? const Value.absent()
          : Value(lastTickReceivedAtUs),
      lastError: lastError == null && nullToAbsent
          ? const Value.absent()
          : Value(lastError),
    );
  }

  factory EaInstancesTableData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return EaInstancesTableData(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      scriptPath: serializer.fromJson<String>(json['scriptPath']),
      scriptFilename: serializer.fromJson<String>(json['scriptFilename']),
      scriptHash: serializer.fromJson<String>(json['scriptHash']),
      scriptSizeBytes: serializer.fromJson<int>(json['scriptSizeBytes']),
      symbol: serializer.fromJson<String>(json['symbol']),
      magicNumber: serializer.fromJson<int>(json['magicNumber']),
      fixedLotSize: serializer.fromJson<double>(json['fixedLotSize']),
      maxPositions: serializer.fromJson<int>(json['maxPositions']),
      customParameters: serializer.fromJson<String>(json['customParameters']),
      status: serializer.fromJson<String>(json['status']),
      autoStart: serializer.fromJson<bool>(json['autoStart']),
      killOnDisconnectSeconds:
          serializer.fromJson<int>(json['killOnDisconnectSeconds']),
      maxDailyLossLimit: serializer.fromJson<double>(json['maxDailyLossLimit']),
      totalTrades: serializer.fromJson<int>(json['totalTrades']),
      totalNetProfit: serializer.fromJson<double>(json['totalNetProfit']),
      winRate: serializer.fromJson<double>(json['winRate']),
      createdAtUs: serializer.fromJson<int>(json['createdAtUs']),
      lastStartedAtUs: serializer.fromJson<int?>(json['lastStartedAtUs']),
      lastStoppedAtUs: serializer.fromJson<int?>(json['lastStoppedAtUs']),
      lastTickReceivedAtUs:
          serializer.fromJson<int?>(json['lastTickReceivedAtUs']),
      lastError: serializer.fromJson<String?>(json['lastError']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
      'scriptPath': serializer.toJson<String>(scriptPath),
      'scriptFilename': serializer.toJson<String>(scriptFilename),
      'scriptHash': serializer.toJson<String>(scriptHash),
      'scriptSizeBytes': serializer.toJson<int>(scriptSizeBytes),
      'symbol': serializer.toJson<String>(symbol),
      'magicNumber': serializer.toJson<int>(magicNumber),
      'fixedLotSize': serializer.toJson<double>(fixedLotSize),
      'maxPositions': serializer.toJson<int>(maxPositions),
      'customParameters': serializer.toJson<String>(customParameters),
      'status': serializer.toJson<String>(status),
      'autoStart': serializer.toJson<bool>(autoStart),
      'killOnDisconnectSeconds':
          serializer.toJson<int>(killOnDisconnectSeconds),
      'maxDailyLossLimit': serializer.toJson<double>(maxDailyLossLimit),
      'totalTrades': serializer.toJson<int>(totalTrades),
      'totalNetProfit': serializer.toJson<double>(totalNetProfit),
      'winRate': serializer.toJson<double>(winRate),
      'createdAtUs': serializer.toJson<int>(createdAtUs),
      'lastStartedAtUs': serializer.toJson<int?>(lastStartedAtUs),
      'lastStoppedAtUs': serializer.toJson<int?>(lastStoppedAtUs),
      'lastTickReceivedAtUs': serializer.toJson<int?>(lastTickReceivedAtUs),
      'lastError': serializer.toJson<String?>(lastError),
    };
  }

  EaInstancesTableData copyWith(
          {int? id,
          String? name,
          String? scriptPath,
          String? scriptFilename,
          String? scriptHash,
          int? scriptSizeBytes,
          String? symbol,
          int? magicNumber,
          double? fixedLotSize,
          int? maxPositions,
          String? customParameters,
          String? status,
          bool? autoStart,
          int? killOnDisconnectSeconds,
          double? maxDailyLossLimit,
          int? totalTrades,
          double? totalNetProfit,
          double? winRate,
          int? createdAtUs,
          Value<int?> lastStartedAtUs = const Value.absent(),
          Value<int?> lastStoppedAtUs = const Value.absent(),
          Value<int?> lastTickReceivedAtUs = const Value.absent(),
          Value<String?> lastError = const Value.absent()}) =>
      EaInstancesTableData(
        id: id ?? this.id,
        name: name ?? this.name,
        scriptPath: scriptPath ?? this.scriptPath,
        scriptFilename: scriptFilename ?? this.scriptFilename,
        scriptHash: scriptHash ?? this.scriptHash,
        scriptSizeBytes: scriptSizeBytes ?? this.scriptSizeBytes,
        symbol: symbol ?? this.symbol,
        magicNumber: magicNumber ?? this.magicNumber,
        fixedLotSize: fixedLotSize ?? this.fixedLotSize,
        maxPositions: maxPositions ?? this.maxPositions,
        customParameters: customParameters ?? this.customParameters,
        status: status ?? this.status,
        autoStart: autoStart ?? this.autoStart,
        killOnDisconnectSeconds:
            killOnDisconnectSeconds ?? this.killOnDisconnectSeconds,
        maxDailyLossLimit: maxDailyLossLimit ?? this.maxDailyLossLimit,
        totalTrades: totalTrades ?? this.totalTrades,
        totalNetProfit: totalNetProfit ?? this.totalNetProfit,
        winRate: winRate ?? this.winRate,
        createdAtUs: createdAtUs ?? this.createdAtUs,
        lastStartedAtUs: lastStartedAtUs.present
            ? lastStartedAtUs.value
            : this.lastStartedAtUs,
        lastStoppedAtUs: lastStoppedAtUs.present
            ? lastStoppedAtUs.value
            : this.lastStoppedAtUs,
        lastTickReceivedAtUs: lastTickReceivedAtUs.present
            ? lastTickReceivedAtUs.value
            : this.lastTickReceivedAtUs,
        lastError: lastError.present ? lastError.value : this.lastError,
      );
  EaInstancesTableData copyWithCompanion(EaInstancesTableCompanion data) {
    return EaInstancesTableData(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
      scriptPath:
          data.scriptPath.present ? data.scriptPath.value : this.scriptPath,
      scriptFilename: data.scriptFilename.present
          ? data.scriptFilename.value
          : this.scriptFilename,
      scriptHash:
          data.scriptHash.present ? data.scriptHash.value : this.scriptHash,
      scriptSizeBytes: data.scriptSizeBytes.present
          ? data.scriptSizeBytes.value
          : this.scriptSizeBytes,
      symbol: data.symbol.present ? data.symbol.value : this.symbol,
      magicNumber:
          data.magicNumber.present ? data.magicNumber.value : this.magicNumber,
      fixedLotSize: data.fixedLotSize.present
          ? data.fixedLotSize.value
          : this.fixedLotSize,
      maxPositions: data.maxPositions.present
          ? data.maxPositions.value
          : this.maxPositions,
      customParameters: data.customParameters.present
          ? data.customParameters.value
          : this.customParameters,
      status: data.status.present ? data.status.value : this.status,
      autoStart: data.autoStart.present ? data.autoStart.value : this.autoStart,
      killOnDisconnectSeconds: data.killOnDisconnectSeconds.present
          ? data.killOnDisconnectSeconds.value
          : this.killOnDisconnectSeconds,
      maxDailyLossLimit: data.maxDailyLossLimit.present
          ? data.maxDailyLossLimit.value
          : this.maxDailyLossLimit,
      totalTrades:
          data.totalTrades.present ? data.totalTrades.value : this.totalTrades,
      totalNetProfit: data.totalNetProfit.present
          ? data.totalNetProfit.value
          : this.totalNetProfit,
      winRate: data.winRate.present ? data.winRate.value : this.winRate,
      createdAtUs:
          data.createdAtUs.present ? data.createdAtUs.value : this.createdAtUs,
      lastStartedAtUs: data.lastStartedAtUs.present
          ? data.lastStartedAtUs.value
          : this.lastStartedAtUs,
      lastStoppedAtUs: data.lastStoppedAtUs.present
          ? data.lastStoppedAtUs.value
          : this.lastStoppedAtUs,
      lastTickReceivedAtUs: data.lastTickReceivedAtUs.present
          ? data.lastTickReceivedAtUs.value
          : this.lastTickReceivedAtUs,
      lastError: data.lastError.present ? data.lastError.value : this.lastError,
    );
  }

  @override
  String toString() {
    return (StringBuffer('EaInstancesTableData(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('scriptPath: $scriptPath, ')
          ..write('scriptFilename: $scriptFilename, ')
          ..write('scriptHash: $scriptHash, ')
          ..write('scriptSizeBytes: $scriptSizeBytes, ')
          ..write('symbol: $symbol, ')
          ..write('magicNumber: $magicNumber, ')
          ..write('fixedLotSize: $fixedLotSize, ')
          ..write('maxPositions: $maxPositions, ')
          ..write('customParameters: $customParameters, ')
          ..write('status: $status, ')
          ..write('autoStart: $autoStart, ')
          ..write('killOnDisconnectSeconds: $killOnDisconnectSeconds, ')
          ..write('maxDailyLossLimit: $maxDailyLossLimit, ')
          ..write('totalTrades: $totalTrades, ')
          ..write('totalNetProfit: $totalNetProfit, ')
          ..write('winRate: $winRate, ')
          ..write('createdAtUs: $createdAtUs, ')
          ..write('lastStartedAtUs: $lastStartedAtUs, ')
          ..write('lastStoppedAtUs: $lastStoppedAtUs, ')
          ..write('lastTickReceivedAtUs: $lastTickReceivedAtUs, ')
          ..write('lastError: $lastError')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hashAll([
        id,
        name,
        scriptPath,
        scriptFilename,
        scriptHash,
        scriptSizeBytes,
        symbol,
        magicNumber,
        fixedLotSize,
        maxPositions,
        customParameters,
        status,
        autoStart,
        killOnDisconnectSeconds,
        maxDailyLossLimit,
        totalTrades,
        totalNetProfit,
        winRate,
        createdAtUs,
        lastStartedAtUs,
        lastStoppedAtUs,
        lastTickReceivedAtUs,
        lastError
      ]);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is EaInstancesTableData &&
          other.id == this.id &&
          other.name == this.name &&
          other.scriptPath == this.scriptPath &&
          other.scriptFilename == this.scriptFilename &&
          other.scriptHash == this.scriptHash &&
          other.scriptSizeBytes == this.scriptSizeBytes &&
          other.symbol == this.symbol &&
          other.magicNumber == this.magicNumber &&
          other.fixedLotSize == this.fixedLotSize &&
          other.maxPositions == this.maxPositions &&
          other.customParameters == this.customParameters &&
          other.status == this.status &&
          other.autoStart == this.autoStart &&
          other.killOnDisconnectSeconds == this.killOnDisconnectSeconds &&
          other.maxDailyLossLimit == this.maxDailyLossLimit &&
          other.totalTrades == this.totalTrades &&
          other.totalNetProfit == this.totalNetProfit &&
          other.winRate == this.winRate &&
          other.createdAtUs == this.createdAtUs &&
          other.lastStartedAtUs == this.lastStartedAtUs &&
          other.lastStoppedAtUs == this.lastStoppedAtUs &&
          other.lastTickReceivedAtUs == this.lastTickReceivedAtUs &&
          other.lastError == this.lastError);
}

class EaInstancesTableCompanion extends UpdateCompanion<EaInstancesTableData> {
  final Value<int> id;
  final Value<String> name;
  final Value<String> scriptPath;
  final Value<String> scriptFilename;
  final Value<String> scriptHash;
  final Value<int> scriptSizeBytes;
  final Value<String> symbol;
  final Value<int> magicNumber;
  final Value<double> fixedLotSize;
  final Value<int> maxPositions;
  final Value<String> customParameters;
  final Value<String> status;
  final Value<bool> autoStart;
  final Value<int> killOnDisconnectSeconds;
  final Value<double> maxDailyLossLimit;
  final Value<int> totalTrades;
  final Value<double> totalNetProfit;
  final Value<double> winRate;
  final Value<int> createdAtUs;
  final Value<int?> lastStartedAtUs;
  final Value<int?> lastStoppedAtUs;
  final Value<int?> lastTickReceivedAtUs;
  final Value<String?> lastError;
  const EaInstancesTableCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.scriptPath = const Value.absent(),
    this.scriptFilename = const Value.absent(),
    this.scriptHash = const Value.absent(),
    this.scriptSizeBytes = const Value.absent(),
    this.symbol = const Value.absent(),
    this.magicNumber = const Value.absent(),
    this.fixedLotSize = const Value.absent(),
    this.maxPositions = const Value.absent(),
    this.customParameters = const Value.absent(),
    this.status = const Value.absent(),
    this.autoStart = const Value.absent(),
    this.killOnDisconnectSeconds = const Value.absent(),
    this.maxDailyLossLimit = const Value.absent(),
    this.totalTrades = const Value.absent(),
    this.totalNetProfit = const Value.absent(),
    this.winRate = const Value.absent(),
    this.createdAtUs = const Value.absent(),
    this.lastStartedAtUs = const Value.absent(),
    this.lastStoppedAtUs = const Value.absent(),
    this.lastTickReceivedAtUs = const Value.absent(),
    this.lastError = const Value.absent(),
  });
  EaInstancesTableCompanion.insert({
    this.id = const Value.absent(),
    required String name,
    required String scriptPath,
    required String scriptFilename,
    required String scriptHash,
    required int scriptSizeBytes,
    required String symbol,
    required int magicNumber,
    required double fixedLotSize,
    required int maxPositions,
    required String customParameters,
    required String status,
    this.autoStart = const Value.absent(),
    required int killOnDisconnectSeconds,
    required double maxDailyLossLimit,
    this.totalTrades = const Value.absent(),
    this.totalNetProfit = const Value.absent(),
    this.winRate = const Value.absent(),
    required int createdAtUs,
    this.lastStartedAtUs = const Value.absent(),
    this.lastStoppedAtUs = const Value.absent(),
    this.lastTickReceivedAtUs = const Value.absent(),
    this.lastError = const Value.absent(),
  })  : name = Value(name),
        scriptPath = Value(scriptPath),
        scriptFilename = Value(scriptFilename),
        scriptHash = Value(scriptHash),
        scriptSizeBytes = Value(scriptSizeBytes),
        symbol = Value(symbol),
        magicNumber = Value(magicNumber),
        fixedLotSize = Value(fixedLotSize),
        maxPositions = Value(maxPositions),
        customParameters = Value(customParameters),
        status = Value(status),
        killOnDisconnectSeconds = Value(killOnDisconnectSeconds),
        maxDailyLossLimit = Value(maxDailyLossLimit),
        createdAtUs = Value(createdAtUs);
  static Insertable<EaInstancesTableData> custom({
    Expression<int>? id,
    Expression<String>? name,
    Expression<String>? scriptPath,
    Expression<String>? scriptFilename,
    Expression<String>? scriptHash,
    Expression<int>? scriptSizeBytes,
    Expression<String>? symbol,
    Expression<int>? magicNumber,
    Expression<double>? fixedLotSize,
    Expression<int>? maxPositions,
    Expression<String>? customParameters,
    Expression<String>? status,
    Expression<bool>? autoStart,
    Expression<int>? killOnDisconnectSeconds,
    Expression<double>? maxDailyLossLimit,
    Expression<int>? totalTrades,
    Expression<double>? totalNetProfit,
    Expression<double>? winRate,
    Expression<int>? createdAtUs,
    Expression<int>? lastStartedAtUs,
    Expression<int>? lastStoppedAtUs,
    Expression<int>? lastTickReceivedAtUs,
    Expression<String>? lastError,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (scriptPath != null) 'script_path': scriptPath,
      if (scriptFilename != null) 'script_filename': scriptFilename,
      if (scriptHash != null) 'script_hash': scriptHash,
      if (scriptSizeBytes != null) 'script_size_bytes': scriptSizeBytes,
      if (symbol != null) 'symbol': symbol,
      if (magicNumber != null) 'magic_number': magicNumber,
      if (fixedLotSize != null) 'fixed_lot_size': fixedLotSize,
      if (maxPositions != null) 'max_positions': maxPositions,
      if (customParameters != null) 'custom_parameters': customParameters,
      if (status != null) 'status': status,
      if (autoStart != null) 'auto_start': autoStart,
      if (killOnDisconnectSeconds != null)
        'kill_on_disconnect_seconds': killOnDisconnectSeconds,
      if (maxDailyLossLimit != null) 'max_daily_loss_limit': maxDailyLossLimit,
      if (totalTrades != null) 'total_trades': totalTrades,
      if (totalNetProfit != null) 'total_net_profit': totalNetProfit,
      if (winRate != null) 'win_rate': winRate,
      if (createdAtUs != null) 'created_at_us': createdAtUs,
      if (lastStartedAtUs != null) 'last_started_at_us': lastStartedAtUs,
      if (lastStoppedAtUs != null) 'last_stopped_at_us': lastStoppedAtUs,
      if (lastTickReceivedAtUs != null)
        'last_tick_received_at_us': lastTickReceivedAtUs,
      if (lastError != null) 'last_error': lastError,
    });
  }

  EaInstancesTableCompanion copyWith(
      {Value<int>? id,
      Value<String>? name,
      Value<String>? scriptPath,
      Value<String>? scriptFilename,
      Value<String>? scriptHash,
      Value<int>? scriptSizeBytes,
      Value<String>? symbol,
      Value<int>? magicNumber,
      Value<double>? fixedLotSize,
      Value<int>? maxPositions,
      Value<String>? customParameters,
      Value<String>? status,
      Value<bool>? autoStart,
      Value<int>? killOnDisconnectSeconds,
      Value<double>? maxDailyLossLimit,
      Value<int>? totalTrades,
      Value<double>? totalNetProfit,
      Value<double>? winRate,
      Value<int>? createdAtUs,
      Value<int?>? lastStartedAtUs,
      Value<int?>? lastStoppedAtUs,
      Value<int?>? lastTickReceivedAtUs,
      Value<String?>? lastError}) {
    return EaInstancesTableCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      scriptPath: scriptPath ?? this.scriptPath,
      scriptFilename: scriptFilename ?? this.scriptFilename,
      scriptHash: scriptHash ?? this.scriptHash,
      scriptSizeBytes: scriptSizeBytes ?? this.scriptSizeBytes,
      symbol: symbol ?? this.symbol,
      magicNumber: magicNumber ?? this.magicNumber,
      fixedLotSize: fixedLotSize ?? this.fixedLotSize,
      maxPositions: maxPositions ?? this.maxPositions,
      customParameters: customParameters ?? this.customParameters,
      status: status ?? this.status,
      autoStart: autoStart ?? this.autoStart,
      killOnDisconnectSeconds:
          killOnDisconnectSeconds ?? this.killOnDisconnectSeconds,
      maxDailyLossLimit: maxDailyLossLimit ?? this.maxDailyLossLimit,
      totalTrades: totalTrades ?? this.totalTrades,
      totalNetProfit: totalNetProfit ?? this.totalNetProfit,
      winRate: winRate ?? this.winRate,
      createdAtUs: createdAtUs ?? this.createdAtUs,
      lastStartedAtUs: lastStartedAtUs ?? this.lastStartedAtUs,
      lastStoppedAtUs: lastStoppedAtUs ?? this.lastStoppedAtUs,
      lastTickReceivedAtUs: lastTickReceivedAtUs ?? this.lastTickReceivedAtUs,
      lastError: lastError ?? this.lastError,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (scriptPath.present) {
      map['script_path'] = Variable<String>(scriptPath.value);
    }
    if (scriptFilename.present) {
      map['script_filename'] = Variable<String>(scriptFilename.value);
    }
    if (scriptHash.present) {
      map['script_hash'] = Variable<String>(scriptHash.value);
    }
    if (scriptSizeBytes.present) {
      map['script_size_bytes'] = Variable<int>(scriptSizeBytes.value);
    }
    if (symbol.present) {
      map['symbol'] = Variable<String>(symbol.value);
    }
    if (magicNumber.present) {
      map['magic_number'] = Variable<int>(magicNumber.value);
    }
    if (fixedLotSize.present) {
      map['fixed_lot_size'] = Variable<double>(fixedLotSize.value);
    }
    if (maxPositions.present) {
      map['max_positions'] = Variable<int>(maxPositions.value);
    }
    if (customParameters.present) {
      map['custom_parameters'] = Variable<String>(customParameters.value);
    }
    if (status.present) {
      map['status'] = Variable<String>(status.value);
    }
    if (autoStart.present) {
      map['auto_start'] = Variable<bool>(autoStart.value);
    }
    if (killOnDisconnectSeconds.present) {
      map['kill_on_disconnect_seconds'] =
          Variable<int>(killOnDisconnectSeconds.value);
    }
    if (maxDailyLossLimit.present) {
      map['max_daily_loss_limit'] = Variable<double>(maxDailyLossLimit.value);
    }
    if (totalTrades.present) {
      map['total_trades'] = Variable<int>(totalTrades.value);
    }
    if (totalNetProfit.present) {
      map['total_net_profit'] = Variable<double>(totalNetProfit.value);
    }
    if (winRate.present) {
      map['win_rate'] = Variable<double>(winRate.value);
    }
    if (createdAtUs.present) {
      map['created_at_us'] = Variable<int>(createdAtUs.value);
    }
    if (lastStartedAtUs.present) {
      map['last_started_at_us'] = Variable<int>(lastStartedAtUs.value);
    }
    if (lastStoppedAtUs.present) {
      map['last_stopped_at_us'] = Variable<int>(lastStoppedAtUs.value);
    }
    if (lastTickReceivedAtUs.present) {
      map['last_tick_received_at_us'] =
          Variable<int>(lastTickReceivedAtUs.value);
    }
    if (lastError.present) {
      map['last_error'] = Variable<String>(lastError.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('EaInstancesTableCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('scriptPath: $scriptPath, ')
          ..write('scriptFilename: $scriptFilename, ')
          ..write('scriptHash: $scriptHash, ')
          ..write('scriptSizeBytes: $scriptSizeBytes, ')
          ..write('symbol: $symbol, ')
          ..write('magicNumber: $magicNumber, ')
          ..write('fixedLotSize: $fixedLotSize, ')
          ..write('maxPositions: $maxPositions, ')
          ..write('customParameters: $customParameters, ')
          ..write('status: $status, ')
          ..write('autoStart: $autoStart, ')
          ..write('killOnDisconnectSeconds: $killOnDisconnectSeconds, ')
          ..write('maxDailyLossLimit: $maxDailyLossLimit, ')
          ..write('totalTrades: $totalTrades, ')
          ..write('totalNetProfit: $totalNetProfit, ')
          ..write('winRate: $winRate, ')
          ..write('createdAtUs: $createdAtUs, ')
          ..write('lastStartedAtUs: $lastStartedAtUs, ')
          ..write('lastStoppedAtUs: $lastStoppedAtUs, ')
          ..write('lastTickReceivedAtUs: $lastTickReceivedAtUs, ')
          ..write('lastError: $lastError')
          ..write(')'))
        .toString();
  }
}

class $EaLogsTableTable extends EaLogsTable
    with TableInfo<$EaLogsTableTable, EaLogsTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $EaLogsTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _eaInstanceIdMeta =
      const VerificationMeta('eaInstanceId');
  @override
  late final GeneratedColumn<int> eaInstanceId = GeneratedColumn<int>(
      'ea_instance_id', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _levelMeta = const VerificationMeta('level');
  @override
  late final GeneratedColumn<String> level = GeneratedColumn<String>(
      'level', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _messageMeta =
      const VerificationMeta('message');
  @override
  late final GeneratedColumn<String> message = GeneratedColumn<String>(
      'message', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _sourceMeta = const VerificationMeta('source');
  @override
  late final GeneratedColumn<String> source = GeneratedColumn<String>(
      'source', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _tradeTicketMeta =
      const VerificationMeta('tradeTicket');
  @override
  late final GeneratedColumn<int> tradeTicket = GeneratedColumn<int>(
      'trade_ticket', aliasedName, true,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _tradeActionMeta =
      const VerificationMeta('tradeAction');
  @override
  late final GeneratedColumn<String> tradeAction = GeneratedColumn<String>(
      'trade_action', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _timestampUsMeta =
      const VerificationMeta('timestampUs');
  @override
  late final GeneratedColumn<int> timestampUs = GeneratedColumn<int>(
      'timestamp_us', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _timeDisplayMeta =
      const VerificationMeta('timeDisplay');
  @override
  late final GeneratedColumn<String> timeDisplay = GeneratedColumn<String>(
      'time_display', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [
        id,
        eaInstanceId,
        level,
        message,
        source,
        tradeTicket,
        tradeAction,
        timestampUs,
        timeDisplay
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'ea_logs_table';
  @override
  VerificationContext validateIntegrity(Insertable<EaLogsTableData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('ea_instance_id')) {
      context.handle(
          _eaInstanceIdMeta,
          eaInstanceId.isAcceptableOrUnknown(
              data['ea_instance_id']!, _eaInstanceIdMeta));
    } else if (isInserting) {
      context.missing(_eaInstanceIdMeta);
    }
    if (data.containsKey('level')) {
      context.handle(
          _levelMeta, level.isAcceptableOrUnknown(data['level']!, _levelMeta));
    } else if (isInserting) {
      context.missing(_levelMeta);
    }
    if (data.containsKey('message')) {
      context.handle(_messageMeta,
          message.isAcceptableOrUnknown(data['message']!, _messageMeta));
    } else if (isInserting) {
      context.missing(_messageMeta);
    }
    if (data.containsKey('source')) {
      context.handle(_sourceMeta,
          source.isAcceptableOrUnknown(data['source']!, _sourceMeta));
    } else if (isInserting) {
      context.missing(_sourceMeta);
    }
    if (data.containsKey('trade_ticket')) {
      context.handle(
          _tradeTicketMeta,
          tradeTicket.isAcceptableOrUnknown(
              data['trade_ticket']!, _tradeTicketMeta));
    }
    if (data.containsKey('trade_action')) {
      context.handle(
          _tradeActionMeta,
          tradeAction.isAcceptableOrUnknown(
              data['trade_action']!, _tradeActionMeta));
    }
    if (data.containsKey('timestamp_us')) {
      context.handle(
          _timestampUsMeta,
          timestampUs.isAcceptableOrUnknown(
              data['timestamp_us']!, _timestampUsMeta));
    } else if (isInserting) {
      context.missing(_timestampUsMeta);
    }
    if (data.containsKey('time_display')) {
      context.handle(
          _timeDisplayMeta,
          timeDisplay.isAcceptableOrUnknown(
              data['time_display']!, _timeDisplayMeta));
    } else if (isInserting) {
      context.missing(_timeDisplayMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  EaLogsTableData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return EaLogsTableData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      eaInstanceId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}ea_instance_id'])!,
      level: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}level'])!,
      message: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}message'])!,
      source: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}source'])!,
      tradeTicket: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}trade_ticket']),
      tradeAction: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}trade_action']),
      timestampUs: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}timestamp_us'])!,
      timeDisplay: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}time_display'])!,
    );
  }

  @override
  $EaLogsTableTable createAlias(String alias) {
    return $EaLogsTableTable(attachedDatabase, alias);
  }
}

class EaLogsTableData extends DataClass implements Insertable<EaLogsTableData> {
  final int id;
  final int eaInstanceId;
  final String level;
  final String message;
  final String source;
  final int? tradeTicket;
  final String? tradeAction;
  final int timestampUs;
  final String timeDisplay;
  const EaLogsTableData(
      {required this.id,
      required this.eaInstanceId,
      required this.level,
      required this.message,
      required this.source,
      this.tradeTicket,
      this.tradeAction,
      required this.timestampUs,
      required this.timeDisplay});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['ea_instance_id'] = Variable<int>(eaInstanceId);
    map['level'] = Variable<String>(level);
    map['message'] = Variable<String>(message);
    map['source'] = Variable<String>(source);
    if (!nullToAbsent || tradeTicket != null) {
      map['trade_ticket'] = Variable<int>(tradeTicket);
    }
    if (!nullToAbsent || tradeAction != null) {
      map['trade_action'] = Variable<String>(tradeAction);
    }
    map['timestamp_us'] = Variable<int>(timestampUs);
    map['time_display'] = Variable<String>(timeDisplay);
    return map;
  }

  EaLogsTableCompanion toCompanion(bool nullToAbsent) {
    return EaLogsTableCompanion(
      id: Value(id),
      eaInstanceId: Value(eaInstanceId),
      level: Value(level),
      message: Value(message),
      source: Value(source),
      tradeTicket: tradeTicket == null && nullToAbsent
          ? const Value.absent()
          : Value(tradeTicket),
      tradeAction: tradeAction == null && nullToAbsent
          ? const Value.absent()
          : Value(tradeAction),
      timestampUs: Value(timestampUs),
      timeDisplay: Value(timeDisplay),
    );
  }

  factory EaLogsTableData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return EaLogsTableData(
      id: serializer.fromJson<int>(json['id']),
      eaInstanceId: serializer.fromJson<int>(json['eaInstanceId']),
      level: serializer.fromJson<String>(json['level']),
      message: serializer.fromJson<String>(json['message']),
      source: serializer.fromJson<String>(json['source']),
      tradeTicket: serializer.fromJson<int?>(json['tradeTicket']),
      tradeAction: serializer.fromJson<String?>(json['tradeAction']),
      timestampUs: serializer.fromJson<int>(json['timestampUs']),
      timeDisplay: serializer.fromJson<String>(json['timeDisplay']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'eaInstanceId': serializer.toJson<int>(eaInstanceId),
      'level': serializer.toJson<String>(level),
      'message': serializer.toJson<String>(message),
      'source': serializer.toJson<String>(source),
      'tradeTicket': serializer.toJson<int?>(tradeTicket),
      'tradeAction': serializer.toJson<String?>(tradeAction),
      'timestampUs': serializer.toJson<int>(timestampUs),
      'timeDisplay': serializer.toJson<String>(timeDisplay),
    };
  }

  EaLogsTableData copyWith(
          {int? id,
          int? eaInstanceId,
          String? level,
          String? message,
          String? source,
          Value<int?> tradeTicket = const Value.absent(),
          Value<String?> tradeAction = const Value.absent(),
          int? timestampUs,
          String? timeDisplay}) =>
      EaLogsTableData(
        id: id ?? this.id,
        eaInstanceId: eaInstanceId ?? this.eaInstanceId,
        level: level ?? this.level,
        message: message ?? this.message,
        source: source ?? this.source,
        tradeTicket: tradeTicket.present ? tradeTicket.value : this.tradeTicket,
        tradeAction: tradeAction.present ? tradeAction.value : this.tradeAction,
        timestampUs: timestampUs ?? this.timestampUs,
        timeDisplay: timeDisplay ?? this.timeDisplay,
      );
  EaLogsTableData copyWithCompanion(EaLogsTableCompanion data) {
    return EaLogsTableData(
      id: data.id.present ? data.id.value : this.id,
      eaInstanceId: data.eaInstanceId.present
          ? data.eaInstanceId.value
          : this.eaInstanceId,
      level: data.level.present ? data.level.value : this.level,
      message: data.message.present ? data.message.value : this.message,
      source: data.source.present ? data.source.value : this.source,
      tradeTicket:
          data.tradeTicket.present ? data.tradeTicket.value : this.tradeTicket,
      tradeAction:
          data.tradeAction.present ? data.tradeAction.value : this.tradeAction,
      timestampUs:
          data.timestampUs.present ? data.timestampUs.value : this.timestampUs,
      timeDisplay:
          data.timeDisplay.present ? data.timeDisplay.value : this.timeDisplay,
    );
  }

  @override
  String toString() {
    return (StringBuffer('EaLogsTableData(')
          ..write('id: $id, ')
          ..write('eaInstanceId: $eaInstanceId, ')
          ..write('level: $level, ')
          ..write('message: $message, ')
          ..write('source: $source, ')
          ..write('tradeTicket: $tradeTicket, ')
          ..write('tradeAction: $tradeAction, ')
          ..write('timestampUs: $timestampUs, ')
          ..write('timeDisplay: $timeDisplay')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, eaInstanceId, level, message, source,
      tradeTicket, tradeAction, timestampUs, timeDisplay);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is EaLogsTableData &&
          other.id == this.id &&
          other.eaInstanceId == this.eaInstanceId &&
          other.level == this.level &&
          other.message == this.message &&
          other.source == this.source &&
          other.tradeTicket == this.tradeTicket &&
          other.tradeAction == this.tradeAction &&
          other.timestampUs == this.timestampUs &&
          other.timeDisplay == this.timeDisplay);
}

class EaLogsTableCompanion extends UpdateCompanion<EaLogsTableData> {
  final Value<int> id;
  final Value<int> eaInstanceId;
  final Value<String> level;
  final Value<String> message;
  final Value<String> source;
  final Value<int?> tradeTicket;
  final Value<String?> tradeAction;
  final Value<int> timestampUs;
  final Value<String> timeDisplay;
  const EaLogsTableCompanion({
    this.id = const Value.absent(),
    this.eaInstanceId = const Value.absent(),
    this.level = const Value.absent(),
    this.message = const Value.absent(),
    this.source = const Value.absent(),
    this.tradeTicket = const Value.absent(),
    this.tradeAction = const Value.absent(),
    this.timestampUs = const Value.absent(),
    this.timeDisplay = const Value.absent(),
  });
  EaLogsTableCompanion.insert({
    this.id = const Value.absent(),
    required int eaInstanceId,
    required String level,
    required String message,
    required String source,
    this.tradeTicket = const Value.absent(),
    this.tradeAction = const Value.absent(),
    required int timestampUs,
    required String timeDisplay,
  })  : eaInstanceId = Value(eaInstanceId),
        level = Value(level),
        message = Value(message),
        source = Value(source),
        timestampUs = Value(timestampUs),
        timeDisplay = Value(timeDisplay);
  static Insertable<EaLogsTableData> custom({
    Expression<int>? id,
    Expression<int>? eaInstanceId,
    Expression<String>? level,
    Expression<String>? message,
    Expression<String>? source,
    Expression<int>? tradeTicket,
    Expression<String>? tradeAction,
    Expression<int>? timestampUs,
    Expression<String>? timeDisplay,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (eaInstanceId != null) 'ea_instance_id': eaInstanceId,
      if (level != null) 'level': level,
      if (message != null) 'message': message,
      if (source != null) 'source': source,
      if (tradeTicket != null) 'trade_ticket': tradeTicket,
      if (tradeAction != null) 'trade_action': tradeAction,
      if (timestampUs != null) 'timestamp_us': timestampUs,
      if (timeDisplay != null) 'time_display': timeDisplay,
    });
  }

  EaLogsTableCompanion copyWith(
      {Value<int>? id,
      Value<int>? eaInstanceId,
      Value<String>? level,
      Value<String>? message,
      Value<String>? source,
      Value<int?>? tradeTicket,
      Value<String?>? tradeAction,
      Value<int>? timestampUs,
      Value<String>? timeDisplay}) {
    return EaLogsTableCompanion(
      id: id ?? this.id,
      eaInstanceId: eaInstanceId ?? this.eaInstanceId,
      level: level ?? this.level,
      message: message ?? this.message,
      source: source ?? this.source,
      tradeTicket: tradeTicket ?? this.tradeTicket,
      tradeAction: tradeAction ?? this.tradeAction,
      timestampUs: timestampUs ?? this.timestampUs,
      timeDisplay: timeDisplay ?? this.timeDisplay,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (eaInstanceId.present) {
      map['ea_instance_id'] = Variable<int>(eaInstanceId.value);
    }
    if (level.present) {
      map['level'] = Variable<String>(level.value);
    }
    if (message.present) {
      map['message'] = Variable<String>(message.value);
    }
    if (source.present) {
      map['source'] = Variable<String>(source.value);
    }
    if (tradeTicket.present) {
      map['trade_ticket'] = Variable<int>(tradeTicket.value);
    }
    if (tradeAction.present) {
      map['trade_action'] = Variable<String>(tradeAction.value);
    }
    if (timestampUs.present) {
      map['timestamp_us'] = Variable<int>(timestampUs.value);
    }
    if (timeDisplay.present) {
      map['time_display'] = Variable<String>(timeDisplay.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('EaLogsTableCompanion(')
          ..write('id: $id, ')
          ..write('eaInstanceId: $eaInstanceId, ')
          ..write('level: $level, ')
          ..write('message: $message, ')
          ..write('source: $source, ')
          ..write('tradeTicket: $tradeTicket, ')
          ..write('tradeAction: $tradeAction, ')
          ..write('timestampUs: $timestampUs, ')
          ..write('timeDisplay: $timeDisplay')
          ..write(')'))
        .toString();
  }
}

class $CandlesTableTable extends CandlesTable
    with TableInfo<$CandlesTableTable, CandlesTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $CandlesTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _symbolMeta = const VerificationMeta('symbol');
  @override
  late final GeneratedColumn<String> symbol = GeneratedColumn<String>(
      'symbol', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _timeframeMeta =
      const VerificationMeta('timeframe');
  @override
  late final GeneratedColumn<String> timeframe = GeneratedColumn<String>(
      'timeframe', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _openMeta = const VerificationMeta('open');
  @override
  late final GeneratedColumn<double> open = GeneratedColumn<double>(
      'open', aliasedName, false,
      type: DriftSqlType.double, requiredDuringInsert: true);
  static const VerificationMeta _highMeta = const VerificationMeta('high');
  @override
  late final GeneratedColumn<double> high = GeneratedColumn<double>(
      'high', aliasedName, false,
      type: DriftSqlType.double, requiredDuringInsert: true);
  static const VerificationMeta _lowMeta = const VerificationMeta('low');
  @override
  late final GeneratedColumn<double> low = GeneratedColumn<double>(
      'low', aliasedName, false,
      type: DriftSqlType.double, requiredDuringInsert: true);
  static const VerificationMeta _closeMeta = const VerificationMeta('close');
  @override
  late final GeneratedColumn<double> close = GeneratedColumn<double>(
      'close', aliasedName, false,
      type: DriftSqlType.double, requiredDuringInsert: true);
  static const VerificationMeta _tickVolumeMeta =
      const VerificationMeta('tickVolume');
  @override
  late final GeneratedColumn<int> tickVolume = GeneratedColumn<int>(
      'tick_volume', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _bidOpenMeta =
      const VerificationMeta('bidOpen');
  @override
  late final GeneratedColumn<double> bidOpen = GeneratedColumn<double>(
      'bid_open', aliasedName, false,
      type: DriftSqlType.double, requiredDuringInsert: true);
  static const VerificationMeta _bidHighMeta =
      const VerificationMeta('bidHigh');
  @override
  late final GeneratedColumn<double> bidHigh = GeneratedColumn<double>(
      'bid_high', aliasedName, false,
      type: DriftSqlType.double, requiredDuringInsert: true);
  static const VerificationMeta _bidLowMeta = const VerificationMeta('bidLow');
  @override
  late final GeneratedColumn<double> bidLow = GeneratedColumn<double>(
      'bid_low', aliasedName, false,
      type: DriftSqlType.double, requiredDuringInsert: true);
  static const VerificationMeta _bidCloseMeta =
      const VerificationMeta('bidClose');
  @override
  late final GeneratedColumn<double> bidClose = GeneratedColumn<double>(
      'bid_close', aliasedName, false,
      type: DriftSqlType.double, requiredDuringInsert: true);
  static const VerificationMeta _askOpenMeta =
      const VerificationMeta('askOpen');
  @override
  late final GeneratedColumn<double> askOpen = GeneratedColumn<double>(
      'ask_open', aliasedName, false,
      type: DriftSqlType.double, requiredDuringInsert: true);
  static const VerificationMeta _askHighMeta =
      const VerificationMeta('askHigh');
  @override
  late final GeneratedColumn<double> askHigh = GeneratedColumn<double>(
      'ask_high', aliasedName, false,
      type: DriftSqlType.double, requiredDuringInsert: true);
  static const VerificationMeta _askLowMeta = const VerificationMeta('askLow');
  @override
  late final GeneratedColumn<double> askLow = GeneratedColumn<double>(
      'ask_low', aliasedName, false,
      type: DriftSqlType.double, requiredDuringInsert: true);
  static const VerificationMeta _askCloseMeta =
      const VerificationMeta('askClose');
  @override
  late final GeneratedColumn<double> askClose = GeneratedColumn<double>(
      'ask_close', aliasedName, false,
      type: DriftSqlType.double, requiredDuringInsert: true);
  static const VerificationMeta _openTimeUsMeta =
      const VerificationMeta('openTimeUs');
  @override
  late final GeneratedColumn<int> openTimeUs = GeneratedColumn<int>(
      'open_time_us', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _isCompleteMeta =
      const VerificationMeta('isComplete');
  @override
  late final GeneratedColumn<bool> isComplete = GeneratedColumn<bool>(
      'is_complete', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('CHECK ("is_complete" IN (0, 1))'),
      defaultValue: const Constant(false));
  static const VerificationMeta _bodySizeMeta =
      const VerificationMeta('bodySize');
  @override
  late final GeneratedColumn<double> bodySize = GeneratedColumn<double>(
      'body_size', aliasedName, false,
      type: DriftSqlType.double, requiredDuringInsert: true);
  static const VerificationMeta _upperShadowMeta =
      const VerificationMeta('upperShadow');
  @override
  late final GeneratedColumn<double> upperShadow = GeneratedColumn<double>(
      'upper_shadow', aliasedName, false,
      type: DriftSqlType.double, requiredDuringInsert: true);
  static const VerificationMeta _lowerShadowMeta =
      const VerificationMeta('lowerShadow');
  @override
  late final GeneratedColumn<double> lowerShadow = GeneratedColumn<double>(
      'lower_shadow', aliasedName, false,
      type: DriftSqlType.double, requiredDuringInsert: true);
  static const VerificationMeta _candleColorMeta =
      const VerificationMeta('candleColor');
  @override
  late final GeneratedColumn<String> candleColor = GeneratedColumn<String>(
      'candle_color', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [
        id,
        symbol,
        timeframe,
        open,
        high,
        low,
        close,
        tickVolume,
        bidOpen,
        bidHigh,
        bidLow,
        bidClose,
        askOpen,
        askHigh,
        askLow,
        askClose,
        openTimeUs,
        isComplete,
        bodySize,
        upperShadow,
        lowerShadow,
        candleColor
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'candles_table';
  @override
  VerificationContext validateIntegrity(Insertable<CandlesTableData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('symbol')) {
      context.handle(_symbolMeta,
          symbol.isAcceptableOrUnknown(data['symbol']!, _symbolMeta));
    } else if (isInserting) {
      context.missing(_symbolMeta);
    }
    if (data.containsKey('timeframe')) {
      context.handle(_timeframeMeta,
          timeframe.isAcceptableOrUnknown(data['timeframe']!, _timeframeMeta));
    } else if (isInserting) {
      context.missing(_timeframeMeta);
    }
    if (data.containsKey('open')) {
      context.handle(
          _openMeta, open.isAcceptableOrUnknown(data['open']!, _openMeta));
    } else if (isInserting) {
      context.missing(_openMeta);
    }
    if (data.containsKey('high')) {
      context.handle(
          _highMeta, high.isAcceptableOrUnknown(data['high']!, _highMeta));
    } else if (isInserting) {
      context.missing(_highMeta);
    }
    if (data.containsKey('low')) {
      context.handle(
          _lowMeta, low.isAcceptableOrUnknown(data['low']!, _lowMeta));
    } else if (isInserting) {
      context.missing(_lowMeta);
    }
    if (data.containsKey('close')) {
      context.handle(
          _closeMeta, close.isAcceptableOrUnknown(data['close']!, _closeMeta));
    } else if (isInserting) {
      context.missing(_closeMeta);
    }
    if (data.containsKey('tick_volume')) {
      context.handle(
          _tickVolumeMeta,
          tickVolume.isAcceptableOrUnknown(
              data['tick_volume']!, _tickVolumeMeta));
    } else if (isInserting) {
      context.missing(_tickVolumeMeta);
    }
    if (data.containsKey('bid_open')) {
      context.handle(_bidOpenMeta,
          bidOpen.isAcceptableOrUnknown(data['bid_open']!, _bidOpenMeta));
    } else if (isInserting) {
      context.missing(_bidOpenMeta);
    }
    if (data.containsKey('bid_high')) {
      context.handle(_bidHighMeta,
          bidHigh.isAcceptableOrUnknown(data['bid_high']!, _bidHighMeta));
    } else if (isInserting) {
      context.missing(_bidHighMeta);
    }
    if (data.containsKey('bid_low')) {
      context.handle(_bidLowMeta,
          bidLow.isAcceptableOrUnknown(data['bid_low']!, _bidLowMeta));
    } else if (isInserting) {
      context.missing(_bidLowMeta);
    }
    if (data.containsKey('bid_close')) {
      context.handle(_bidCloseMeta,
          bidClose.isAcceptableOrUnknown(data['bid_close']!, _bidCloseMeta));
    } else if (isInserting) {
      context.missing(_bidCloseMeta);
    }
    if (data.containsKey('ask_open')) {
      context.handle(_askOpenMeta,
          askOpen.isAcceptableOrUnknown(data['ask_open']!, _askOpenMeta));
    } else if (isInserting) {
      context.missing(_askOpenMeta);
    }
    if (data.containsKey('ask_high')) {
      context.handle(_askHighMeta,
          askHigh.isAcceptableOrUnknown(data['ask_high']!, _askHighMeta));
    } else if (isInserting) {
      context.missing(_askHighMeta);
    }
    if (data.containsKey('ask_low')) {
      context.handle(_askLowMeta,
          askLow.isAcceptableOrUnknown(data['ask_low']!, _askLowMeta));
    } else if (isInserting) {
      context.missing(_askLowMeta);
    }
    if (data.containsKey('ask_close')) {
      context.handle(_askCloseMeta,
          askClose.isAcceptableOrUnknown(data['ask_close']!, _askCloseMeta));
    } else if (isInserting) {
      context.missing(_askCloseMeta);
    }
    if (data.containsKey('open_time_us')) {
      context.handle(
          _openTimeUsMeta,
          openTimeUs.isAcceptableOrUnknown(
              data['open_time_us']!, _openTimeUsMeta));
    } else if (isInserting) {
      context.missing(_openTimeUsMeta);
    }
    if (data.containsKey('is_complete')) {
      context.handle(
          _isCompleteMeta,
          isComplete.isAcceptableOrUnknown(
              data['is_complete']!, _isCompleteMeta));
    }
    if (data.containsKey('body_size')) {
      context.handle(_bodySizeMeta,
          bodySize.isAcceptableOrUnknown(data['body_size']!, _bodySizeMeta));
    } else if (isInserting) {
      context.missing(_bodySizeMeta);
    }
    if (data.containsKey('upper_shadow')) {
      context.handle(
          _upperShadowMeta,
          upperShadow.isAcceptableOrUnknown(
              data['upper_shadow']!, _upperShadowMeta));
    } else if (isInserting) {
      context.missing(_upperShadowMeta);
    }
    if (data.containsKey('lower_shadow')) {
      context.handle(
          _lowerShadowMeta,
          lowerShadow.isAcceptableOrUnknown(
              data['lower_shadow']!, _lowerShadowMeta));
    } else if (isInserting) {
      context.missing(_lowerShadowMeta);
    }
    if (data.containsKey('candle_color')) {
      context.handle(
          _candleColorMeta,
          candleColor.isAcceptableOrUnknown(
              data['candle_color']!, _candleColorMeta));
    } else if (isInserting) {
      context.missing(_candleColorMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  CandlesTableData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return CandlesTableData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      symbol: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}symbol'])!,
      timeframe: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}timeframe'])!,
      open: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}open'])!,
      high: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}high'])!,
      low: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}low'])!,
      close: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}close'])!,
      tickVolume: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}tick_volume'])!,
      bidOpen: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}bid_open'])!,
      bidHigh: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}bid_high'])!,
      bidLow: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}bid_low'])!,
      bidClose: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}bid_close'])!,
      askOpen: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}ask_open'])!,
      askHigh: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}ask_high'])!,
      askLow: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}ask_low'])!,
      askClose: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}ask_close'])!,
      openTimeUs: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}open_time_us'])!,
      isComplete: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}is_complete'])!,
      bodySize: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}body_size'])!,
      upperShadow: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}upper_shadow'])!,
      lowerShadow: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}lower_shadow'])!,
      candleColor: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}candle_color'])!,
    );
  }

  @override
  $CandlesTableTable createAlias(String alias) {
    return $CandlesTableTable(attachedDatabase, alias);
  }
}

class CandlesTableData extends DataClass
    implements Insertable<CandlesTableData> {
  final int id;
  final String symbol;
  final String timeframe;
  final double open;
  final double high;
  final double low;
  final double close;
  final int tickVolume;
  final double bidOpen;
  final double bidHigh;
  final double bidLow;
  final double bidClose;
  final double askOpen;
  final double askHigh;
  final double askLow;
  final double askClose;
  final int openTimeUs;
  final bool isComplete;
  final double bodySize;
  final double upperShadow;
  final double lowerShadow;
  final String candleColor;
  const CandlesTableData(
      {required this.id,
      required this.symbol,
      required this.timeframe,
      required this.open,
      required this.high,
      required this.low,
      required this.close,
      required this.tickVolume,
      required this.bidOpen,
      required this.bidHigh,
      required this.bidLow,
      required this.bidClose,
      required this.askOpen,
      required this.askHigh,
      required this.askLow,
      required this.askClose,
      required this.openTimeUs,
      required this.isComplete,
      required this.bodySize,
      required this.upperShadow,
      required this.lowerShadow,
      required this.candleColor});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['symbol'] = Variable<String>(symbol);
    map['timeframe'] = Variable<String>(timeframe);
    map['open'] = Variable<double>(open);
    map['high'] = Variable<double>(high);
    map['low'] = Variable<double>(low);
    map['close'] = Variable<double>(close);
    map['tick_volume'] = Variable<int>(tickVolume);
    map['bid_open'] = Variable<double>(bidOpen);
    map['bid_high'] = Variable<double>(bidHigh);
    map['bid_low'] = Variable<double>(bidLow);
    map['bid_close'] = Variable<double>(bidClose);
    map['ask_open'] = Variable<double>(askOpen);
    map['ask_high'] = Variable<double>(askHigh);
    map['ask_low'] = Variable<double>(askLow);
    map['ask_close'] = Variable<double>(askClose);
    map['open_time_us'] = Variable<int>(openTimeUs);
    map['is_complete'] = Variable<bool>(isComplete);
    map['body_size'] = Variable<double>(bodySize);
    map['upper_shadow'] = Variable<double>(upperShadow);
    map['lower_shadow'] = Variable<double>(lowerShadow);
    map['candle_color'] = Variable<String>(candleColor);
    return map;
  }

  CandlesTableCompanion toCompanion(bool nullToAbsent) {
    return CandlesTableCompanion(
      id: Value(id),
      symbol: Value(symbol),
      timeframe: Value(timeframe),
      open: Value(open),
      high: Value(high),
      low: Value(low),
      close: Value(close),
      tickVolume: Value(tickVolume),
      bidOpen: Value(bidOpen),
      bidHigh: Value(bidHigh),
      bidLow: Value(bidLow),
      bidClose: Value(bidClose),
      askOpen: Value(askOpen),
      askHigh: Value(askHigh),
      askLow: Value(askLow),
      askClose: Value(askClose),
      openTimeUs: Value(openTimeUs),
      isComplete: Value(isComplete),
      bodySize: Value(bodySize),
      upperShadow: Value(upperShadow),
      lowerShadow: Value(lowerShadow),
      candleColor: Value(candleColor),
    );
  }

  factory CandlesTableData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return CandlesTableData(
      id: serializer.fromJson<int>(json['id']),
      symbol: serializer.fromJson<String>(json['symbol']),
      timeframe: serializer.fromJson<String>(json['timeframe']),
      open: serializer.fromJson<double>(json['open']),
      high: serializer.fromJson<double>(json['high']),
      low: serializer.fromJson<double>(json['low']),
      close: serializer.fromJson<double>(json['close']),
      tickVolume: serializer.fromJson<int>(json['tickVolume']),
      bidOpen: serializer.fromJson<double>(json['bidOpen']),
      bidHigh: serializer.fromJson<double>(json['bidHigh']),
      bidLow: serializer.fromJson<double>(json['bidLow']),
      bidClose: serializer.fromJson<double>(json['bidClose']),
      askOpen: serializer.fromJson<double>(json['askOpen']),
      askHigh: serializer.fromJson<double>(json['askHigh']),
      askLow: serializer.fromJson<double>(json['askLow']),
      askClose: serializer.fromJson<double>(json['askClose']),
      openTimeUs: serializer.fromJson<int>(json['openTimeUs']),
      isComplete: serializer.fromJson<bool>(json['isComplete']),
      bodySize: serializer.fromJson<double>(json['bodySize']),
      upperShadow: serializer.fromJson<double>(json['upperShadow']),
      lowerShadow: serializer.fromJson<double>(json['lowerShadow']),
      candleColor: serializer.fromJson<String>(json['candleColor']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'symbol': serializer.toJson<String>(symbol),
      'timeframe': serializer.toJson<String>(timeframe),
      'open': serializer.toJson<double>(open),
      'high': serializer.toJson<double>(high),
      'low': serializer.toJson<double>(low),
      'close': serializer.toJson<double>(close),
      'tickVolume': serializer.toJson<int>(tickVolume),
      'bidOpen': serializer.toJson<double>(bidOpen),
      'bidHigh': serializer.toJson<double>(bidHigh),
      'bidLow': serializer.toJson<double>(bidLow),
      'bidClose': serializer.toJson<double>(bidClose),
      'askOpen': serializer.toJson<double>(askOpen),
      'askHigh': serializer.toJson<double>(askHigh),
      'askLow': serializer.toJson<double>(askLow),
      'askClose': serializer.toJson<double>(askClose),
      'openTimeUs': serializer.toJson<int>(openTimeUs),
      'isComplete': serializer.toJson<bool>(isComplete),
      'bodySize': serializer.toJson<double>(bodySize),
      'upperShadow': serializer.toJson<double>(upperShadow),
      'lowerShadow': serializer.toJson<double>(lowerShadow),
      'candleColor': serializer.toJson<String>(candleColor),
    };
  }

  CandlesTableData copyWith(
          {int? id,
          String? symbol,
          String? timeframe,
          double? open,
          double? high,
          double? low,
          double? close,
          int? tickVolume,
          double? bidOpen,
          double? bidHigh,
          double? bidLow,
          double? bidClose,
          double? askOpen,
          double? askHigh,
          double? askLow,
          double? askClose,
          int? openTimeUs,
          bool? isComplete,
          double? bodySize,
          double? upperShadow,
          double? lowerShadow,
          String? candleColor}) =>
      CandlesTableData(
        id: id ?? this.id,
        symbol: symbol ?? this.symbol,
        timeframe: timeframe ?? this.timeframe,
        open: open ?? this.open,
        high: high ?? this.high,
        low: low ?? this.low,
        close: close ?? this.close,
        tickVolume: tickVolume ?? this.tickVolume,
        bidOpen: bidOpen ?? this.bidOpen,
        bidHigh: bidHigh ?? this.bidHigh,
        bidLow: bidLow ?? this.bidLow,
        bidClose: bidClose ?? this.bidClose,
        askOpen: askOpen ?? this.askOpen,
        askHigh: askHigh ?? this.askHigh,
        askLow: askLow ?? this.askLow,
        askClose: askClose ?? this.askClose,
        openTimeUs: openTimeUs ?? this.openTimeUs,
        isComplete: isComplete ?? this.isComplete,
        bodySize: bodySize ?? this.bodySize,
        upperShadow: upperShadow ?? this.upperShadow,
        lowerShadow: lowerShadow ?? this.lowerShadow,
        candleColor: candleColor ?? this.candleColor,
      );
  CandlesTableData copyWithCompanion(CandlesTableCompanion data) {
    return CandlesTableData(
      id: data.id.present ? data.id.value : this.id,
      symbol: data.symbol.present ? data.symbol.value : this.symbol,
      timeframe: data.timeframe.present ? data.timeframe.value : this.timeframe,
      open: data.open.present ? data.open.value : this.open,
      high: data.high.present ? data.high.value : this.high,
      low: data.low.present ? data.low.value : this.low,
      close: data.close.present ? data.close.value : this.close,
      tickVolume:
          data.tickVolume.present ? data.tickVolume.value : this.tickVolume,
      bidOpen: data.bidOpen.present ? data.bidOpen.value : this.bidOpen,
      bidHigh: data.bidHigh.present ? data.bidHigh.value : this.bidHigh,
      bidLow: data.bidLow.present ? data.bidLow.value : this.bidLow,
      bidClose: data.bidClose.present ? data.bidClose.value : this.bidClose,
      askOpen: data.askOpen.present ? data.askOpen.value : this.askOpen,
      askHigh: data.askHigh.present ? data.askHigh.value : this.askHigh,
      askLow: data.askLow.present ? data.askLow.value : this.askLow,
      askClose: data.askClose.present ? data.askClose.value : this.askClose,
      openTimeUs:
          data.openTimeUs.present ? data.openTimeUs.value : this.openTimeUs,
      isComplete:
          data.isComplete.present ? data.isComplete.value : this.isComplete,
      bodySize: data.bodySize.present ? data.bodySize.value : this.bodySize,
      upperShadow:
          data.upperShadow.present ? data.upperShadow.value : this.upperShadow,
      lowerShadow:
          data.lowerShadow.present ? data.lowerShadow.value : this.lowerShadow,
      candleColor:
          data.candleColor.present ? data.candleColor.value : this.candleColor,
    );
  }

  @override
  String toString() {
    return (StringBuffer('CandlesTableData(')
          ..write('id: $id, ')
          ..write('symbol: $symbol, ')
          ..write('timeframe: $timeframe, ')
          ..write('open: $open, ')
          ..write('high: $high, ')
          ..write('low: $low, ')
          ..write('close: $close, ')
          ..write('tickVolume: $tickVolume, ')
          ..write('bidOpen: $bidOpen, ')
          ..write('bidHigh: $bidHigh, ')
          ..write('bidLow: $bidLow, ')
          ..write('bidClose: $bidClose, ')
          ..write('askOpen: $askOpen, ')
          ..write('askHigh: $askHigh, ')
          ..write('askLow: $askLow, ')
          ..write('askClose: $askClose, ')
          ..write('openTimeUs: $openTimeUs, ')
          ..write('isComplete: $isComplete, ')
          ..write('bodySize: $bodySize, ')
          ..write('upperShadow: $upperShadow, ')
          ..write('lowerShadow: $lowerShadow, ')
          ..write('candleColor: $candleColor')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hashAll([
        id,
        symbol,
        timeframe,
        open,
        high,
        low,
        close,
        tickVolume,
        bidOpen,
        bidHigh,
        bidLow,
        bidClose,
        askOpen,
        askHigh,
        askLow,
        askClose,
        openTimeUs,
        isComplete,
        bodySize,
        upperShadow,
        lowerShadow,
        candleColor
      ]);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is CandlesTableData &&
          other.id == this.id &&
          other.symbol == this.symbol &&
          other.timeframe == this.timeframe &&
          other.open == this.open &&
          other.high == this.high &&
          other.low == this.low &&
          other.close == this.close &&
          other.tickVolume == this.tickVolume &&
          other.bidOpen == this.bidOpen &&
          other.bidHigh == this.bidHigh &&
          other.bidLow == this.bidLow &&
          other.bidClose == this.bidClose &&
          other.askOpen == this.askOpen &&
          other.askHigh == this.askHigh &&
          other.askLow == this.askLow &&
          other.askClose == this.askClose &&
          other.openTimeUs == this.openTimeUs &&
          other.isComplete == this.isComplete &&
          other.bodySize == this.bodySize &&
          other.upperShadow == this.upperShadow &&
          other.lowerShadow == this.lowerShadow &&
          other.candleColor == this.candleColor);
}

class CandlesTableCompanion extends UpdateCompanion<CandlesTableData> {
  final Value<int> id;
  final Value<String> symbol;
  final Value<String> timeframe;
  final Value<double> open;
  final Value<double> high;
  final Value<double> low;
  final Value<double> close;
  final Value<int> tickVolume;
  final Value<double> bidOpen;
  final Value<double> bidHigh;
  final Value<double> bidLow;
  final Value<double> bidClose;
  final Value<double> askOpen;
  final Value<double> askHigh;
  final Value<double> askLow;
  final Value<double> askClose;
  final Value<int> openTimeUs;
  final Value<bool> isComplete;
  final Value<double> bodySize;
  final Value<double> upperShadow;
  final Value<double> lowerShadow;
  final Value<String> candleColor;
  const CandlesTableCompanion({
    this.id = const Value.absent(),
    this.symbol = const Value.absent(),
    this.timeframe = const Value.absent(),
    this.open = const Value.absent(),
    this.high = const Value.absent(),
    this.low = const Value.absent(),
    this.close = const Value.absent(),
    this.tickVolume = const Value.absent(),
    this.bidOpen = const Value.absent(),
    this.bidHigh = const Value.absent(),
    this.bidLow = const Value.absent(),
    this.bidClose = const Value.absent(),
    this.askOpen = const Value.absent(),
    this.askHigh = const Value.absent(),
    this.askLow = const Value.absent(),
    this.askClose = const Value.absent(),
    this.openTimeUs = const Value.absent(),
    this.isComplete = const Value.absent(),
    this.bodySize = const Value.absent(),
    this.upperShadow = const Value.absent(),
    this.lowerShadow = const Value.absent(),
    this.candleColor = const Value.absent(),
  });
  CandlesTableCompanion.insert({
    this.id = const Value.absent(),
    required String symbol,
    required String timeframe,
    required double open,
    required double high,
    required double low,
    required double close,
    required int tickVolume,
    required double bidOpen,
    required double bidHigh,
    required double bidLow,
    required double bidClose,
    required double askOpen,
    required double askHigh,
    required double askLow,
    required double askClose,
    required int openTimeUs,
    this.isComplete = const Value.absent(),
    required double bodySize,
    required double upperShadow,
    required double lowerShadow,
    required String candleColor,
  })  : symbol = Value(symbol),
        timeframe = Value(timeframe),
        open = Value(open),
        high = Value(high),
        low = Value(low),
        close = Value(close),
        tickVolume = Value(tickVolume),
        bidOpen = Value(bidOpen),
        bidHigh = Value(bidHigh),
        bidLow = Value(bidLow),
        bidClose = Value(bidClose),
        askOpen = Value(askOpen),
        askHigh = Value(askHigh),
        askLow = Value(askLow),
        askClose = Value(askClose),
        openTimeUs = Value(openTimeUs),
        bodySize = Value(bodySize),
        upperShadow = Value(upperShadow),
        lowerShadow = Value(lowerShadow),
        candleColor = Value(candleColor);
  static Insertable<CandlesTableData> custom({
    Expression<int>? id,
    Expression<String>? symbol,
    Expression<String>? timeframe,
    Expression<double>? open,
    Expression<double>? high,
    Expression<double>? low,
    Expression<double>? close,
    Expression<int>? tickVolume,
    Expression<double>? bidOpen,
    Expression<double>? bidHigh,
    Expression<double>? bidLow,
    Expression<double>? bidClose,
    Expression<double>? askOpen,
    Expression<double>? askHigh,
    Expression<double>? askLow,
    Expression<double>? askClose,
    Expression<int>? openTimeUs,
    Expression<bool>? isComplete,
    Expression<double>? bodySize,
    Expression<double>? upperShadow,
    Expression<double>? lowerShadow,
    Expression<String>? candleColor,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (symbol != null) 'symbol': symbol,
      if (timeframe != null) 'timeframe': timeframe,
      if (open != null) 'open': open,
      if (high != null) 'high': high,
      if (low != null) 'low': low,
      if (close != null) 'close': close,
      if (tickVolume != null) 'tick_volume': tickVolume,
      if (bidOpen != null) 'bid_open': bidOpen,
      if (bidHigh != null) 'bid_high': bidHigh,
      if (bidLow != null) 'bid_low': bidLow,
      if (bidClose != null) 'bid_close': bidClose,
      if (askOpen != null) 'ask_open': askOpen,
      if (askHigh != null) 'ask_high': askHigh,
      if (askLow != null) 'ask_low': askLow,
      if (askClose != null) 'ask_close': askClose,
      if (openTimeUs != null) 'open_time_us': openTimeUs,
      if (isComplete != null) 'is_complete': isComplete,
      if (bodySize != null) 'body_size': bodySize,
      if (upperShadow != null) 'upper_shadow': upperShadow,
      if (lowerShadow != null) 'lower_shadow': lowerShadow,
      if (candleColor != null) 'candle_color': candleColor,
    });
  }

  CandlesTableCompanion copyWith(
      {Value<int>? id,
      Value<String>? symbol,
      Value<String>? timeframe,
      Value<double>? open,
      Value<double>? high,
      Value<double>? low,
      Value<double>? close,
      Value<int>? tickVolume,
      Value<double>? bidOpen,
      Value<double>? bidHigh,
      Value<double>? bidLow,
      Value<double>? bidClose,
      Value<double>? askOpen,
      Value<double>? askHigh,
      Value<double>? askLow,
      Value<double>? askClose,
      Value<int>? openTimeUs,
      Value<bool>? isComplete,
      Value<double>? bodySize,
      Value<double>? upperShadow,
      Value<double>? lowerShadow,
      Value<String>? candleColor}) {
    return CandlesTableCompanion(
      id: id ?? this.id,
      symbol: symbol ?? this.symbol,
      timeframe: timeframe ?? this.timeframe,
      open: open ?? this.open,
      high: high ?? this.high,
      low: low ?? this.low,
      close: close ?? this.close,
      tickVolume: tickVolume ?? this.tickVolume,
      bidOpen: bidOpen ?? this.bidOpen,
      bidHigh: bidHigh ?? this.bidHigh,
      bidLow: bidLow ?? this.bidLow,
      bidClose: bidClose ?? this.bidClose,
      askOpen: askOpen ?? this.askOpen,
      askHigh: askHigh ?? this.askHigh,
      askLow: askLow ?? this.askLow,
      askClose: askClose ?? this.askClose,
      openTimeUs: openTimeUs ?? this.openTimeUs,
      isComplete: isComplete ?? this.isComplete,
      bodySize: bodySize ?? this.bodySize,
      upperShadow: upperShadow ?? this.upperShadow,
      lowerShadow: lowerShadow ?? this.lowerShadow,
      candleColor: candleColor ?? this.candleColor,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (symbol.present) {
      map['symbol'] = Variable<String>(symbol.value);
    }
    if (timeframe.present) {
      map['timeframe'] = Variable<String>(timeframe.value);
    }
    if (open.present) {
      map['open'] = Variable<double>(open.value);
    }
    if (high.present) {
      map['high'] = Variable<double>(high.value);
    }
    if (low.present) {
      map['low'] = Variable<double>(low.value);
    }
    if (close.present) {
      map['close'] = Variable<double>(close.value);
    }
    if (tickVolume.present) {
      map['tick_volume'] = Variable<int>(tickVolume.value);
    }
    if (bidOpen.present) {
      map['bid_open'] = Variable<double>(bidOpen.value);
    }
    if (bidHigh.present) {
      map['bid_high'] = Variable<double>(bidHigh.value);
    }
    if (bidLow.present) {
      map['bid_low'] = Variable<double>(bidLow.value);
    }
    if (bidClose.present) {
      map['bid_close'] = Variable<double>(bidClose.value);
    }
    if (askOpen.present) {
      map['ask_open'] = Variable<double>(askOpen.value);
    }
    if (askHigh.present) {
      map['ask_high'] = Variable<double>(askHigh.value);
    }
    if (askLow.present) {
      map['ask_low'] = Variable<double>(askLow.value);
    }
    if (askClose.present) {
      map['ask_close'] = Variable<double>(askClose.value);
    }
    if (openTimeUs.present) {
      map['open_time_us'] = Variable<int>(openTimeUs.value);
    }
    if (isComplete.present) {
      map['is_complete'] = Variable<bool>(isComplete.value);
    }
    if (bodySize.present) {
      map['body_size'] = Variable<double>(bodySize.value);
    }
    if (upperShadow.present) {
      map['upper_shadow'] = Variable<double>(upperShadow.value);
    }
    if (lowerShadow.present) {
      map['lower_shadow'] = Variable<double>(lowerShadow.value);
    }
    if (candleColor.present) {
      map['candle_color'] = Variable<String>(candleColor.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('CandlesTableCompanion(')
          ..write('id: $id, ')
          ..write('symbol: $symbol, ')
          ..write('timeframe: $timeframe, ')
          ..write('open: $open, ')
          ..write('high: $high, ')
          ..write('low: $low, ')
          ..write('close: $close, ')
          ..write('tickVolume: $tickVolume, ')
          ..write('bidOpen: $bidOpen, ')
          ..write('bidHigh: $bidHigh, ')
          ..write('bidLow: $bidLow, ')
          ..write('bidClose: $bidClose, ')
          ..write('askOpen: $askOpen, ')
          ..write('askHigh: $askHigh, ')
          ..write('askLow: $askLow, ')
          ..write('askClose: $askClose, ')
          ..write('openTimeUs: $openTimeUs, ')
          ..write('isComplete: $isComplete, ')
          ..write('bodySize: $bodySize, ')
          ..write('upperShadow: $upperShadow, ')
          ..write('lowerShadow: $lowerShadow, ')
          ..write('candleColor: $candleColor')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $TicksTableTable ticksTable = $TicksTableTable(this);
  late final $SymbolsTableTable symbolsTable = $SymbolsTableTable(this);
  late final $PositionsTableTable positionsTable = $PositionsTableTable(this);
  late final $OrdersTableTable ordersTable = $OrdersTableTable(this);
  late final $ClosedTradesTableTable closedTradesTable =
      $ClosedTradesTableTable(this);
  late final $AccountSnapshotsTableTable accountSnapshotsTable =
      $AccountSnapshotsTableTable(this);
  late final $EaInstancesTableTable eaInstancesTable =
      $EaInstancesTableTable(this);
  late final $EaLogsTableTable eaLogsTable = $EaLogsTableTable(this);
  late final $CandlesTableTable candlesTable = $CandlesTableTable(this);
  late final Index candleSymbolTfTime = Index('candle_symbol_tf_time',
      'CREATE INDEX candle_symbol_tf_time ON candles_table (symbol, timeframe, open_time_us)');
  late final TicksDao ticksDao = TicksDao(this as AppDatabase);
  late final PositionsDao positionsDao = PositionsDao(this as AppDatabase);
  late final OrdersDao ordersDao = OrdersDao(this as AppDatabase);
  late final HistoryDao historyDao = HistoryDao(this as AppDatabase);
  late final AccountDao accountDao = AccountDao(this as AppDatabase);
  late final EaDao eaDao = EaDao(this as AppDatabase);
  late final CandlesDao candlesDao = CandlesDao(this as AppDatabase);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [
        ticksTable,
        symbolsTable,
        positionsTable,
        ordersTable,
        closedTradesTable,
        accountSnapshotsTable,
        eaInstancesTable,
        eaLogsTable,
        candlesTable,
        candleSymbolTfTime
      ];
}

typedef $$TicksTableTableCreateCompanionBuilder = TicksTableCompanion Function({
  Value<int> id,
  required String symbol,
  required double bid,
  required double ask,
  required double spread,
  required double spreadPips,
  required double dailyHigh,
  required double dailyLow,
  required int timestampUs,
  required int oandaTimestamp,
  Value<bool> isLive,
});
typedef $$TicksTableTableUpdateCompanionBuilder = TicksTableCompanion Function({
  Value<int> id,
  Value<String> symbol,
  Value<double> bid,
  Value<double> ask,
  Value<double> spread,
  Value<double> spreadPips,
  Value<double> dailyHigh,
  Value<double> dailyLow,
  Value<int> timestampUs,
  Value<int> oandaTimestamp,
  Value<bool> isLive,
});

class $$TicksTableTableTableManager extends RootTableManager<
    _$AppDatabase,
    $TicksTableTable,
    Tick,
    $$TicksTableTableFilterComposer,
    $$TicksTableTableOrderingComposer,
    $$TicksTableTableCreateCompanionBuilder,
    $$TicksTableTableUpdateCompanionBuilder> {
  $$TicksTableTableTableManager(_$AppDatabase db, $TicksTableTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          filteringComposer:
              $$TicksTableTableFilterComposer(ComposerState(db, table)),
          orderingComposer:
              $$TicksTableTableOrderingComposer(ComposerState(db, table)),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<String> symbol = const Value.absent(),
            Value<double> bid = const Value.absent(),
            Value<double> ask = const Value.absent(),
            Value<double> spread = const Value.absent(),
            Value<double> spreadPips = const Value.absent(),
            Value<double> dailyHigh = const Value.absent(),
            Value<double> dailyLow = const Value.absent(),
            Value<int> timestampUs = const Value.absent(),
            Value<int> oandaTimestamp = const Value.absent(),
            Value<bool> isLive = const Value.absent(),
          }) =>
              TicksTableCompanion(
            id: id,
            symbol: symbol,
            bid: bid,
            ask: ask,
            spread: spread,
            spreadPips: spreadPips,
            dailyHigh: dailyHigh,
            dailyLow: dailyLow,
            timestampUs: timestampUs,
            oandaTimestamp: oandaTimestamp,
            isLive: isLive,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required String symbol,
            required double bid,
            required double ask,
            required double spread,
            required double spreadPips,
            required double dailyHigh,
            required double dailyLow,
            required int timestampUs,
            required int oandaTimestamp,
            Value<bool> isLive = const Value.absent(),
          }) =>
              TicksTableCompanion.insert(
            id: id,
            symbol: symbol,
            bid: bid,
            ask: ask,
            spread: spread,
            spreadPips: spreadPips,
            dailyHigh: dailyHigh,
            dailyLow: dailyLow,
            timestampUs: timestampUs,
            oandaTimestamp: oandaTimestamp,
            isLive: isLive,
          ),
        ));
}

class $$TicksTableTableFilterComposer
    extends FilterComposer<_$AppDatabase, $TicksTableTable> {
  $$TicksTableTableFilterComposer(super.$state);
  ColumnFilters<int> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get symbol => $state.composableBuilder(
      column: $state.table.symbol,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<double> get bid => $state.composableBuilder(
      column: $state.table.bid,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<double> get ask => $state.composableBuilder(
      column: $state.table.ask,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<double> get spread => $state.composableBuilder(
      column: $state.table.spread,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<double> get spreadPips => $state.composableBuilder(
      column: $state.table.spreadPips,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<double> get dailyHigh => $state.composableBuilder(
      column: $state.table.dailyHigh,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<double> get dailyLow => $state.composableBuilder(
      column: $state.table.dailyLow,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<int> get timestampUs => $state.composableBuilder(
      column: $state.table.timestampUs,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<int> get oandaTimestamp => $state.composableBuilder(
      column: $state.table.oandaTimestamp,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<bool> get isLive => $state.composableBuilder(
      column: $state.table.isLive,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));
}

class $$TicksTableTableOrderingComposer
    extends OrderingComposer<_$AppDatabase, $TicksTableTable> {
  $$TicksTableTableOrderingComposer(super.$state);
  ColumnOrderings<int> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get symbol => $state.composableBuilder(
      column: $state.table.symbol,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<double> get bid => $state.composableBuilder(
      column: $state.table.bid,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<double> get ask => $state.composableBuilder(
      column: $state.table.ask,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<double> get spread => $state.composableBuilder(
      column: $state.table.spread,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<double> get spreadPips => $state.composableBuilder(
      column: $state.table.spreadPips,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<double> get dailyHigh => $state.composableBuilder(
      column: $state.table.dailyHigh,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<double> get dailyLow => $state.composableBuilder(
      column: $state.table.dailyLow,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<int> get timestampUs => $state.composableBuilder(
      column: $state.table.timestampUs,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<int> get oandaTimestamp => $state.composableBuilder(
      column: $state.table.oandaTimestamp,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<bool> get isLive => $state.composableBuilder(
      column: $state.table.isLive,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));
}

typedef $$SymbolsTableTableCreateCompanionBuilder = SymbolsTableCompanion
    Function({
  required String name,
  required String displayName,
  required int displayExPrecision,
  required String type,
  required String pipLocation,
  required int displayPrecision,
  required double minimumTradeSize,
  required double marginRate,
  required int tradeUnitsPrecision,
  Value<bool> isWatchlisted,
  Value<int> watchlistSortOrder,
  required int lastUpdatedUs,
  Value<int> rowid,
});
typedef $$SymbolsTableTableUpdateCompanionBuilder = SymbolsTableCompanion
    Function({
  Value<String> name,
  Value<String> displayName,
  Value<int> displayExPrecision,
  Value<String> type,
  Value<String> pipLocation,
  Value<int> displayPrecision,
  Value<double> minimumTradeSize,
  Value<double> marginRate,
  Value<int> tradeUnitsPrecision,
  Value<bool> isWatchlisted,
  Value<int> watchlistSortOrder,
  Value<int> lastUpdatedUs,
  Value<int> rowid,
});

class $$SymbolsTableTableTableManager extends RootTableManager<
    _$AppDatabase,
    $SymbolsTableTable,
    SymbolsTableData,
    $$SymbolsTableTableFilterComposer,
    $$SymbolsTableTableOrderingComposer,
    $$SymbolsTableTableCreateCompanionBuilder,
    $$SymbolsTableTableUpdateCompanionBuilder> {
  $$SymbolsTableTableTableManager(_$AppDatabase db, $SymbolsTableTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          filteringComposer:
              $$SymbolsTableTableFilterComposer(ComposerState(db, table)),
          orderingComposer:
              $$SymbolsTableTableOrderingComposer(ComposerState(db, table)),
          updateCompanionCallback: ({
            Value<String> name = const Value.absent(),
            Value<String> displayName = const Value.absent(),
            Value<int> displayExPrecision = const Value.absent(),
            Value<String> type = const Value.absent(),
            Value<String> pipLocation = const Value.absent(),
            Value<int> displayPrecision = const Value.absent(),
            Value<double> minimumTradeSize = const Value.absent(),
            Value<double> marginRate = const Value.absent(),
            Value<int> tradeUnitsPrecision = const Value.absent(),
            Value<bool> isWatchlisted = const Value.absent(),
            Value<int> watchlistSortOrder = const Value.absent(),
            Value<int> lastUpdatedUs = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              SymbolsTableCompanion(
            name: name,
            displayName: displayName,
            displayExPrecision: displayExPrecision,
            type: type,
            pipLocation: pipLocation,
            displayPrecision: displayPrecision,
            minimumTradeSize: minimumTradeSize,
            marginRate: marginRate,
            tradeUnitsPrecision: tradeUnitsPrecision,
            isWatchlisted: isWatchlisted,
            watchlistSortOrder: watchlistSortOrder,
            lastUpdatedUs: lastUpdatedUs,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required String name,
            required String displayName,
            required int displayExPrecision,
            required String type,
            required String pipLocation,
            required int displayPrecision,
            required double minimumTradeSize,
            required double marginRate,
            required int tradeUnitsPrecision,
            Value<bool> isWatchlisted = const Value.absent(),
            Value<int> watchlistSortOrder = const Value.absent(),
            required int lastUpdatedUs,
            Value<int> rowid = const Value.absent(),
          }) =>
              SymbolsTableCompanion.insert(
            name: name,
            displayName: displayName,
            displayExPrecision: displayExPrecision,
            type: type,
            pipLocation: pipLocation,
            displayPrecision: displayPrecision,
            minimumTradeSize: minimumTradeSize,
            marginRate: marginRate,
            tradeUnitsPrecision: tradeUnitsPrecision,
            isWatchlisted: isWatchlisted,
            watchlistSortOrder: watchlistSortOrder,
            lastUpdatedUs: lastUpdatedUs,
            rowid: rowid,
          ),
        ));
}

class $$SymbolsTableTableFilterComposer
    extends FilterComposer<_$AppDatabase, $SymbolsTableTable> {
  $$SymbolsTableTableFilterComposer(super.$state);
  ColumnFilters<String> get name => $state.composableBuilder(
      column: $state.table.name,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get displayName => $state.composableBuilder(
      column: $state.table.displayName,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<int> get displayExPrecision => $state.composableBuilder(
      column: $state.table.displayExPrecision,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get type => $state.composableBuilder(
      column: $state.table.type,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get pipLocation => $state.composableBuilder(
      column: $state.table.pipLocation,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<int> get displayPrecision => $state.composableBuilder(
      column: $state.table.displayPrecision,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<double> get minimumTradeSize => $state.composableBuilder(
      column: $state.table.minimumTradeSize,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<double> get marginRate => $state.composableBuilder(
      column: $state.table.marginRate,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<int> get tradeUnitsPrecision => $state.composableBuilder(
      column: $state.table.tradeUnitsPrecision,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<bool> get isWatchlisted => $state.composableBuilder(
      column: $state.table.isWatchlisted,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<int> get watchlistSortOrder => $state.composableBuilder(
      column: $state.table.watchlistSortOrder,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<int> get lastUpdatedUs => $state.composableBuilder(
      column: $state.table.lastUpdatedUs,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));
}

class $$SymbolsTableTableOrderingComposer
    extends OrderingComposer<_$AppDatabase, $SymbolsTableTable> {
  $$SymbolsTableTableOrderingComposer(super.$state);
  ColumnOrderings<String> get name => $state.composableBuilder(
      column: $state.table.name,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get displayName => $state.composableBuilder(
      column: $state.table.displayName,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<int> get displayExPrecision => $state.composableBuilder(
      column: $state.table.displayExPrecision,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get type => $state.composableBuilder(
      column: $state.table.type,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get pipLocation => $state.composableBuilder(
      column: $state.table.pipLocation,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<int> get displayPrecision => $state.composableBuilder(
      column: $state.table.displayPrecision,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<double> get minimumTradeSize => $state.composableBuilder(
      column: $state.table.minimumTradeSize,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<double> get marginRate => $state.composableBuilder(
      column: $state.table.marginRate,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<int> get tradeUnitsPrecision => $state.composableBuilder(
      column: $state.table.tradeUnitsPrecision,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<bool> get isWatchlisted => $state.composableBuilder(
      column: $state.table.isWatchlisted,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<int> get watchlistSortOrder => $state.composableBuilder(
      column: $state.table.watchlistSortOrder,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<int> get lastUpdatedUs => $state.composableBuilder(
      column: $state.table.lastUpdatedUs,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));
}

typedef $$PositionsTableTableCreateCompanionBuilder = PositionsTableCompanion
    Function({
  Value<int> id,
  required String oandaTradeId,
  required String symbol,
  required String direction,
  required double lots,
  required double units,
  required double openPrice,
  required double currentPrice,
  Value<double?> stopLoss,
  Value<double?> takeProfit,
  required double floatingPnl,
  required double swap,
  required double commission,
  required double marginUsed,
  required int openTimeUs,
  required int magicNumber,
  required String comment,
  Value<bool> isModifying,
});
typedef $$PositionsTableTableUpdateCompanionBuilder = PositionsTableCompanion
    Function({
  Value<int> id,
  Value<String> oandaTradeId,
  Value<String> symbol,
  Value<String> direction,
  Value<double> lots,
  Value<double> units,
  Value<double> openPrice,
  Value<double> currentPrice,
  Value<double?> stopLoss,
  Value<double?> takeProfit,
  Value<double> floatingPnl,
  Value<double> swap,
  Value<double> commission,
  Value<double> marginUsed,
  Value<int> openTimeUs,
  Value<int> magicNumber,
  Value<String> comment,
  Value<bool> isModifying,
});

class $$PositionsTableTableTableManager extends RootTableManager<
    _$AppDatabase,
    $PositionsTableTable,
    PositionsTableData,
    $$PositionsTableTableFilterComposer,
    $$PositionsTableTableOrderingComposer,
    $$PositionsTableTableCreateCompanionBuilder,
    $$PositionsTableTableUpdateCompanionBuilder> {
  $$PositionsTableTableTableManager(
      _$AppDatabase db, $PositionsTableTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          filteringComposer:
              $$PositionsTableTableFilterComposer(ComposerState(db, table)),
          orderingComposer:
              $$PositionsTableTableOrderingComposer(ComposerState(db, table)),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<String> oandaTradeId = const Value.absent(),
            Value<String> symbol = const Value.absent(),
            Value<String> direction = const Value.absent(),
            Value<double> lots = const Value.absent(),
            Value<double> units = const Value.absent(),
            Value<double> openPrice = const Value.absent(),
            Value<double> currentPrice = const Value.absent(),
            Value<double?> stopLoss = const Value.absent(),
            Value<double?> takeProfit = const Value.absent(),
            Value<double> floatingPnl = const Value.absent(),
            Value<double> swap = const Value.absent(),
            Value<double> commission = const Value.absent(),
            Value<double> marginUsed = const Value.absent(),
            Value<int> openTimeUs = const Value.absent(),
            Value<int> magicNumber = const Value.absent(),
            Value<String> comment = const Value.absent(),
            Value<bool> isModifying = const Value.absent(),
          }) =>
              PositionsTableCompanion(
            id: id,
            oandaTradeId: oandaTradeId,
            symbol: symbol,
            direction: direction,
            lots: lots,
            units: units,
            openPrice: openPrice,
            currentPrice: currentPrice,
            stopLoss: stopLoss,
            takeProfit: takeProfit,
            floatingPnl: floatingPnl,
            swap: swap,
            commission: commission,
            marginUsed: marginUsed,
            openTimeUs: openTimeUs,
            magicNumber: magicNumber,
            comment: comment,
            isModifying: isModifying,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required String oandaTradeId,
            required String symbol,
            required String direction,
            required double lots,
            required double units,
            required double openPrice,
            required double currentPrice,
            Value<double?> stopLoss = const Value.absent(),
            Value<double?> takeProfit = const Value.absent(),
            required double floatingPnl,
            required double swap,
            required double commission,
            required double marginUsed,
            required int openTimeUs,
            required int magicNumber,
            required String comment,
            Value<bool> isModifying = const Value.absent(),
          }) =>
              PositionsTableCompanion.insert(
            id: id,
            oandaTradeId: oandaTradeId,
            symbol: symbol,
            direction: direction,
            lots: lots,
            units: units,
            openPrice: openPrice,
            currentPrice: currentPrice,
            stopLoss: stopLoss,
            takeProfit: takeProfit,
            floatingPnl: floatingPnl,
            swap: swap,
            commission: commission,
            marginUsed: marginUsed,
            openTimeUs: openTimeUs,
            magicNumber: magicNumber,
            comment: comment,
            isModifying: isModifying,
          ),
        ));
}

class $$PositionsTableTableFilterComposer
    extends FilterComposer<_$AppDatabase, $PositionsTableTable> {
  $$PositionsTableTableFilterComposer(super.$state);
  ColumnFilters<int> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get oandaTradeId => $state.composableBuilder(
      column: $state.table.oandaTradeId,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get symbol => $state.composableBuilder(
      column: $state.table.symbol,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get direction => $state.composableBuilder(
      column: $state.table.direction,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<double> get lots => $state.composableBuilder(
      column: $state.table.lots,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<double> get units => $state.composableBuilder(
      column: $state.table.units,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<double> get openPrice => $state.composableBuilder(
      column: $state.table.openPrice,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<double> get currentPrice => $state.composableBuilder(
      column: $state.table.currentPrice,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<double> get stopLoss => $state.composableBuilder(
      column: $state.table.stopLoss,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<double> get takeProfit => $state.composableBuilder(
      column: $state.table.takeProfit,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<double> get floatingPnl => $state.composableBuilder(
      column: $state.table.floatingPnl,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<double> get swap => $state.composableBuilder(
      column: $state.table.swap,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<double> get commission => $state.composableBuilder(
      column: $state.table.commission,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<double> get marginUsed => $state.composableBuilder(
      column: $state.table.marginUsed,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<int> get openTimeUs => $state.composableBuilder(
      column: $state.table.openTimeUs,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<int> get magicNumber => $state.composableBuilder(
      column: $state.table.magicNumber,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get comment => $state.composableBuilder(
      column: $state.table.comment,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<bool> get isModifying => $state.composableBuilder(
      column: $state.table.isModifying,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));
}

class $$PositionsTableTableOrderingComposer
    extends OrderingComposer<_$AppDatabase, $PositionsTableTable> {
  $$PositionsTableTableOrderingComposer(super.$state);
  ColumnOrderings<int> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get oandaTradeId => $state.composableBuilder(
      column: $state.table.oandaTradeId,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get symbol => $state.composableBuilder(
      column: $state.table.symbol,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get direction => $state.composableBuilder(
      column: $state.table.direction,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<double> get lots => $state.composableBuilder(
      column: $state.table.lots,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<double> get units => $state.composableBuilder(
      column: $state.table.units,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<double> get openPrice => $state.composableBuilder(
      column: $state.table.openPrice,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<double> get currentPrice => $state.composableBuilder(
      column: $state.table.currentPrice,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<double> get stopLoss => $state.composableBuilder(
      column: $state.table.stopLoss,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<double> get takeProfit => $state.composableBuilder(
      column: $state.table.takeProfit,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<double> get floatingPnl => $state.composableBuilder(
      column: $state.table.floatingPnl,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<double> get swap => $state.composableBuilder(
      column: $state.table.swap,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<double> get commission => $state.composableBuilder(
      column: $state.table.commission,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<double> get marginUsed => $state.composableBuilder(
      column: $state.table.marginUsed,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<int> get openTimeUs => $state.composableBuilder(
      column: $state.table.openTimeUs,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<int> get magicNumber => $state.composableBuilder(
      column: $state.table.magicNumber,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get comment => $state.composableBuilder(
      column: $state.table.comment,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<bool> get isModifying => $state.composableBuilder(
      column: $state.table.isModifying,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));
}

typedef $$OrdersTableTableCreateCompanionBuilder = OrdersTableCompanion
    Function({
  Value<int> id,
  required String oandaOrderId,
  required String symbol,
  required String orderType,
  required String direction,
  required double lots,
  required double units,
  required double price,
  Value<double?> priceBound,
  Value<double?> stopLoss,
  Value<double?> takeProfit,
  required String timeInForce,
  Value<int?> expiryTimeUs,
  required String status,
  required int createTimeUs,
  required int lastModifiedUs,
  required int magicNumber,
  required String comment,
  Value<double?> distanceFromMarket,
});
typedef $$OrdersTableTableUpdateCompanionBuilder = OrdersTableCompanion
    Function({
  Value<int> id,
  Value<String> oandaOrderId,
  Value<String> symbol,
  Value<String> orderType,
  Value<String> direction,
  Value<double> lots,
  Value<double> units,
  Value<double> price,
  Value<double?> priceBound,
  Value<double?> stopLoss,
  Value<double?> takeProfit,
  Value<String> timeInForce,
  Value<int?> expiryTimeUs,
  Value<String> status,
  Value<int> createTimeUs,
  Value<int> lastModifiedUs,
  Value<int> magicNumber,
  Value<String> comment,
  Value<double?> distanceFromMarket,
});

class $$OrdersTableTableTableManager extends RootTableManager<
    _$AppDatabase,
    $OrdersTableTable,
    OrdersTableData,
    $$OrdersTableTableFilterComposer,
    $$OrdersTableTableOrderingComposer,
    $$OrdersTableTableCreateCompanionBuilder,
    $$OrdersTableTableUpdateCompanionBuilder> {
  $$OrdersTableTableTableManager(_$AppDatabase db, $OrdersTableTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          filteringComposer:
              $$OrdersTableTableFilterComposer(ComposerState(db, table)),
          orderingComposer:
              $$OrdersTableTableOrderingComposer(ComposerState(db, table)),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<String> oandaOrderId = const Value.absent(),
            Value<String> symbol = const Value.absent(),
            Value<String> orderType = const Value.absent(),
            Value<String> direction = const Value.absent(),
            Value<double> lots = const Value.absent(),
            Value<double> units = const Value.absent(),
            Value<double> price = const Value.absent(),
            Value<double?> priceBound = const Value.absent(),
            Value<double?> stopLoss = const Value.absent(),
            Value<double?> takeProfit = const Value.absent(),
            Value<String> timeInForce = const Value.absent(),
            Value<int?> expiryTimeUs = const Value.absent(),
            Value<String> status = const Value.absent(),
            Value<int> createTimeUs = const Value.absent(),
            Value<int> lastModifiedUs = const Value.absent(),
            Value<int> magicNumber = const Value.absent(),
            Value<String> comment = const Value.absent(),
            Value<double?> distanceFromMarket = const Value.absent(),
          }) =>
              OrdersTableCompanion(
            id: id,
            oandaOrderId: oandaOrderId,
            symbol: symbol,
            orderType: orderType,
            direction: direction,
            lots: lots,
            units: units,
            price: price,
            priceBound: priceBound,
            stopLoss: stopLoss,
            takeProfit: takeProfit,
            timeInForce: timeInForce,
            expiryTimeUs: expiryTimeUs,
            status: status,
            createTimeUs: createTimeUs,
            lastModifiedUs: lastModifiedUs,
            magicNumber: magicNumber,
            comment: comment,
            distanceFromMarket: distanceFromMarket,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required String oandaOrderId,
            required String symbol,
            required String orderType,
            required String direction,
            required double lots,
            required double units,
            required double price,
            Value<double?> priceBound = const Value.absent(),
            Value<double?> stopLoss = const Value.absent(),
            Value<double?> takeProfit = const Value.absent(),
            required String timeInForce,
            Value<int?> expiryTimeUs = const Value.absent(),
            required String status,
            required int createTimeUs,
            required int lastModifiedUs,
            required int magicNumber,
            required String comment,
            Value<double?> distanceFromMarket = const Value.absent(),
          }) =>
              OrdersTableCompanion.insert(
            id: id,
            oandaOrderId: oandaOrderId,
            symbol: symbol,
            orderType: orderType,
            direction: direction,
            lots: lots,
            units: units,
            price: price,
            priceBound: priceBound,
            stopLoss: stopLoss,
            takeProfit: takeProfit,
            timeInForce: timeInForce,
            expiryTimeUs: expiryTimeUs,
            status: status,
            createTimeUs: createTimeUs,
            lastModifiedUs: lastModifiedUs,
            magicNumber: magicNumber,
            comment: comment,
            distanceFromMarket: distanceFromMarket,
          ),
        ));
}

class $$OrdersTableTableFilterComposer
    extends FilterComposer<_$AppDatabase, $OrdersTableTable> {
  $$OrdersTableTableFilterComposer(super.$state);
  ColumnFilters<int> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get oandaOrderId => $state.composableBuilder(
      column: $state.table.oandaOrderId,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get symbol => $state.composableBuilder(
      column: $state.table.symbol,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get orderType => $state.composableBuilder(
      column: $state.table.orderType,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get direction => $state.composableBuilder(
      column: $state.table.direction,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<double> get lots => $state.composableBuilder(
      column: $state.table.lots,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<double> get units => $state.composableBuilder(
      column: $state.table.units,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<double> get price => $state.composableBuilder(
      column: $state.table.price,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<double> get priceBound => $state.composableBuilder(
      column: $state.table.priceBound,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<double> get stopLoss => $state.composableBuilder(
      column: $state.table.stopLoss,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<double> get takeProfit => $state.composableBuilder(
      column: $state.table.takeProfit,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get timeInForce => $state.composableBuilder(
      column: $state.table.timeInForce,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<int> get expiryTimeUs => $state.composableBuilder(
      column: $state.table.expiryTimeUs,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get status => $state.composableBuilder(
      column: $state.table.status,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<int> get createTimeUs => $state.composableBuilder(
      column: $state.table.createTimeUs,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<int> get lastModifiedUs => $state.composableBuilder(
      column: $state.table.lastModifiedUs,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<int> get magicNumber => $state.composableBuilder(
      column: $state.table.magicNumber,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get comment => $state.composableBuilder(
      column: $state.table.comment,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<double> get distanceFromMarket => $state.composableBuilder(
      column: $state.table.distanceFromMarket,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));
}

class $$OrdersTableTableOrderingComposer
    extends OrderingComposer<_$AppDatabase, $OrdersTableTable> {
  $$OrdersTableTableOrderingComposer(super.$state);
  ColumnOrderings<int> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get oandaOrderId => $state.composableBuilder(
      column: $state.table.oandaOrderId,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get symbol => $state.composableBuilder(
      column: $state.table.symbol,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get orderType => $state.composableBuilder(
      column: $state.table.orderType,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get direction => $state.composableBuilder(
      column: $state.table.direction,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<double> get lots => $state.composableBuilder(
      column: $state.table.lots,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<double> get units => $state.composableBuilder(
      column: $state.table.units,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<double> get price => $state.composableBuilder(
      column: $state.table.price,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<double> get priceBound => $state.composableBuilder(
      column: $state.table.priceBound,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<double> get stopLoss => $state.composableBuilder(
      column: $state.table.stopLoss,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<double> get takeProfit => $state.composableBuilder(
      column: $state.table.takeProfit,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get timeInForce => $state.composableBuilder(
      column: $state.table.timeInForce,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<int> get expiryTimeUs => $state.composableBuilder(
      column: $state.table.expiryTimeUs,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get status => $state.composableBuilder(
      column: $state.table.status,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<int> get createTimeUs => $state.composableBuilder(
      column: $state.table.createTimeUs,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<int> get lastModifiedUs => $state.composableBuilder(
      column: $state.table.lastModifiedUs,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<int> get magicNumber => $state.composableBuilder(
      column: $state.table.magicNumber,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get comment => $state.composableBuilder(
      column: $state.table.comment,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<double> get distanceFromMarket => $state.composableBuilder(
      column: $state.table.distanceFromMarket,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));
}

typedef $$ClosedTradesTableTableCreateCompanionBuilder
    = ClosedTradesTableCompanion Function({
  Value<int> id,
  required String oandaTradeId,
  required String symbol,
  required String direction,
  required double lots,
  required double units,
  required double openPrice,
  required double closePrice,
  Value<double?> stopLoss,
  Value<double?> takeProfit,
  required double realizedPnl,
  required double swap,
  required double commission,
  required double netProfit,
  required double maxProfit,
  required double maxDrawdown,
  required double priceDeltaPips,
  required String closeReason,
  required int openTimeUs,
  required int closeTimeUs,
  required int durationSeconds,
  required String openSession,
  required int magicNumber,
  required String comment,
  required String closeDate,
});
typedef $$ClosedTradesTableTableUpdateCompanionBuilder
    = ClosedTradesTableCompanion Function({
  Value<int> id,
  Value<String> oandaTradeId,
  Value<String> symbol,
  Value<String> direction,
  Value<double> lots,
  Value<double> units,
  Value<double> openPrice,
  Value<double> closePrice,
  Value<double?> stopLoss,
  Value<double?> takeProfit,
  Value<double> realizedPnl,
  Value<double> swap,
  Value<double> commission,
  Value<double> netProfit,
  Value<double> maxProfit,
  Value<double> maxDrawdown,
  Value<double> priceDeltaPips,
  Value<String> closeReason,
  Value<int> openTimeUs,
  Value<int> closeTimeUs,
  Value<int> durationSeconds,
  Value<String> openSession,
  Value<int> magicNumber,
  Value<String> comment,
  Value<String> closeDate,
});

class $$ClosedTradesTableTableTableManager extends RootTableManager<
    _$AppDatabase,
    $ClosedTradesTableTable,
    ClosedTradesTableData,
    $$ClosedTradesTableTableFilterComposer,
    $$ClosedTradesTableTableOrderingComposer,
    $$ClosedTradesTableTableCreateCompanionBuilder,
    $$ClosedTradesTableTableUpdateCompanionBuilder> {
  $$ClosedTradesTableTableTableManager(
      _$AppDatabase db, $ClosedTradesTableTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          filteringComposer:
              $$ClosedTradesTableTableFilterComposer(ComposerState(db, table)),
          orderingComposer: $$ClosedTradesTableTableOrderingComposer(
              ComposerState(db, table)),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<String> oandaTradeId = const Value.absent(),
            Value<String> symbol = const Value.absent(),
            Value<String> direction = const Value.absent(),
            Value<double> lots = const Value.absent(),
            Value<double> units = const Value.absent(),
            Value<double> openPrice = const Value.absent(),
            Value<double> closePrice = const Value.absent(),
            Value<double?> stopLoss = const Value.absent(),
            Value<double?> takeProfit = const Value.absent(),
            Value<double> realizedPnl = const Value.absent(),
            Value<double> swap = const Value.absent(),
            Value<double> commission = const Value.absent(),
            Value<double> netProfit = const Value.absent(),
            Value<double> maxProfit = const Value.absent(),
            Value<double> maxDrawdown = const Value.absent(),
            Value<double> priceDeltaPips = const Value.absent(),
            Value<String> closeReason = const Value.absent(),
            Value<int> openTimeUs = const Value.absent(),
            Value<int> closeTimeUs = const Value.absent(),
            Value<int> durationSeconds = const Value.absent(),
            Value<String> openSession = const Value.absent(),
            Value<int> magicNumber = const Value.absent(),
            Value<String> comment = const Value.absent(),
            Value<String> closeDate = const Value.absent(),
          }) =>
              ClosedTradesTableCompanion(
            id: id,
            oandaTradeId: oandaTradeId,
            symbol: symbol,
            direction: direction,
            lots: lots,
            units: units,
            openPrice: openPrice,
            closePrice: closePrice,
            stopLoss: stopLoss,
            takeProfit: takeProfit,
            realizedPnl: realizedPnl,
            swap: swap,
            commission: commission,
            netProfit: netProfit,
            maxProfit: maxProfit,
            maxDrawdown: maxDrawdown,
            priceDeltaPips: priceDeltaPips,
            closeReason: closeReason,
            openTimeUs: openTimeUs,
            closeTimeUs: closeTimeUs,
            durationSeconds: durationSeconds,
            openSession: openSession,
            magicNumber: magicNumber,
            comment: comment,
            closeDate: closeDate,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required String oandaTradeId,
            required String symbol,
            required String direction,
            required double lots,
            required double units,
            required double openPrice,
            required double closePrice,
            Value<double?> stopLoss = const Value.absent(),
            Value<double?> takeProfit = const Value.absent(),
            required double realizedPnl,
            required double swap,
            required double commission,
            required double netProfit,
            required double maxProfit,
            required double maxDrawdown,
            required double priceDeltaPips,
            required String closeReason,
            required int openTimeUs,
            required int closeTimeUs,
            required int durationSeconds,
            required String openSession,
            required int magicNumber,
            required String comment,
            required String closeDate,
          }) =>
              ClosedTradesTableCompanion.insert(
            id: id,
            oandaTradeId: oandaTradeId,
            symbol: symbol,
            direction: direction,
            lots: lots,
            units: units,
            openPrice: openPrice,
            closePrice: closePrice,
            stopLoss: stopLoss,
            takeProfit: takeProfit,
            realizedPnl: realizedPnl,
            swap: swap,
            commission: commission,
            netProfit: netProfit,
            maxProfit: maxProfit,
            maxDrawdown: maxDrawdown,
            priceDeltaPips: priceDeltaPips,
            closeReason: closeReason,
            openTimeUs: openTimeUs,
            closeTimeUs: closeTimeUs,
            durationSeconds: durationSeconds,
            openSession: openSession,
            magicNumber: magicNumber,
            comment: comment,
            closeDate: closeDate,
          ),
        ));
}

class $$ClosedTradesTableTableFilterComposer
    extends FilterComposer<_$AppDatabase, $ClosedTradesTableTable> {
  $$ClosedTradesTableTableFilterComposer(super.$state);
  ColumnFilters<int> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get oandaTradeId => $state.composableBuilder(
      column: $state.table.oandaTradeId,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get symbol => $state.composableBuilder(
      column: $state.table.symbol,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get direction => $state.composableBuilder(
      column: $state.table.direction,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<double> get lots => $state.composableBuilder(
      column: $state.table.lots,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<double> get units => $state.composableBuilder(
      column: $state.table.units,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<double> get openPrice => $state.composableBuilder(
      column: $state.table.openPrice,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<double> get closePrice => $state.composableBuilder(
      column: $state.table.closePrice,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<double> get stopLoss => $state.composableBuilder(
      column: $state.table.stopLoss,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<double> get takeProfit => $state.composableBuilder(
      column: $state.table.takeProfit,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<double> get realizedPnl => $state.composableBuilder(
      column: $state.table.realizedPnl,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<double> get swap => $state.composableBuilder(
      column: $state.table.swap,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<double> get commission => $state.composableBuilder(
      column: $state.table.commission,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<double> get netProfit => $state.composableBuilder(
      column: $state.table.netProfit,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<double> get maxProfit => $state.composableBuilder(
      column: $state.table.maxProfit,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<double> get maxDrawdown => $state.composableBuilder(
      column: $state.table.maxDrawdown,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<double> get priceDeltaPips => $state.composableBuilder(
      column: $state.table.priceDeltaPips,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get closeReason => $state.composableBuilder(
      column: $state.table.closeReason,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<int> get openTimeUs => $state.composableBuilder(
      column: $state.table.openTimeUs,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<int> get closeTimeUs => $state.composableBuilder(
      column: $state.table.closeTimeUs,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<int> get durationSeconds => $state.composableBuilder(
      column: $state.table.durationSeconds,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get openSession => $state.composableBuilder(
      column: $state.table.openSession,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<int> get magicNumber => $state.composableBuilder(
      column: $state.table.magicNumber,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get comment => $state.composableBuilder(
      column: $state.table.comment,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get closeDate => $state.composableBuilder(
      column: $state.table.closeDate,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));
}

class $$ClosedTradesTableTableOrderingComposer
    extends OrderingComposer<_$AppDatabase, $ClosedTradesTableTable> {
  $$ClosedTradesTableTableOrderingComposer(super.$state);
  ColumnOrderings<int> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get oandaTradeId => $state.composableBuilder(
      column: $state.table.oandaTradeId,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get symbol => $state.composableBuilder(
      column: $state.table.symbol,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get direction => $state.composableBuilder(
      column: $state.table.direction,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<double> get lots => $state.composableBuilder(
      column: $state.table.lots,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<double> get units => $state.composableBuilder(
      column: $state.table.units,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<double> get openPrice => $state.composableBuilder(
      column: $state.table.openPrice,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<double> get closePrice => $state.composableBuilder(
      column: $state.table.closePrice,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<double> get stopLoss => $state.composableBuilder(
      column: $state.table.stopLoss,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<double> get takeProfit => $state.composableBuilder(
      column: $state.table.takeProfit,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<double> get realizedPnl => $state.composableBuilder(
      column: $state.table.realizedPnl,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<double> get swap => $state.composableBuilder(
      column: $state.table.swap,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<double> get commission => $state.composableBuilder(
      column: $state.table.commission,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<double> get netProfit => $state.composableBuilder(
      column: $state.table.netProfit,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<double> get maxProfit => $state.composableBuilder(
      column: $state.table.maxProfit,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<double> get maxDrawdown => $state.composableBuilder(
      column: $state.table.maxDrawdown,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<double> get priceDeltaPips => $state.composableBuilder(
      column: $state.table.priceDeltaPips,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get closeReason => $state.composableBuilder(
      column: $state.table.closeReason,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<int> get openTimeUs => $state.composableBuilder(
      column: $state.table.openTimeUs,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<int> get closeTimeUs => $state.composableBuilder(
      column: $state.table.closeTimeUs,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<int> get durationSeconds => $state.composableBuilder(
      column: $state.table.durationSeconds,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get openSession => $state.composableBuilder(
      column: $state.table.openSession,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<int> get magicNumber => $state.composableBuilder(
      column: $state.table.magicNumber,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get comment => $state.composableBuilder(
      column: $state.table.comment,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get closeDate => $state.composableBuilder(
      column: $state.table.closeDate,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));
}

typedef $$AccountSnapshotsTableTableCreateCompanionBuilder
    = AccountSnapshotsTableCompanion Function({
  Value<int> id,
  required String accountId,
  required double balance,
  required double equity,
  required double marginUsed,
  required double marginAvailable,
  required double marginLevel,
  required double nav,
  required int openPositionCount,
  required double unrealizedPnl,
  required double dailyRealizedPnl,
  required String snapshotTrigger,
  required int timestampUs,
  required String date,
});
typedef $$AccountSnapshotsTableTableUpdateCompanionBuilder
    = AccountSnapshotsTableCompanion Function({
  Value<int> id,
  Value<String> accountId,
  Value<double> balance,
  Value<double> equity,
  Value<double> marginUsed,
  Value<double> marginAvailable,
  Value<double> marginLevel,
  Value<double> nav,
  Value<int> openPositionCount,
  Value<double> unrealizedPnl,
  Value<double> dailyRealizedPnl,
  Value<String> snapshotTrigger,
  Value<int> timestampUs,
  Value<String> date,
});

class $$AccountSnapshotsTableTableTableManager extends RootTableManager<
    _$AppDatabase,
    $AccountSnapshotsTableTable,
    AccountSnapshotsTableData,
    $$AccountSnapshotsTableTableFilterComposer,
    $$AccountSnapshotsTableTableOrderingComposer,
    $$AccountSnapshotsTableTableCreateCompanionBuilder,
    $$AccountSnapshotsTableTableUpdateCompanionBuilder> {
  $$AccountSnapshotsTableTableTableManager(
      _$AppDatabase db, $AccountSnapshotsTableTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          filteringComposer: $$AccountSnapshotsTableTableFilterComposer(
              ComposerState(db, table)),
          orderingComposer: $$AccountSnapshotsTableTableOrderingComposer(
              ComposerState(db, table)),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<String> accountId = const Value.absent(),
            Value<double> balance = const Value.absent(),
            Value<double> equity = const Value.absent(),
            Value<double> marginUsed = const Value.absent(),
            Value<double> marginAvailable = const Value.absent(),
            Value<double> marginLevel = const Value.absent(),
            Value<double> nav = const Value.absent(),
            Value<int> openPositionCount = const Value.absent(),
            Value<double> unrealizedPnl = const Value.absent(),
            Value<double> dailyRealizedPnl = const Value.absent(),
            Value<String> snapshotTrigger = const Value.absent(),
            Value<int> timestampUs = const Value.absent(),
            Value<String> date = const Value.absent(),
          }) =>
              AccountSnapshotsTableCompanion(
            id: id,
            accountId: accountId,
            balance: balance,
            equity: equity,
            marginUsed: marginUsed,
            marginAvailable: marginAvailable,
            marginLevel: marginLevel,
            nav: nav,
            openPositionCount: openPositionCount,
            unrealizedPnl: unrealizedPnl,
            dailyRealizedPnl: dailyRealizedPnl,
            snapshotTrigger: snapshotTrigger,
            timestampUs: timestampUs,
            date: date,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required String accountId,
            required double balance,
            required double equity,
            required double marginUsed,
            required double marginAvailable,
            required double marginLevel,
            required double nav,
            required int openPositionCount,
            required double unrealizedPnl,
            required double dailyRealizedPnl,
            required String snapshotTrigger,
            required int timestampUs,
            required String date,
          }) =>
              AccountSnapshotsTableCompanion.insert(
            id: id,
            accountId: accountId,
            balance: balance,
            equity: equity,
            marginUsed: marginUsed,
            marginAvailable: marginAvailable,
            marginLevel: marginLevel,
            nav: nav,
            openPositionCount: openPositionCount,
            unrealizedPnl: unrealizedPnl,
            dailyRealizedPnl: dailyRealizedPnl,
            snapshotTrigger: snapshotTrigger,
            timestampUs: timestampUs,
            date: date,
          ),
        ));
}

class $$AccountSnapshotsTableTableFilterComposer
    extends FilterComposer<_$AppDatabase, $AccountSnapshotsTableTable> {
  $$AccountSnapshotsTableTableFilterComposer(super.$state);
  ColumnFilters<int> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get accountId => $state.composableBuilder(
      column: $state.table.accountId,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<double> get balance => $state.composableBuilder(
      column: $state.table.balance,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<double> get equity => $state.composableBuilder(
      column: $state.table.equity,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<double> get marginUsed => $state.composableBuilder(
      column: $state.table.marginUsed,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<double> get marginAvailable => $state.composableBuilder(
      column: $state.table.marginAvailable,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<double> get marginLevel => $state.composableBuilder(
      column: $state.table.marginLevel,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<double> get nav => $state.composableBuilder(
      column: $state.table.nav,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<int> get openPositionCount => $state.composableBuilder(
      column: $state.table.openPositionCount,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<double> get unrealizedPnl => $state.composableBuilder(
      column: $state.table.unrealizedPnl,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<double> get dailyRealizedPnl => $state.composableBuilder(
      column: $state.table.dailyRealizedPnl,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get snapshotTrigger => $state.composableBuilder(
      column: $state.table.snapshotTrigger,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<int> get timestampUs => $state.composableBuilder(
      column: $state.table.timestampUs,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get date => $state.composableBuilder(
      column: $state.table.date,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));
}

class $$AccountSnapshotsTableTableOrderingComposer
    extends OrderingComposer<_$AppDatabase, $AccountSnapshotsTableTable> {
  $$AccountSnapshotsTableTableOrderingComposer(super.$state);
  ColumnOrderings<int> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get accountId => $state.composableBuilder(
      column: $state.table.accountId,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<double> get balance => $state.composableBuilder(
      column: $state.table.balance,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<double> get equity => $state.composableBuilder(
      column: $state.table.equity,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<double> get marginUsed => $state.composableBuilder(
      column: $state.table.marginUsed,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<double> get marginAvailable => $state.composableBuilder(
      column: $state.table.marginAvailable,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<double> get marginLevel => $state.composableBuilder(
      column: $state.table.marginLevel,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<double> get nav => $state.composableBuilder(
      column: $state.table.nav,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<int> get openPositionCount => $state.composableBuilder(
      column: $state.table.openPositionCount,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<double> get unrealizedPnl => $state.composableBuilder(
      column: $state.table.unrealizedPnl,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<double> get dailyRealizedPnl => $state.composableBuilder(
      column: $state.table.dailyRealizedPnl,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get snapshotTrigger => $state.composableBuilder(
      column: $state.table.snapshotTrigger,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<int> get timestampUs => $state.composableBuilder(
      column: $state.table.timestampUs,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get date => $state.composableBuilder(
      column: $state.table.date,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));
}

typedef $$EaInstancesTableTableCreateCompanionBuilder
    = EaInstancesTableCompanion Function({
  Value<int> id,
  required String name,
  required String scriptPath,
  required String scriptFilename,
  required String scriptHash,
  required int scriptSizeBytes,
  required String symbol,
  required int magicNumber,
  required double fixedLotSize,
  required int maxPositions,
  required String customParameters,
  required String status,
  Value<bool> autoStart,
  required int killOnDisconnectSeconds,
  required double maxDailyLossLimit,
  Value<int> totalTrades,
  Value<double> totalNetProfit,
  Value<double> winRate,
  required int createdAtUs,
  Value<int?> lastStartedAtUs,
  Value<int?> lastStoppedAtUs,
  Value<int?> lastTickReceivedAtUs,
  Value<String?> lastError,
});
typedef $$EaInstancesTableTableUpdateCompanionBuilder
    = EaInstancesTableCompanion Function({
  Value<int> id,
  Value<String> name,
  Value<String> scriptPath,
  Value<String> scriptFilename,
  Value<String> scriptHash,
  Value<int> scriptSizeBytes,
  Value<String> symbol,
  Value<int> magicNumber,
  Value<double> fixedLotSize,
  Value<int> maxPositions,
  Value<String> customParameters,
  Value<String> status,
  Value<bool> autoStart,
  Value<int> killOnDisconnectSeconds,
  Value<double> maxDailyLossLimit,
  Value<int> totalTrades,
  Value<double> totalNetProfit,
  Value<double> winRate,
  Value<int> createdAtUs,
  Value<int?> lastStartedAtUs,
  Value<int?> lastStoppedAtUs,
  Value<int?> lastTickReceivedAtUs,
  Value<String?> lastError,
});

class $$EaInstancesTableTableTableManager extends RootTableManager<
    _$AppDatabase,
    $EaInstancesTableTable,
    EaInstancesTableData,
    $$EaInstancesTableTableFilterComposer,
    $$EaInstancesTableTableOrderingComposer,
    $$EaInstancesTableTableCreateCompanionBuilder,
    $$EaInstancesTableTableUpdateCompanionBuilder> {
  $$EaInstancesTableTableTableManager(
      _$AppDatabase db, $EaInstancesTableTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          filteringComposer:
              $$EaInstancesTableTableFilterComposer(ComposerState(db, table)),
          orderingComposer:
              $$EaInstancesTableTableOrderingComposer(ComposerState(db, table)),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<String> name = const Value.absent(),
            Value<String> scriptPath = const Value.absent(),
            Value<String> scriptFilename = const Value.absent(),
            Value<String> scriptHash = const Value.absent(),
            Value<int> scriptSizeBytes = const Value.absent(),
            Value<String> symbol = const Value.absent(),
            Value<int> magicNumber = const Value.absent(),
            Value<double> fixedLotSize = const Value.absent(),
            Value<int> maxPositions = const Value.absent(),
            Value<String> customParameters = const Value.absent(),
            Value<String> status = const Value.absent(),
            Value<bool> autoStart = const Value.absent(),
            Value<int> killOnDisconnectSeconds = const Value.absent(),
            Value<double> maxDailyLossLimit = const Value.absent(),
            Value<int> totalTrades = const Value.absent(),
            Value<double> totalNetProfit = const Value.absent(),
            Value<double> winRate = const Value.absent(),
            Value<int> createdAtUs = const Value.absent(),
            Value<int?> lastStartedAtUs = const Value.absent(),
            Value<int?> lastStoppedAtUs = const Value.absent(),
            Value<int?> lastTickReceivedAtUs = const Value.absent(),
            Value<String?> lastError = const Value.absent(),
          }) =>
              EaInstancesTableCompanion(
            id: id,
            name: name,
            scriptPath: scriptPath,
            scriptFilename: scriptFilename,
            scriptHash: scriptHash,
            scriptSizeBytes: scriptSizeBytes,
            symbol: symbol,
            magicNumber: magicNumber,
            fixedLotSize: fixedLotSize,
            maxPositions: maxPositions,
            customParameters: customParameters,
            status: status,
            autoStart: autoStart,
            killOnDisconnectSeconds: killOnDisconnectSeconds,
            maxDailyLossLimit: maxDailyLossLimit,
            totalTrades: totalTrades,
            totalNetProfit: totalNetProfit,
            winRate: winRate,
            createdAtUs: createdAtUs,
            lastStartedAtUs: lastStartedAtUs,
            lastStoppedAtUs: lastStoppedAtUs,
            lastTickReceivedAtUs: lastTickReceivedAtUs,
            lastError: lastError,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required String name,
            required String scriptPath,
            required String scriptFilename,
            required String scriptHash,
            required int scriptSizeBytes,
            required String symbol,
            required int magicNumber,
            required double fixedLotSize,
            required int maxPositions,
            required String customParameters,
            required String status,
            Value<bool> autoStart = const Value.absent(),
            required int killOnDisconnectSeconds,
            required double maxDailyLossLimit,
            Value<int> totalTrades = const Value.absent(),
            Value<double> totalNetProfit = const Value.absent(),
            Value<double> winRate = const Value.absent(),
            required int createdAtUs,
            Value<int?> lastStartedAtUs = const Value.absent(),
            Value<int?> lastStoppedAtUs = const Value.absent(),
            Value<int?> lastTickReceivedAtUs = const Value.absent(),
            Value<String?> lastError = const Value.absent(),
          }) =>
              EaInstancesTableCompanion.insert(
            id: id,
            name: name,
            scriptPath: scriptPath,
            scriptFilename: scriptFilename,
            scriptHash: scriptHash,
            scriptSizeBytes: scriptSizeBytes,
            symbol: symbol,
            magicNumber: magicNumber,
            fixedLotSize: fixedLotSize,
            maxPositions: maxPositions,
            customParameters: customParameters,
            status: status,
            autoStart: autoStart,
            killOnDisconnectSeconds: killOnDisconnectSeconds,
            maxDailyLossLimit: maxDailyLossLimit,
            totalTrades: totalTrades,
            totalNetProfit: totalNetProfit,
            winRate: winRate,
            createdAtUs: createdAtUs,
            lastStartedAtUs: lastStartedAtUs,
            lastStoppedAtUs: lastStoppedAtUs,
            lastTickReceivedAtUs: lastTickReceivedAtUs,
            lastError: lastError,
          ),
        ));
}

class $$EaInstancesTableTableFilterComposer
    extends FilterComposer<_$AppDatabase, $EaInstancesTableTable> {
  $$EaInstancesTableTableFilterComposer(super.$state);
  ColumnFilters<int> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get name => $state.composableBuilder(
      column: $state.table.name,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get scriptPath => $state.composableBuilder(
      column: $state.table.scriptPath,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get scriptFilename => $state.composableBuilder(
      column: $state.table.scriptFilename,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get scriptHash => $state.composableBuilder(
      column: $state.table.scriptHash,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<int> get scriptSizeBytes => $state.composableBuilder(
      column: $state.table.scriptSizeBytes,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get symbol => $state.composableBuilder(
      column: $state.table.symbol,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<int> get magicNumber => $state.composableBuilder(
      column: $state.table.magicNumber,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<double> get fixedLotSize => $state.composableBuilder(
      column: $state.table.fixedLotSize,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<int> get maxPositions => $state.composableBuilder(
      column: $state.table.maxPositions,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get customParameters => $state.composableBuilder(
      column: $state.table.customParameters,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get status => $state.composableBuilder(
      column: $state.table.status,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<bool> get autoStart => $state.composableBuilder(
      column: $state.table.autoStart,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<int> get killOnDisconnectSeconds => $state.composableBuilder(
      column: $state.table.killOnDisconnectSeconds,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<double> get maxDailyLossLimit => $state.composableBuilder(
      column: $state.table.maxDailyLossLimit,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<int> get totalTrades => $state.composableBuilder(
      column: $state.table.totalTrades,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<double> get totalNetProfit => $state.composableBuilder(
      column: $state.table.totalNetProfit,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<double> get winRate => $state.composableBuilder(
      column: $state.table.winRate,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<int> get createdAtUs => $state.composableBuilder(
      column: $state.table.createdAtUs,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<int> get lastStartedAtUs => $state.composableBuilder(
      column: $state.table.lastStartedAtUs,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<int> get lastStoppedAtUs => $state.composableBuilder(
      column: $state.table.lastStoppedAtUs,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<int> get lastTickReceivedAtUs => $state.composableBuilder(
      column: $state.table.lastTickReceivedAtUs,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get lastError => $state.composableBuilder(
      column: $state.table.lastError,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));
}

class $$EaInstancesTableTableOrderingComposer
    extends OrderingComposer<_$AppDatabase, $EaInstancesTableTable> {
  $$EaInstancesTableTableOrderingComposer(super.$state);
  ColumnOrderings<int> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get name => $state.composableBuilder(
      column: $state.table.name,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get scriptPath => $state.composableBuilder(
      column: $state.table.scriptPath,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get scriptFilename => $state.composableBuilder(
      column: $state.table.scriptFilename,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get scriptHash => $state.composableBuilder(
      column: $state.table.scriptHash,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<int> get scriptSizeBytes => $state.composableBuilder(
      column: $state.table.scriptSizeBytes,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get symbol => $state.composableBuilder(
      column: $state.table.symbol,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<int> get magicNumber => $state.composableBuilder(
      column: $state.table.magicNumber,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<double> get fixedLotSize => $state.composableBuilder(
      column: $state.table.fixedLotSize,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<int> get maxPositions => $state.composableBuilder(
      column: $state.table.maxPositions,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get customParameters => $state.composableBuilder(
      column: $state.table.customParameters,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get status => $state.composableBuilder(
      column: $state.table.status,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<bool> get autoStart => $state.composableBuilder(
      column: $state.table.autoStart,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<int> get killOnDisconnectSeconds => $state.composableBuilder(
      column: $state.table.killOnDisconnectSeconds,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<double> get maxDailyLossLimit => $state.composableBuilder(
      column: $state.table.maxDailyLossLimit,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<int> get totalTrades => $state.composableBuilder(
      column: $state.table.totalTrades,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<double> get totalNetProfit => $state.composableBuilder(
      column: $state.table.totalNetProfit,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<double> get winRate => $state.composableBuilder(
      column: $state.table.winRate,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<int> get createdAtUs => $state.composableBuilder(
      column: $state.table.createdAtUs,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<int> get lastStartedAtUs => $state.composableBuilder(
      column: $state.table.lastStartedAtUs,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<int> get lastStoppedAtUs => $state.composableBuilder(
      column: $state.table.lastStoppedAtUs,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<int> get lastTickReceivedAtUs => $state.composableBuilder(
      column: $state.table.lastTickReceivedAtUs,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get lastError => $state.composableBuilder(
      column: $state.table.lastError,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));
}

typedef $$EaLogsTableTableCreateCompanionBuilder = EaLogsTableCompanion
    Function({
  Value<int> id,
  required int eaInstanceId,
  required String level,
  required String message,
  required String source,
  Value<int?> tradeTicket,
  Value<String?> tradeAction,
  required int timestampUs,
  required String timeDisplay,
});
typedef $$EaLogsTableTableUpdateCompanionBuilder = EaLogsTableCompanion
    Function({
  Value<int> id,
  Value<int> eaInstanceId,
  Value<String> level,
  Value<String> message,
  Value<String> source,
  Value<int?> tradeTicket,
  Value<String?> tradeAction,
  Value<int> timestampUs,
  Value<String> timeDisplay,
});

class $$EaLogsTableTableTableManager extends RootTableManager<
    _$AppDatabase,
    $EaLogsTableTable,
    EaLogsTableData,
    $$EaLogsTableTableFilterComposer,
    $$EaLogsTableTableOrderingComposer,
    $$EaLogsTableTableCreateCompanionBuilder,
    $$EaLogsTableTableUpdateCompanionBuilder> {
  $$EaLogsTableTableTableManager(_$AppDatabase db, $EaLogsTableTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          filteringComposer:
              $$EaLogsTableTableFilterComposer(ComposerState(db, table)),
          orderingComposer:
              $$EaLogsTableTableOrderingComposer(ComposerState(db, table)),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<int> eaInstanceId = const Value.absent(),
            Value<String> level = const Value.absent(),
            Value<String> message = const Value.absent(),
            Value<String> source = const Value.absent(),
            Value<int?> tradeTicket = const Value.absent(),
            Value<String?> tradeAction = const Value.absent(),
            Value<int> timestampUs = const Value.absent(),
            Value<String> timeDisplay = const Value.absent(),
          }) =>
              EaLogsTableCompanion(
            id: id,
            eaInstanceId: eaInstanceId,
            level: level,
            message: message,
            source: source,
            tradeTicket: tradeTicket,
            tradeAction: tradeAction,
            timestampUs: timestampUs,
            timeDisplay: timeDisplay,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required int eaInstanceId,
            required String level,
            required String message,
            required String source,
            Value<int?> tradeTicket = const Value.absent(),
            Value<String?> tradeAction = const Value.absent(),
            required int timestampUs,
            required String timeDisplay,
          }) =>
              EaLogsTableCompanion.insert(
            id: id,
            eaInstanceId: eaInstanceId,
            level: level,
            message: message,
            source: source,
            tradeTicket: tradeTicket,
            tradeAction: tradeAction,
            timestampUs: timestampUs,
            timeDisplay: timeDisplay,
          ),
        ));
}

class $$EaLogsTableTableFilterComposer
    extends FilterComposer<_$AppDatabase, $EaLogsTableTable> {
  $$EaLogsTableTableFilterComposer(super.$state);
  ColumnFilters<int> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<int> get eaInstanceId => $state.composableBuilder(
      column: $state.table.eaInstanceId,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get level => $state.composableBuilder(
      column: $state.table.level,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get message => $state.composableBuilder(
      column: $state.table.message,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get source => $state.composableBuilder(
      column: $state.table.source,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<int> get tradeTicket => $state.composableBuilder(
      column: $state.table.tradeTicket,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get tradeAction => $state.composableBuilder(
      column: $state.table.tradeAction,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<int> get timestampUs => $state.composableBuilder(
      column: $state.table.timestampUs,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get timeDisplay => $state.composableBuilder(
      column: $state.table.timeDisplay,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));
}

class $$EaLogsTableTableOrderingComposer
    extends OrderingComposer<_$AppDatabase, $EaLogsTableTable> {
  $$EaLogsTableTableOrderingComposer(super.$state);
  ColumnOrderings<int> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<int> get eaInstanceId => $state.composableBuilder(
      column: $state.table.eaInstanceId,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get level => $state.composableBuilder(
      column: $state.table.level,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get message => $state.composableBuilder(
      column: $state.table.message,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get source => $state.composableBuilder(
      column: $state.table.source,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<int> get tradeTicket => $state.composableBuilder(
      column: $state.table.tradeTicket,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get tradeAction => $state.composableBuilder(
      column: $state.table.tradeAction,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<int> get timestampUs => $state.composableBuilder(
      column: $state.table.timestampUs,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get timeDisplay => $state.composableBuilder(
      column: $state.table.timeDisplay,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));
}

typedef $$CandlesTableTableCreateCompanionBuilder = CandlesTableCompanion
    Function({
  Value<int> id,
  required String symbol,
  required String timeframe,
  required double open,
  required double high,
  required double low,
  required double close,
  required int tickVolume,
  required double bidOpen,
  required double bidHigh,
  required double bidLow,
  required double bidClose,
  required double askOpen,
  required double askHigh,
  required double askLow,
  required double askClose,
  required int openTimeUs,
  Value<bool> isComplete,
  required double bodySize,
  required double upperShadow,
  required double lowerShadow,
  required String candleColor,
});
typedef $$CandlesTableTableUpdateCompanionBuilder = CandlesTableCompanion
    Function({
  Value<int> id,
  Value<String> symbol,
  Value<String> timeframe,
  Value<double> open,
  Value<double> high,
  Value<double> low,
  Value<double> close,
  Value<int> tickVolume,
  Value<double> bidOpen,
  Value<double> bidHigh,
  Value<double> bidLow,
  Value<double> bidClose,
  Value<double> askOpen,
  Value<double> askHigh,
  Value<double> askLow,
  Value<double> askClose,
  Value<int> openTimeUs,
  Value<bool> isComplete,
  Value<double> bodySize,
  Value<double> upperShadow,
  Value<double> lowerShadow,
  Value<String> candleColor,
});

class $$CandlesTableTableTableManager extends RootTableManager<
    _$AppDatabase,
    $CandlesTableTable,
    CandlesTableData,
    $$CandlesTableTableFilterComposer,
    $$CandlesTableTableOrderingComposer,
    $$CandlesTableTableCreateCompanionBuilder,
    $$CandlesTableTableUpdateCompanionBuilder> {
  $$CandlesTableTableTableManager(_$AppDatabase db, $CandlesTableTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          filteringComposer:
              $$CandlesTableTableFilterComposer(ComposerState(db, table)),
          orderingComposer:
              $$CandlesTableTableOrderingComposer(ComposerState(db, table)),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<String> symbol = const Value.absent(),
            Value<String> timeframe = const Value.absent(),
            Value<double> open = const Value.absent(),
            Value<double> high = const Value.absent(),
            Value<double> low = const Value.absent(),
            Value<double> close = const Value.absent(),
            Value<int> tickVolume = const Value.absent(),
            Value<double> bidOpen = const Value.absent(),
            Value<double> bidHigh = const Value.absent(),
            Value<double> bidLow = const Value.absent(),
            Value<double> bidClose = const Value.absent(),
            Value<double> askOpen = const Value.absent(),
            Value<double> askHigh = const Value.absent(),
            Value<double> askLow = const Value.absent(),
            Value<double> askClose = const Value.absent(),
            Value<int> openTimeUs = const Value.absent(),
            Value<bool> isComplete = const Value.absent(),
            Value<double> bodySize = const Value.absent(),
            Value<double> upperShadow = const Value.absent(),
            Value<double> lowerShadow = const Value.absent(),
            Value<String> candleColor = const Value.absent(),
          }) =>
              CandlesTableCompanion(
            id: id,
            symbol: symbol,
            timeframe: timeframe,
            open: open,
            high: high,
            low: low,
            close: close,
            tickVolume: tickVolume,
            bidOpen: bidOpen,
            bidHigh: bidHigh,
            bidLow: bidLow,
            bidClose: bidClose,
            askOpen: askOpen,
            askHigh: askHigh,
            askLow: askLow,
            askClose: askClose,
            openTimeUs: openTimeUs,
            isComplete: isComplete,
            bodySize: bodySize,
            upperShadow: upperShadow,
            lowerShadow: lowerShadow,
            candleColor: candleColor,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required String symbol,
            required String timeframe,
            required double open,
            required double high,
            required double low,
            required double close,
            required int tickVolume,
            required double bidOpen,
            required double bidHigh,
            required double bidLow,
            required double bidClose,
            required double askOpen,
            required double askHigh,
            required double askLow,
            required double askClose,
            required int openTimeUs,
            Value<bool> isComplete = const Value.absent(),
            required double bodySize,
            required double upperShadow,
            required double lowerShadow,
            required String candleColor,
          }) =>
              CandlesTableCompanion.insert(
            id: id,
            symbol: symbol,
            timeframe: timeframe,
            open: open,
            high: high,
            low: low,
            close: close,
            tickVolume: tickVolume,
            bidOpen: bidOpen,
            bidHigh: bidHigh,
            bidLow: bidLow,
            bidClose: bidClose,
            askOpen: askOpen,
            askHigh: askHigh,
            askLow: askLow,
            askClose: askClose,
            openTimeUs: openTimeUs,
            isComplete: isComplete,
            bodySize: bodySize,
            upperShadow: upperShadow,
            lowerShadow: lowerShadow,
            candleColor: candleColor,
          ),
        ));
}

class $$CandlesTableTableFilterComposer
    extends FilterComposer<_$AppDatabase, $CandlesTableTable> {
  $$CandlesTableTableFilterComposer(super.$state);
  ColumnFilters<int> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get symbol => $state.composableBuilder(
      column: $state.table.symbol,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get timeframe => $state.composableBuilder(
      column: $state.table.timeframe,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<double> get open => $state.composableBuilder(
      column: $state.table.open,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<double> get high => $state.composableBuilder(
      column: $state.table.high,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<double> get low => $state.composableBuilder(
      column: $state.table.low,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<double> get close => $state.composableBuilder(
      column: $state.table.close,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<int> get tickVolume => $state.composableBuilder(
      column: $state.table.tickVolume,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<double> get bidOpen => $state.composableBuilder(
      column: $state.table.bidOpen,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<double> get bidHigh => $state.composableBuilder(
      column: $state.table.bidHigh,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<double> get bidLow => $state.composableBuilder(
      column: $state.table.bidLow,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<double> get bidClose => $state.composableBuilder(
      column: $state.table.bidClose,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<double> get askOpen => $state.composableBuilder(
      column: $state.table.askOpen,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<double> get askHigh => $state.composableBuilder(
      column: $state.table.askHigh,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<double> get askLow => $state.composableBuilder(
      column: $state.table.askLow,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<double> get askClose => $state.composableBuilder(
      column: $state.table.askClose,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<int> get openTimeUs => $state.composableBuilder(
      column: $state.table.openTimeUs,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<bool> get isComplete => $state.composableBuilder(
      column: $state.table.isComplete,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<double> get bodySize => $state.composableBuilder(
      column: $state.table.bodySize,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<double> get upperShadow => $state.composableBuilder(
      column: $state.table.upperShadow,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<double> get lowerShadow => $state.composableBuilder(
      column: $state.table.lowerShadow,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get candleColor => $state.composableBuilder(
      column: $state.table.candleColor,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));
}

class $$CandlesTableTableOrderingComposer
    extends OrderingComposer<_$AppDatabase, $CandlesTableTable> {
  $$CandlesTableTableOrderingComposer(super.$state);
  ColumnOrderings<int> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get symbol => $state.composableBuilder(
      column: $state.table.symbol,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get timeframe => $state.composableBuilder(
      column: $state.table.timeframe,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<double> get open => $state.composableBuilder(
      column: $state.table.open,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<double> get high => $state.composableBuilder(
      column: $state.table.high,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<double> get low => $state.composableBuilder(
      column: $state.table.low,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<double> get close => $state.composableBuilder(
      column: $state.table.close,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<int> get tickVolume => $state.composableBuilder(
      column: $state.table.tickVolume,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<double> get bidOpen => $state.composableBuilder(
      column: $state.table.bidOpen,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<double> get bidHigh => $state.composableBuilder(
      column: $state.table.bidHigh,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<double> get bidLow => $state.composableBuilder(
      column: $state.table.bidLow,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<double> get bidClose => $state.composableBuilder(
      column: $state.table.bidClose,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<double> get askOpen => $state.composableBuilder(
      column: $state.table.askOpen,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<double> get askHigh => $state.composableBuilder(
      column: $state.table.askHigh,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<double> get askLow => $state.composableBuilder(
      column: $state.table.askLow,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<double> get askClose => $state.composableBuilder(
      column: $state.table.askClose,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<int> get openTimeUs => $state.composableBuilder(
      column: $state.table.openTimeUs,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<bool> get isComplete => $state.composableBuilder(
      column: $state.table.isComplete,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<double> get bodySize => $state.composableBuilder(
      column: $state.table.bodySize,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<double> get upperShadow => $state.composableBuilder(
      column: $state.table.upperShadow,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<double> get lowerShadow => $state.composableBuilder(
      column: $state.table.lowerShadow,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get candleColor => $state.composableBuilder(
      column: $state.table.candleColor,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));
}

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$TicksTableTableTableManager get ticksTable =>
      $$TicksTableTableTableManager(_db, _db.ticksTable);
  $$SymbolsTableTableTableManager get symbolsTable =>
      $$SymbolsTableTableTableManager(_db, _db.symbolsTable);
  $$PositionsTableTableTableManager get positionsTable =>
      $$PositionsTableTableTableManager(_db, _db.positionsTable);
  $$OrdersTableTableTableManager get ordersTable =>
      $$OrdersTableTableTableManager(_db, _db.ordersTable);
  $$ClosedTradesTableTableTableManager get closedTradesTable =>
      $$ClosedTradesTableTableTableManager(_db, _db.closedTradesTable);
  $$AccountSnapshotsTableTableTableManager get accountSnapshotsTable =>
      $$AccountSnapshotsTableTableTableManager(_db, _db.accountSnapshotsTable);
  $$EaInstancesTableTableTableManager get eaInstancesTable =>
      $$EaInstancesTableTableTableManager(_db, _db.eaInstancesTable);
  $$EaLogsTableTableTableManager get eaLogsTable =>
      $$EaLogsTableTableTableManager(_db, _db.eaLogsTable);
  $$CandlesTableTableTableManager get candlesTable =>
      $$CandlesTableTableTableManager(_db, _db.candlesTable);
}
