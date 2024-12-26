import 'package:freezed_annotation/freezed_annotation.dart';

part 'sign_up_result.freezed.dart';

@freezed
sealed class SignUpResult {
  const factory SignUpResult.navigateToMain() = NavigateToMain;
  const factory SignUpResult.returnToSignIn() = ReturnToSignIn;
}