import 'package:get_it/get_it.dart';
import 'package:poster/core/data/notification/notification_repository_impl.dart';
import 'package:poster/core/di/provide_singleton.dart';
import 'package:poster/core/domain/notification/repository/notification_repository.dart';

extension NotificationModule on GetIt {
  List<Type> registerNotificationModule() => [
    provideSingleton<NotificationRepository>(() => NotificationRepositoryImpl()),
  ];
}
