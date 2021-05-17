import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  var initializationSettingsAndroid =
      AndroidInitializationSettings('codex_logo');
  var initializationSettingsIOS = IOSInitializationSettings();
  var initializationSettings = InitializationSettings(
    android: initializationSettingsAndroid,
    iOS: initializationSettingsIOS,
  );
  await flutterLocalNotificationsPlugin.initialize(initializationSettings);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.notifications),
          onPressed: () {
            schedule();
          },
        ),
        body: Center(
          child: Text("Local Notification"),
        ),
      ),
    );
  }
}

void schedule() async {
  var androidDetails = new AndroidNotificationDetails(
    "channelId",
    "Local Notification",
    "This is description",
    importance: Importance.high,
    priority: Priority.high,
    playSound: true,
  );
  var iosDetails = new IOSNotificationDetails();
  var generalNotificationDetails = new NotificationDetails(
    android: androidDetails,
    iOS: iosDetails,
  );
  await flutterLocalNotificationsPlugin.show(
    0,
    "Test",
    "Test Juga",
    generalNotificationDetails,
  );
}
