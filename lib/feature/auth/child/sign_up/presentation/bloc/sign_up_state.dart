import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:poster/core/utils/extension/bool_ext.dart';
import 'package:poster/feature/auth/domain/error/auth_error.dart';

part 'sign_up_state.freezed.dart';

@freezed
abstract class SignUpState with _$SignUpState {
  const factory SignUpState({
    @Default('') String email,
    @Default('') String username,
    @Default('') String password,
    @Default(true) bool isEmailInputValid,
    @Default(false) bool isPasswordVisible,
    AuthError? error,
  }) = _SignUpState;
}

extension Properties on SignUpState {
  bool get isSignUpEnabled =>
    email.isNotEmpty && username.isNotEmpty && password.isNotEmpty && isEmailInputValid;

  bool get isInvalidEmail => error == AuthError.invalidEmail || isEmailInputValid.not;

  bool get isWrongPassword => error == AuthError.wrongPassword ||
    error == AuthError.invalidCredential;

  bool get isWeakPassword => error == AuthError.weakPassword;

  bool get isNoConnection => error == AuthError.networkRequestFailed;

  bool get isUserNotFoundOrDisabled =>
    error == AuthError.userNotFound || error == AuthError.userDisabled;

  bool get isGeneralError =>
    error == AuthError.tooManyRequests ||
    error == AuthError.userTokenExpired ||
    error == AuthError.unknown;
}
