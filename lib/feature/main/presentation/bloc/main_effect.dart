import 'package:freezed_annotation/freezed_annotation.dart';

part 'main_effect.freezed.dart';

@freezed
sealed class MainEffect with _$MainEffect {
  const factory MainEffect.showNewMessageDialog() = ShowNewMessageDialog;
  const factory MainEffect.showSendMessageFailureSnackbar() = ShowSendMessageFailureSnackbar;
  const factory MainEffect.showSendMessageSuccessSnackbar() = ShowSendMessageSuccessSnackbar;
}
