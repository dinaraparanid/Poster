import 'package:poster/core/domain/profile/entity/profile.dart';
import 'package:poster/core/presentation/foundation/ui_state.dart';
import 'package:poster/feature/main/presentation/bloc/main_state.dart';

sealed class MainEvent {}

final class UpdateProfile extends MainEvent {
  final UiState<Profile> profileState;
  UpdateProfile({required this.profileState});
}

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

final class ClearMessage extends MainEvent {}

final class SendMessage extends MainEvent {}

final class AnnouncementsClicked extends MainEvent {}
