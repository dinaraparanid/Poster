import 'package:freezed_annotation/freezed_annotation.dart';

part 'main_effect.freezed.dart';

@freezed
sealed class MainEffect with _$MainEffect {
  const factory MainEffect.none() = None;
  const factory MainEffect.showNewMessageDialog() = ShowNewMessageDialog;
}
