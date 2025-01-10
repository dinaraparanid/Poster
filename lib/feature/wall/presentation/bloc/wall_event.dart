import 'package:poster/core/domain/profile/entity/profile.dart';
import 'package:poster/core/presentation/foundation/ui_state.dart';

sealed class WallEvent {}

final class Refresh extends WallEvent {}

final class UpdateProfile extends WallEvent {
  final UiState<Profile> profileState;
  UpdateProfile({required this.profileState});
}

final class Like extends WallEvent {
  final String postId;
  Like({required this.postId});
}
