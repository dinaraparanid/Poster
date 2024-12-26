import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:poster/core/presentation/foundation/ui_state.dart';
import 'package:poster/core/utils/extension/bool_ext.dart';
import 'package:poster/feature/auth/child/sign_in/presentation/bloc/sign_in_effect.dart';
import 'package:poster/feature/auth/child/sign_in/presentation/bloc/sign_in_event.dart';
import 'package:poster/feature/auth/child/sign_in/presentation/bloc/sign_in_state.dart';
import 'package:poster/feature/auth/domain/use_case/login_use_case.dart';

final class SignInBloc extends Bloc<SignInEvent, SignInState> {
  SignInBloc({required LoginUseCase loginUseCase}) : super(const SignInState()) {
    on<LoginChange>(
      (event, emit) => emit(state.copyWith(
        login: event.login,
        signedInUiState: const UiState.initial(),
      ))
    );

    on<PasswordChange>(
      (event, emit) => emit(state.copyWith(
        password: event.password,
        signedInUiState: const UiState.initial(),
      ))
    );

    on<LoginClear>(
      (event, emit) => emit(state.copyWith(
        login: '',
        signedInUiState: const UiState.initial(),
      ))
    );

    on<PasswordVisibilityChange>(
      (event, emit) => emit(state.copyWith(
        isPasswordVisible: state.isPasswordVisible.not,
      ))
    );

    on<SignInClick>(
      (event, emit) => loginUseCase.login(
        username: state.login,
        onSuccess: () => emit(state.copyWith(
          signedInUiState: const UiState.success(),
          effect: SignedIn(),
        )),
        onFailure: () => emit(state.copyWith(signedInUiState: const UiState.error())),
      ),
    );

    on<SignUpClick>(
      (event, emit) => emit(state.copyWith(effect: SignUpClicked())),
    );
  }
}
