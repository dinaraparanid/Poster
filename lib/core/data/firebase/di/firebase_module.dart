import 'package:get_it/get_it.dart';
import 'package:poster/core/data/firebase/fcm/fcm_notification_handler.dart';
import 'package:poster/core/data/firebase/fcm/fcm_token_store.dart';
import 'package:poster/core/di/provide_singleton.dart';

extension FirebaseModule on GetIt {
  List<Type> registerFirebaseModule() => [
    provideSingleton<FCMTokenStore>(() => FCMTokenStore()),
    provideSingleton<FCMNotificationHandler>(() => FCMNotificationHandler(
      notificationRepository: this(),
      tokenStore: this(),
      dio: this(),
    )),
  ];
}
