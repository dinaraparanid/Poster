import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:poster/core/presentation/foundation/ui_state.dart';
import 'package:poster/feature/auth/sign_in/presentation/bloc/mod.dart';

part 'sign_in_state.freezed.dart';

@freezed
abstract class SignInState with _$SignInState {
  const factory SignInState({
    @Default('') String login,
    @Default('') String password,
    @Default(false) bool isPasswordVisible,
    @Default(UiState.initial()) UiState<void> signedInUiState,
    SignInEffect? effect,
  }) = _SignInState;
}

extension Properties on SignInState {
  bool get isSignInEnabled => login.isNotEmpty && password.isNotEmpty;
}
