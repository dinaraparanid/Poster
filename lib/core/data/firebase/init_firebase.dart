import 'package:firebase_core/firebase_core.dart';
import 'package:poster/core/data/firebase/fcm/fcm_notification_handler.dart';
import 'package:poster/core/data/firebase/firebase_options.dart';
import 'package:poster/di/app_module.dart';

Future<void> initFirebase() async {
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  di<FCMNotificationHandler>().setupNotifications();
}
