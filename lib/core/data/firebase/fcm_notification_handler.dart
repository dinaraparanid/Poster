import 'dart:convert';
import 'package:cloudinary/cloudinary.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:poster/core/data/env/env.dart';
import 'package:poster/core/data/firebase/fcm_token_store.dart';
import 'package:poster/core/utils/extension/bool_ext.dart';
import 'package:poster/core/utils/functions/let.dart';
import 'package:universal_platform/universal_platform.dart';

@pragma('vm:entry-point')
Future<void> _handleBackgroundMessage(RemoteMessage message) async {
  // TODO: handle message if necessary
}

final class FCMNotificationHandler {
  static const _androidChannelId = 'poster_notifications';
  static const _androidChannelName = 'Poster Notifications';

  final FCMTokenStore _tokenStore;
  final Dio _dio;

  late final _messaging = FirebaseMessaging.instance;

  late final _androidChannel = const AndroidNotificationChannel(
    _androidChannelId,
    _androidChannelName,
  );

  late final _localNotifications = FlutterLocalNotificationsPlugin();

  FCMNotificationHandler({
    required FCMTokenStore tokenStore,
    required Dio dio,
  }) : _tokenStore = tokenStore, _dio = dio;

  Future<void> setupNotifications() async {
    // TODO: APNs are paid for iOS / MacOS
    if (UniversalPlatform.isIOS.not && UniversalPlatform.isMacOS.not) {
      await _messaging.requestPermission(provisional: true);
    }
    // final apnsToken = await FirebaseMessaging.instance.getAPNSToken();

    final fcmToken = await _messaging.getToken(vapidKey: Env.fcmWebVapidKey);
    if (fcmToken != null) await _tokenStore.storeToken(fcmToken);

    await setupPushNotifications();
    await setupLocalNotifications();
  }

  Future<void> setupPushNotifications() async {
    await _messaging.setForegroundNotificationPresentationOptions(
      alert: true,
      badge: true,
      sound: true,
    );

    _messaging.getInitialMessage().then(handleMessage);
    FirebaseMessaging.onMessageOpenedApp.listen(handleMessage);
    FirebaseMessaging.onBackgroundMessage(_handleBackgroundMessage);

    FirebaseMessaging.onMessage.listen((msg) async {
      final notification = msg.notification;
      if (notification == null) return;

      _localNotifications.show(
        notification.hashCode,
        notification.title,
        notification.body,
        NotificationDetails(
          android: await fetchAndroidNotificationDetails(notification: notification),
        ),
        payload: jsonEncode(msg.toMap()),
      );
    });
  }

  Future<void> setupLocalNotifications() async {
    const android = AndroidInitializationSettings('@mipmap/ic_launcher');
    const apple = DarwinInitializationSettings();
    const settings = InitializationSettings(android: android, iOS: apple, macOS: apple);

    await _localNotifications.initialize(
      settings,
      onDidReceiveNotificationResponse: (response) {
        final message = RemoteMessage.fromMap(jsonDecode(response.payload!));
        handleMessage(message);
      }
    );

    _localNotifications
      .resolvePlatformSpecificImplementation<AndroidFlutterLocalNotificationsPlugin>()
      ?.createNotificationChannel(_androidChannel);
  }

  Future<void> handleMessage(RemoteMessage? message) async {
    // TODO: handle message if necessary
  }

  Future<AndroidNotificationDetails> fetchAndroidNotificationDetails({
    required RemoteNotification notification
  }) async {
    final androidBigImage = await notification.android
      ?.imageUrl
      ?.let((url) => _dio.get<List<int>>(url,
        options: Options(responseType: ResponseType.bytes)
      ))
      .then((response) => response.data?.let((bs) =>
        ByteArrayAndroidBitmap.fromBase64String(base64Encode(bs))
      ));

    final androidStyle = androidBigImage == null ? null : BigPictureStyleInformation(
      androidBigImage,
      largeIcon: androidBigImage,
      hideExpandedLargeIcon: true,
    );

    return AndroidNotificationDetails(
      _androidChannelId,
      _androidChannelName,
      largeIcon: androidBigImage,
      styleInformation: androidStyle,
    );
  }
}
