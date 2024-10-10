import 'package:poster/feature/root/component/state.dart';

sealed class RootEvent {}

final class Create extends RootEvent {}

final class TabClicked extends RootEvent {
  final Tabs tab;
  TabClicked({required this.tab});
}

final class UpdateNewMessageDialogVisibility extends RootEvent {
  final bool isVisible;
  UpdateNewMessageDialogVisibility({required this.isVisible});
}

final class UpdateMessage extends RootEvent {
  final String message;
  UpdateMessage({required this.message});
}

final class SendMessage extends RootEvent {}

final class AnnouncementsClicked extends RootEvent {}
