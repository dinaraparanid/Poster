import 'package:poster/core/domain/profile/entity/profile.dart';
import 'package:poster/core/presentation/foundation/ui_state.dart';

sealed class FeedEvent {}

final class Refresh extends FeedEvent {}

final class UpdateProfile extends FeedEvent {
  final UiState<Profile> profileState;
  UpdateProfile({required this.profileState});
}

final class Like extends FeedEvent {
  final String postId;
  Like({required this.postId});
}
