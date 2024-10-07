import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:poster/feature/root/component/effect.dart';

part 'state.freezed.dart';

enum Tabs { wall, feed }

@freezed
abstract class RootState with _$RootState {
  const factory RootState({
    required Tabs selectedTab,
    RootEffect? effect,
    String? message,
  }) = _RootState;
}
