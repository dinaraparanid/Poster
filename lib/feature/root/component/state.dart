import 'package:freezed_annotation/freezed_annotation.dart';

part 'state.freezed.dart';

enum Tabs { wall, feed }

@freezed
abstract class RootState with _$RootState {
  const factory RootState({
    required Tabs selectedTab,
  }) = _RootState;
}
