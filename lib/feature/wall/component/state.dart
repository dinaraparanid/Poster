import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:poster/core/ui/foundation/ui_state.dart';
import 'package:poster/domain/auth/profile.dart';
import 'package:poster/domain/post/post.dart';

part 'state.freezed.dart';

@freezed
abstract class WallState with _$WallState {
  const factory WallState({
    required UiState<Profile> profileState,
    // TODO: Paging
    required List<Post> posts,
  }) = _WallState;

  factory WallState.initial() => const WallState(
    profileState: Loading(),
    posts: [],
  );
}
