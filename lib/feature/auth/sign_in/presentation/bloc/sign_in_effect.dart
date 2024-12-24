import 'package:freezed_annotation/freezed_annotation.dart';

part 'sign_in_effect.freezed.dart';

@freezed
sealed class SignInEffect {
  const factory SignInEffect.navigateToSignUp() = NavigateToSignUp;
}
