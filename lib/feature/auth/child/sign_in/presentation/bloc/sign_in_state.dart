import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:poster/core/utils/extension/bool_ext.dart';
import 'package:poster/feature/auth/domain/error/auth_error.dart';

part 'sign_in_state.freezed.dart';

@freezed
abstract class SignInState with _$SignInState {
  const factory SignInState({
    @Default('') String email,
    @Default('') String password,
    @Default(true) bool isEmailInputValid,
    @Default(false) bool isPasswordVisible,
    AuthError? error,
  }) = _SignInState;
}

extension Properties on SignInState {
  bool get isSignInEnabled => email.isNotEmpty && isEmailInputValid && password.isNotEmpty;

  bool get isInvalidEmail => error == AuthError.invalidEmail || isEmailInputValid.not;

  bool get isWrongPassword => error == AuthError.wrongPassword ||
    error == AuthError.invalidCredential;

  bool get isWeakPassword => error == AuthError.weakPassword;

  bool get isNoConnection => error == AuthError.networkRequestFailed;

  bool get isUserNotFoundOrDisabled =>
    error == AuthError.userNotFound || error == AuthError.userDisabled;

  bool get isGeneralError => error == AuthError.tooManyRequests ||
    error == AuthError.userTokenExpired || error == AuthError.unknown;
}
