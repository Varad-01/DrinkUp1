import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class NotificationsServices {
  final FlutterLocalNotificationsPlugin _flutterLocalNotificationsPlugin =
  FlutterLocalNotificationsPlugin();

  final AndroidInitializationSettings _androidInitializationSettings =
  const AndroidInitializationSettings("notification_icon");

  void initialiseNotificationS() async {
    InitializationSettings initializationSettings =
    InitializationSettings(
      android: _androidInitializationSettings,
    );

    await _flutterLocalNotificationsPlugin.initialize(initializationSettings);
  }

  void sendNotification(String title, String body) async {
    const AndroidNotificationDetails androidNotificationDetails = AndroidNotificationDetails(
      "channelId",
      "channelName",
      importance: Importance.max,
      priority: Priority.high,
      largeIcon: DrawableResourceAndroidBitmap("notification_icon"),
    );

    NotificationDetails notificationDetails = const NotificationDetails(
      android: androidNotificationDetails,
    );

    await _flutterLocalNotificationsPlugin.show(
        0, title, body, notificationDetails);
  }


  void scheduleNotification(String title, String body) async {
    const AndroidNotificationDetails androidNotificationDetails = AndroidNotificationDetails(
      "channelId",
      "channelName",
      importance: Importance.max,
      priority: Priority.high,
      largeIcon: DrawableResourceAndroidBitmap("notification_icon"),
    );

    NotificationDetails notificationDetails = const NotificationDetails(
      android: androidNotificationDetails
    );

    int id = 0;
    await _flutterLocalNotificationsPlugin.periodicallyShow(
      id,
      title,
      body,
      RepeatInterval.everyMinute,
      notificationDetails,
    );
  }

  void stopNotification() async {
    _flutterLocalNotificationsPlugin.cancelAll();
  }
}
