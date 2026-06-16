// Path: lib/core/database/tables/candles_table.dart
import 'package:drift/drift.dart';

@TableIndex(
    name: 'candle_symbol_tf_time', columns: {#symbol, #timeframe, #openTimeUs})
class CandlesTable extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get symbol => text()();
  TextColumn get timeframe => text()();
  RealColumn get open => real()();
  RealColumn get high => real()();
  RealColumn get low => real()();
  RealColumn get close => real()();
  IntColumn get tickVolume => integer()();
  RealColumn get bidOpen => real()();
  RealColumn get bidHigh => real()();
  RealColumn get bidLow => real()();
  RealColumn get bidClose => real()();
  RealColumn get askOpen => real()();
  RealColumn get askHigh => real()();
  RealColumn get askLow => real()();
  RealColumn get askClose => real()();
  IntColumn get openTimeUs => integer()();
  BoolColumn get isComplete => boolean().withDefault(const Constant(false))();
  RealColumn get bodySize => real()();
  RealColumn get upperShadow => real()();
  RealColumn get lowerShadow => real()();
  TextColumn get candleColor => text()();

  @override
  List<Set<Column>> get customUniqueKeys => [
        {symbol, timeframe, openTimeUs}
      ];
}
