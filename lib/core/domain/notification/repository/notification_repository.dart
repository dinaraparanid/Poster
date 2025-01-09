import 'package:poster/core/domain/notification/entity/notification.dart';
import 'package:poster/core/domain/paging/page_data.dart';
import 'package:poster/core/domain/paging/paging_config.dart';

abstract class NotificationRepository {
  Future<void> storeNotification(Notification notification);

  Future<void> removeNotification(Notification notification);

  Future<PageData<int, Notification>> notificationsPage({
    int page = PagingConfig.initialPage,
    int perPage = PagingConfig.defaultPageSize,
  });

  Future<Stream<bool>> get hasIncomingNotificationsChanges;
}
