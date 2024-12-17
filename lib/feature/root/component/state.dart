import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:poster/core/presentation/foundation/ui_state.dart';
import 'package:poster/core/domain/profile/entity/profile.dart';
import 'package:poster/feature/root/component/effect.dart';

part 'state.freezed.dart';

enum Tabs { wall, feed }

@freezed
abstract class RootState with _$RootState {
  const factory RootState({
    required UiState<Profile> profileState,
    required Tabs selectedTab,
    RootEffect? effect,
    String? message,
    required bool hasIncomingAnnouncements,
  }) = _RootState;

  factory RootState.initial() => const RootState(
    profileState: Initial(),
    selectedTab: Tabs.wall,
    hasIncomingAnnouncements: false,
  );
}
