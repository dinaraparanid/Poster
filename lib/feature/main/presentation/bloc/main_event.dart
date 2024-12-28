import 'package:poster/feature/main/presentation/bloc/main_state.dart';

sealed class MainEvent {}

final class Create extends MainEvent {}

final class TabClicked extends MainEvent {
  final Tabs tab;
  TabClicked({required this.tab});
}

final class UpdateNewMessageDialogVisibility extends MainEvent {
  final bool isVisible;
  UpdateNewMessageDialogVisibility({required this.isVisible});
}

final class UpdateMessage extends MainEvent {
  final String message;
  UpdateMessage({required this.message});
}

final class SendMessage extends MainEvent {}

final class AnnouncementsClicked extends MainEvent {}
