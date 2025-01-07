import 'dart:async';
import 'package:poster/core/domain/notification/repository/notification_repository.dart';

final class SubscribeOnIncomingAnnouncementsUseCase {
  final NotificationRepository _repository;

  SubscribeOnIncomingAnnouncementsUseCase({
    required NotificationRepository repository
  }) : _repository = repository;

  Future<StreamSubscription<bool>> subscribe({
    required void Function(bool hasIncomingAnnouncements) onChanged,
  }) async {
    final stream = await _repository.hasIncomingNotificationsChanges;
    return stream.listen(onChanged);
  }
}
