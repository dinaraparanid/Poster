import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:poster/core/domain/profile/entity/profile.dart';
import 'package:poster/core/presentation/foundation/ui_state.dart';
import 'package:poster/core/utils/extension/string_ext.dart';
import 'package:poster/feature/main/presentation/bloc/main_effect.dart';

part 'main_state.freezed.dart';

enum Tabs { wall, feed }

@freezed
abstract class MainState with _$MainState {
  const factory MainState({
    @Default(Initial()) UiState<Profile> profileState,
    @Default(Tabs.wall) Tabs selectedTab,
    @Default(false) bool hasIncomingAnnouncements,
    MainEffect? effect,
    String? message,
  }) = _MainState;
}

extension Properties on MainState {
  bool get isSendEnabled => message?.isNotBlank == true;
}
