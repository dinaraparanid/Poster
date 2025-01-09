import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:poster/core/presentation/foundation/ui_state.dart';
import 'package:poster/core/domain/profile/entity/profile.dart';

part 'feed_state.freezed.dart';

@freezed
abstract class FeedState with _$FeedState {
  const factory FeedState({
    required UiState<Profile> profileState,
  }) = _FeedState;

  factory FeedState.initial() => const FeedState(
    profileState: Loading(),
  );
}
