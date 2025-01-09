import 'package:hive_ce/hive.dart';
import 'package:poster/core/data/hive/paging/hive_paging.dart';
import 'package:poster/core/domain/notification/entity/notification.dart';
import 'package:poster/core/domain/notification/repository/notification_repository.dart';
import 'package:poster/core/domain/paging/page_data.dart';
import 'package:poster/core/domain/paging/paging_config.dart';
import 'package:rxdart/rxdart.dart';

final class NotificationRepositoryImpl extends NotificationRepository {
  static const _boxNotifications = 'notifications';

  Future<Box<Notification>> get _notificationBox =>
    Hive.openBox<Notification>(_boxNotifications);

  @override
  Future<void> storeNotification(Notification notification) async {
    final notificationBox = await _notificationBox;
    await notificationBox.put(notification.hashCode, notification);
  }

  @override
  Future<void> removeNotification(Notification notification) async {
    final notificationBox = await _notificationBox;
    notificationBox.delete(notification.hashCode);
  }

  @override
  Future<PageData<int, Notification>> notificationsPage({
    int page = PagingConfig.initialPage,
    int perPage = PagingConfig.defaultPageSize,
  }) async {
    final notificationBox = await _notificationBox;
    return notificationBox.pageAt(page: page, perPage: perPage);
  }

  @override
  Future<Stream<bool>> get hasIncomingNotificationsChanges async {
    final notificationBox = await _notificationBox;
    return notificationBox
      .watch()
      .map((_) => notificationBox.length > 0)
      .shareValueSeeded(notificationBox.length > 0)
      .distinct();
  }
}
