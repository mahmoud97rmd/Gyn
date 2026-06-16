// Path: lib/core/ea/engine/python_bridge.dart
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logger/logger.dart';
import 'dart:convert';

class PythonBridge {
  static const MethodChannel _channel = MethodChannel('com.mt5clone.chaquopy');
  final Logger _logger = Logger();

  Future<void> initialize() async {
    try {
      await _channel.invokeMethod('initialize');
    } catch (e) {
      _logger.e('Failed to initialize Python Bridge: $e');
    }
  }

  Future<bool> loadScript(
      String eaId, String scriptPath, Map<String, dynamic> config) async {
    try {
      final result = await _channel.invokeMethod('loadScript', {
        'eaId': eaId,
        'scriptPath': scriptPath,
        'config': jsonEncode(config),
      });
      return result == true;
    } catch (e) {
      _logger.e('Failed to load EA script $eaId: $e');
      return false;
    }
  }

  Future<bool> startEa(String eaId) async {
    try {
      final result = await _channel.invokeMethod('startEa', {'eaId': eaId});
      return result == true;
    } catch (e) {
      _logger.e('Failed to start EA $eaId: $e');
      return false;
    }
  }

  Future<bool> stopEa(String eaId) async {
    try {
      final result = await _channel.invokeMethod('stopEa', {'eaId': eaId});
      return result == true;
    } catch (e) {
      _logger.e('Failed to stop EA $eaId: $e');
      return false;
    }
  }

  Future<void> sendTick(
      String eaId, double bid, double ask, int timestamp) async {
    try {
      await _channel.invokeMethod('onTick', {
        'eaId': eaId,
        'bid': bid,
        'ask': ask,
        'timestamp': timestamp,
      });
    } catch (e) {
      _logger.w('Failed to send tick to EA $eaId: $e');
    }
  }

  Future<void> sendCandle(String eaId, double open, double high, double low,
      double close, int volume, int timestamp) async {
    try {
      await _channel.invokeMethod('onCandle', {
        'eaId': eaId,
        'open': open,
        'high': high,
        'low': low,
        'close': close,
        'volume': volume,
        'timestamp': timestamp,
      });
    } catch (e) {
      _logger.w('Failed to send candle to EA $eaId: $e');
    }
  }

  void setMethodCallHandler(
      Future<dynamic> Function(MethodCall call)? handler) {
    _channel.setMethodCallHandler(handler);
  }
}

final pythonBridgeProvider = Provider<PythonBridge>((ref) {
  return PythonBridge();
});
