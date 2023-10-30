import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:push_notification_app/api/firebase_api.dart';
import 'package:push_notification_app/firebase_options.dart';
import 'package:push_notification_app/pages/homepage.dart';
import 'package:push_notification_app/pages/notification_page.dart';

final navigatorKey = GlobalKey<NavigatorState>();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await FirebaseApi().initNotifications();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Push notification app',
      navigatorKey: navigatorKey,
      initialRoute: '/homePage',
      routes: {
        '/homePage': (context) => const HomePage(),
        '/notifocationPage': (context) => const NotificationPage()
      },
    );
  }
}
