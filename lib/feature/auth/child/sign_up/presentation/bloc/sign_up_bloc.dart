import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:poster/core/presentation/foundation/ui_state.dart';
import 'package:poster/core/utils/extension/bool_ext.dart';
import 'package:poster/feature/auth/child/sign_up/presentation/bloc/sign_up_event.dart';
import 'package:poster/feature/auth/child/sign_up/presentation/bloc/sign_up_result.dart';
import 'package:poster/feature/auth/child/sign_up/presentation/bloc/sign_up_state.dart';

final class SignUpBloc extends Bloc<SignUpEvent, SignUpState> {
  final void Function(SignUpResult result) onBack;

  SignUpBloc({required this.onBack}) : super(const SignUpState()) {
    on<EmailChange>(
      (event, emit) => emit(state.copyWith(
        email: event.email,
        signedUpUiState: const UiState.initial(),
      ))
    );

    on<UsernameChange>(
      (event, emit) => emit(state.copyWith(
        username: event.username,
        signedUpUiState: const UiState.initial(),
      ))
    );

    on<PasswordChange>(
      (event, emit) => emit(state.copyWith(
        password: event.password,
        signedUpUiState: const UiState.initial(),
      ))
    );

    on<EmailClear>(
      (event, emit) => emit(state.copyWith(
        email: '',
        signedUpUiState: const UiState.initial(),
      ))
    );

    on<UsernameClear>(
      (event, emit) => emit(state.copyWith(
        username: '',
        signedUpUiState: const UiState.initial(),
      ))
    );

    on<PasswordVisibilityChange>(
      (event, emit) => emit(state.copyWith(
        isPasswordVisible: state.isPasswordVisible.not,
      ))
    );

    on<SignUpClick>(
      (event, emit) {
        // TODO: sign up use case
        onBack(const SignUpResult.navigateToMain());
      }
    );

    on<BackClick>(
      (event, emit) => onBack(const SignUpResult.returnToSignIn()),
    );
  }
}
