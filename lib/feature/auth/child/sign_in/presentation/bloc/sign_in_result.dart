import 'package:freezed_annotation/freezed_annotation.dart';

part 'sign_in_result.freezed.dart';

@freezed
sealed class SignInResult {
  const factory SignInResult.navigateToMain() = NavigateToMain;
  const factory SignInResult.navigateToSignUp() = NavigateToSignUp;
}
