import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:poster/core/domain/notification/entity/notification.dart';

extension RemoteNotificationMapper on RemoteNotification {
  Notification toEntity() => Notification(
    title: title ?? '',
    description: body ?? '',
    timestamp: DateTime.now().millisecondsSinceEpoch,
    imageUrl: android?.imageUrl ?? apple?.imageUrl ?? web?.image,
  );
}
