import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:poster/core/utils/extension/bool_ext.dart';
import 'package:poster/feature/auth/child/sign_in/presentation/bloc/sign_in_event.dart';
import 'package:poster/feature/auth/child/sign_in/presentation/bloc/sign_in_result.dart';
import 'package:poster/feature/auth/child/sign_in/presentation/bloc/sign_in_state.dart';
import 'package:poster/feature/auth/child/sign_in/domain/use_case/sign_in_use_case.dart';
import 'package:poster/feature/auth/domain/use_case/validate_email_use_case.dart';

final class SignInBloc extends Bloc<SignInEvent, SignInState> {
  SignInBloc({
    required SignInUseCase loginUseCase,
    required ValidateEmailUseCase validateEmailUseCase,
    required void Function(SignInResult) onBack,
  }) : super(const SignInState()) {
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

    on<PasswordVisibilityChange>(
      (event, emit) => emit(state.copyWith(
        isPasswordVisible: state.isPasswordVisible.not,
      ))
    );

    on<SignInClick>(
      (event, emit) => loginUseCase.execute(
        email: state.email,
        password: state.password,
        onSuccess: () => add(ShowMain()),
        onFailure: (e) => emit(state.copyWith(error: e)),
      ),
    );

    on<SignUpClick>(
      (event, emit) => onBack(const SignInResult.navigateToSignUp()),
    );

    on<ShowMain>(
      (event, emit) => onBack(const SignInResult.navigateToMain()),
    );
  }
}
