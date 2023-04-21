import 'package:flutter_local_notifications/flutter_local_notifications.dart';

final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();

Future<void> initNotifications() async {
  const AndroidInitializationSettings initializationSettingsAndroid =
      AndroidInitializationSettings('icono_notificacion');

  // const DarwinInitializationSettings initializationSettingsIOS =
  //     DarwinInitializationSettings();

  const InitializationSettings initializationSettings =
      InitializationSettings(android: initializationSettingsAndroid
          // iOS: initializationSettingsIOS,
          );
  await flutterLocalNotificationsPlugin.initialize(initializationSettings);
}

Future<void> mostrarNotificacion(String mensaje) async {
  // final String mensaje;
  const AndroidNotificationDetails androidNotificationDetails =
      AndroidNotificationDetails('your_channel_id', 'your_channel_ame',
          importance: Importance.max, priority: Priority.high);

  const NotificationDetails notificationDetails = NotificationDetails(
    android: androidNotificationDetails,
  );

  await flutterLocalNotificationsPlugin.show(
      1, 'Treecko Movil', mensaje, notificationDetails);
}
