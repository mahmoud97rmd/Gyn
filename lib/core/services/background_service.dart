// Path: lib/core/services/background_service.dart
import 'dart:isolate';
import 'package:flutter_foreground_task/flutter_foreground_task.dart';

class BackgroundService {
  static void initForegroundTask() {
    FlutterForegroundTask.init(
      androidNotificationOptions: AndroidNotificationOptions(
        channelId: 'mt5_clone_foreground',
        channelName: 'MT5 Clone Background Service',
        channelDescription: 'Keeps EA engine running in background',
        channelImportance: NotificationChannelImportance.LOW,
        priority: NotificationPriority.LOW,
        iconData: const NotificationIconData(
          resType: ResourceType.mipmap,
          resPrefix: ResourcePrefix.ic,
          name: 'launcher',
        ),
      ),
      iosNotificationOptions: const IOSNotificationOptions(
        showNotification: false,
        playSound: false,
      ),
      foregroundTaskOptions: const ForegroundTaskOptions(
        interval: 5000,
        isOnceEvent: false,
        autoRunOnBoot: true,
        allowWakeLock: true,
        allowWifiLock: true,
      ),
    );
  }

  static Future<bool> startService() async {
    if (await FlutterForegroundTask.isRunningService) {
      return FlutterForegroundTask.restartService();
    } else {
      return FlutterForegroundTask.startService(
        notificationTitle: 'MT5 Clone Active',
        notificationText: 'EA Engine is running',
        callback: startCallback,
      );
    }
  }

  static Future<bool> stopService() async {
    return FlutterForegroundTask.stopService();
  }
}

@pragma('vm:entry-point')
void startCallback() {
  FlutterForegroundTask.setTaskHandler(Mt5TaskHandler());
}

class Mt5TaskHandler extends TaskHandler {
  @override
  Future<void> onStart(DateTime timestamp, SendPort? sendPort) async {
    // Engine runs independently, this just keeps the process alive
  }

  @override
  Future<void> onRepeatEvent(DateTime timestamp, SendPort? sendPort) async {}

  @override
  Future<void> onDestroy(DateTime timestamp, SendPort? sendPort) async {}

  @override
  void onNotificationPressed() {
    FlutterForegroundTask.launchApp();
  }
}
