import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:push_notification_app/main.dart';

class FirebaseApi {
  // create an instance of firebase messaging
  final _firebaseMessaging = FirebaseMessaging.instance;

  // function to initialize notifications
  Future<void> initNotifications() async {
    // request permission from user (will promt user)
    await _firebaseMessaging.requestPermission();

    // fetch the FCM token for the device
    final FCMtoken = await _firebaseMessaging.getToken();
    //print the token (normally you would send it to your server )
    print('FCM Token : $FCMtoken');

    //initialize further settings for push notification
    initPushNotifications();
  }

  //function to handle recieved messages
  void handleMessage(RemoteMessage? message) {
    //if massage is null do nothing
    if (message == null) {
      return;
    }
    // navigate to new screen when message is recieved and user taps notification
    navigatorKey.currentState
        ?.pushNamed('/notificationPage', arguments: [message]);
  }

  //functions to initialized background settings
  Future initPushNotifications() async {
    //handle notifications if the app is terminated and now opened
    FirebaseMessaging.instance.getInitialMessage().then(handleMessage);

    //attach event listeners for when a notification opens the app
    FirebaseMessaging.onMessageOpenedApp.listen(handleMessage);
  }
}
