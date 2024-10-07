import 'package:freezed_annotation/freezed_annotation.dart';

part 'effect.freezed.dart';

@freezed
sealed class RootEffect with _$RootEffect {
  const factory RootEffect.none() = None;
  const factory RootEffect.showNewMessageDialog() = ShowNewMessageDialog;
}
