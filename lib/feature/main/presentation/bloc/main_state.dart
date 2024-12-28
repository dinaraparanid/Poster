import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:poster/core/domain/profile/entity/profile.dart';
import 'package:poster/core/presentation/foundation/ui_state.dart';
import 'package:poster/feature/main/presentation/bloc/main_effect.dart';

part 'main_state.freezed.dart';

enum Tabs { wall, feed }

@freezed
abstract class MainState with _$MainState {
  const factory MainState({
    required UiState<Profile> profileState,
    required Tabs selectedTab,
    required bool hasIncomingAnnouncements,
    MainEffect? effect,
    String? message,
  }) = _MainState;

  factory MainState.initial() => const MainState(
    profileState: Initial(),
    selectedTab: Tabs.wall,
    hasIncomingAnnouncements: false,
  );
}

extension Properties on MainState {
  bool get isSendEnabled => message?.isNotEmpty == true;
}
