// Path: lib/core/database/hive_cache_service.dart
import 'package:hive_flutter/hive_flutter.dart';
import 'dart:convert';

class HiveCacheService {
  static const String _ticksBox = 'ticks_cache';
  static const String _settingsBox = 'settings_cache';
  static const String _accountBox = 'account_cache';
  static const String _eaBox = 'ea_cache';

  Future<void> initialize() async {
    await Hive.initFlutter();
    await Hive.openBox<String>(_ticksBox);
    await Hive.openBox<dynamic>(_settingsBox);
    await Hive.openBox<String>(_accountBox);
    await Hive.openBox<String>(_eaBox);
  }

  void cacheLatestTick(String symbol, double bid, double ask, int timestampUs) {
    final box = Hive.box<String>(_ticksBox);
    final data =
        jsonEncode({'bid': bid, 'ask': ask, 'timestampUs': timestampUs});
    box.put(symbol, data);
  }

  Map<String, dynamic>? getLatestTick(String symbol) {
    final box = Hive.box<String>(_ticksBox);
    final data = box.get(symbol);
    if (data != null) return jsonDecode(data);
    return null;
  }

  double? getLatestBid(String symbol) =>
      getLatestTick(symbol)?['bid'] as double?;
  double? getLatestAsk(String symbol) =>
      getLatestTick(symbol)?['ask'] as double?;

  Map<String, Map<String, dynamic>> getAllLatestTicks() {
    final box = Hive.box<String>(_ticksBox);
    final result = <String, Map<String, dynamic>>{};
    for (final key in box.keys) {
      final data = box.get(key);
      if (data != null) {
        result[key as String] = jsonDecode(data);
      }
    }
    return result;
  }

  void setSetting(String key, dynamic value) =>
      Hive.box<dynamic>(_settingsBox).put(key, value);
  dynamic getSetting(String key, {dynamic defaultValue}) =>
      Hive.box<dynamic>(_settingsBox).get(key, defaultValue: defaultValue);

  void cacheAccountState(Map<String, dynamic> state) =>
      Hive.box<String>(_accountBox).put('state', jsonEncode(state));
  Map<String, dynamic>? getCachedAccountState() {
    final data = Hive.box<String>(_accountBox).get('state');
    return data != null ? jsonDecode(data) : null;
  }

  void cacheEaState(int eaId, Map<String, dynamic> state) =>
      Hive.box<String>(_eaBox).put(eaId.toString(), jsonEncode(state));
  Map<String, dynamic>? getEaState(int eaId) {
    final data = Hive.box<String>(_eaBox).get(eaId.toString());
    return data != null ? jsonDecode(data) : null;
  }

  void clearEaState(int eaId) =>
      Hive.box<String>(_eaBox).delete(eaId.toString());
}
