import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:poster/core/ui/foundation/ui_state.dart';
import 'package:poster/domain/post/post.dart';

part 'state.freezed.dart';

@freezed
abstract class FeedState with _$FeedState {
  const factory FeedState({
    // TODO: Paging
    required UiState<List<Post>> postsState,
  }) = _FeedState;

  factory FeedState.initial() => const FeedState(postsState: Loading());
}
