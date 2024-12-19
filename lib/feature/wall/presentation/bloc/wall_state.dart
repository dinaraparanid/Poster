import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:poster/core/domain/post/entity/post.dart';
import 'package:poster/core/domain/profile/entity/profile.dart';
import 'package:poster/core/presentation/foundation/ui_state.dart';

part 'wall_state.freezed.dart';

@freezed
abstract class WallState with _$WallState {
  const factory WallState({
    required UiState<Profile> profileState,
    // TODO: Paging
    required UiState<List<Post>> postsState,
  }) = _WallState;

  factory WallState.initial() => const WallState(
    profileState: Loading(),
    postsState: Loading(),
  );
}
