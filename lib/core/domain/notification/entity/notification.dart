import 'package:freezed_annotation/freezed_annotation.dart';

part 'notification.freezed.dart';
part 'notification.g.dart';

@freezed
abstract class Notification with _$Notification {
  const factory Notification({
    required String title,
    required String description,
    required int timestamp,
    String? imageUrl,
  }) = _Notification;

  factory Notification.fromJson(Map<String, dynamic> json) =>
    _$NotificationFromJson(json);
}
