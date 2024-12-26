import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:poster/core/presentation/foundation/ui_state.dart';
import 'package:poster/feature/auth/child/sign_up/presentation/bloc/sign_up_effect.dart';

part 'sign_up_state.freezed.dart';

@freezed
abstract class SignUpState with _$SignUpState {
  const factory SignUpState({
    @Default('') String email,
    @Default('') String username,
    @Default('') String password,
    @Default(false) bool isPasswordVisible,
    @Default(UiState.initial()) UiState<void> signedUpUiState,
    SignUpEffect? effect,
  }) = _SignUpState;
}

extension Properties on SignUpState {
  // TODO: валидация емэйла регуляркой

  bool get isSignUpEnabled =>
    email.isNotEmpty && username.isNotEmpty && password.isNotEmpty;
}
