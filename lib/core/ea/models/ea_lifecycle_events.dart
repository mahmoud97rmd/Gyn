// Path: lib/core/ea/models/ea_lifecycle_events.dart
enum EaLifecycleEvent {
  initialized,
  started,
  stopped,
  error,
  orderPlaced,
  orderModified,
  orderClosed
}

class EaLifecycleMessage {
  final String eaId;
  final EaLifecycleEvent event;
  final String? details;
  final int timestamp;

  EaLifecycleMessage({
    required this.eaId,
    required this.event,
    this.details,
    required this.timestamp,
  });
}
