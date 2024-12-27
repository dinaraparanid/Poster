import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:poster/core/utils/extension/bool_ext.dart';
import 'package:poster/feature/auth/child/sign_up/domain/use_case/sign_up_use_case.dart';
import 'package:poster/feature/auth/child/sign_up/presentation/bloc/sign_up_event.dart';
import 'package:poster/feature/auth/child/sign_up/presentation/bloc/sign_up_result.dart';
import 'package:poster/feature/auth/child/sign_up/presentation/bloc/sign_up_state.dart';
import 'package:poster/feature/auth/domain/use_case/validate_email_use_case.dart';

final class SignUpBloc extends Bloc<SignUpEvent, SignUpState> {
  SignUpBloc({
    required SignUpUseCase signUpUseCase,
    required ValidateEmailUseCase validateEmailUseCase,
    required void Function(SignUpResult result) onBack,
  }) : super(const SignUpState()) {
    on<EmailChange>(
      (event, emit) {
        final isEmailInputValid = event.email.isEmpty ||
          validateEmailUseCase.execute(event.email);

        emit(state.copyWith(
          email: event.email,
          isEmailInputValid: isEmailInputValid,
          error: null,
        ));
      }
    );

    on<UsernameChange>(
      (event, emit) => emit(state.copyWith(
        username: event.username,
        error: null,
      ))
    );

    on<PasswordChange>(
      (event, emit) => emit(state.copyWith(
        password: event.password,
        error: null,
      ))
    );

    on<EmailClear>(
      (event, emit) => emit(state.copyWith(
        email: '',
        isEmailInputValid: true,
        error: null,
      ))
    );

    on<UsernameClear>(
      (event, emit) => emit(state.copyWith(
        username: '',
        error: null,
      ))
    );

    on<PasswordVisibilityChange>(
      (event, emit) => emit(state.copyWith(
        isPasswordVisible: state.isPasswordVisible.not,
      ))
    );

    on<SignUpClick>(
      (event, emit) {
        signUpUseCase.execute(
          email: state.email,
          username: state.username,
          password: state.password,
          onSuccess: () => onBack(const SignUpResult.navigateToMain()),
          onFailure: (e) => emit(state.copyWith(error: e)),
        );
      }
    );

    on<BackClick>((event, emit) => onBack(const SignUpResult.returnToSignIn()));
  }
}
