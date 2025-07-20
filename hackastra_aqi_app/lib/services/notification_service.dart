import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class NotificationService {
  static final FlutterLocalNotificationsPlugin _notificationsPlugin =
      FlutterLocalNotificationsPlugin();

  static Future<void> init() async {
    const AndroidInitializationSettings androidSettings =
        AndroidInitializationSettings('@mipmap/ic_launcher');

    const InitializationSettings initSettings = InitializationSettings(
      android: androidSettings,
    );

    await _notificationsPlugin.initialize(initSettings);
  }

  static Future<void> showAQIWarning(int aqi) async {
    if (aqi > 150) {
      const AndroidNotificationDetails androidDetails =
          AndroidNotificationDetails(
            'aqi_channel',
            'AQI Alerts',
            channelDescription: 'Notifications when AQI is unsafe',
            importance: Importance.max,
            priority: Priority.high,
          );

      const NotificationDetails details = NotificationDetails(
        android: androidDetails,
      );

      await _notificationsPlugin.show(
        0,
        '⚠️ Unhealthy AQI',
        'Air Quality Index is $aqi. Avoid outdoor activities!',
        details,
      );
    }
  }
}
