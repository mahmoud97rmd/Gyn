// Path: lib/core/streaming/stream_health_monitor.dart
import 'dart:async';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../features/quotes/data/datasources/oanda_streaming_service.dart';
import '../../features/quotes/data/models/stream_dto.dart';
import 'package:logger/logger.dart';

class StreamHealthMonitor {
  final OandaStreamingService _streamingService;
  final Logger _logger = Logger();

  Timer? _healthCheckTimer;
  int _lastTickTime = 0;
  bool _isHealthy = false;

  final StreamController<bool> _healthController = StreamController.broadcast();
  Stream<bool> get healthStream => _healthController.stream;

  StreamHealthMonitor(this._streamingService) {
    _streamingService.tickStream.listen((tick) {
      _lastTickTime = DateTime.now().millisecondsSinceEpoch;
      if (!_isHealthy) {
        _isHealthy = true;
        _healthController.add(true);
      }
    });

    _streamingService.connectionState.listen((state) {
      if (state != StreamConnectionState.connected) {
        _isHealthy = false;
        _healthController.add(false);
      }
    });

    _startMonitoring();
  }

  void _startMonitoring() {
    _healthCheckTimer = Timer.periodic(const Duration(seconds: 10), (timer) {
      if (_streamingService.isConnected) {
        final now = DateTime.now().millisecondsSinceEpoch;
        if (now - _lastTickTime > 30000) {
          // No ticks for 30 seconds
          if (_isHealthy) {
            _logger.w('Stream unhealthy: No ticks received in 30 seconds');
            _isHealthy = false;
            _healthController.add(false);
          }
        }
      }
    });
  }

  void dispose() {
    _healthCheckTimer?.cancel();
    _healthController.close();
  }
}

final streamHealthMonitorProvider = Provider<StreamHealthMonitor>((ref) {
  final service = ref.watch(oandaStreamingServiceProvider);
  final monitor = StreamHealthMonitor(service);
  ref.onDispose(() => monitor.dispose());
  return monitor;
});
