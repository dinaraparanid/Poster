import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:poster/core/presentation/foundation/ui_state.dart';
import 'package:poster/feature/auth/child/sign_in/presentation/bloc/sign_in_effect.dart';
import 'package:poster/feature/auth/child/sign_in/presentation/bloc/sign_in_event.dart';
import 'package:poster/feature/auth/child/sign_in/presentation/bloc/sign_in_state.dart';
import 'package:poster/feature/auth/domain/use_case/login_use_case.dart';

final class SignInBloc extends Bloc<SignInEvent, SignInState> {
  SignInBloc({required LoginUseCase loginUseCase}) : super(const SignInState()) {

    on<LoginChanged>(
      (event, emit) => emit(state.copyWith(
        login: event.login,
        signedInUiState: const UiState.initial(),
      ))
    );

    on<PasswordChanged>(
      (event, emit) => emit(state.copyWith(
        password: event.password,
        signedInUiState: const UiState.initial(),
      ))
    );

    on<LoginCleared>(
      (event, emit) => emit(state.copyWith(
        login: '',
        signedInUiState: const UiState.initial(),
      ))
    );

    on<PasswordVisibilityChanged>(
      (event, emit) => emit(state.copyWith(
        isPasswordVisible: !state.isPasswordVisible,
      ))
    );

    on<SignInClicked>(
      (event, emit) => loginUseCase.login(
        username: state.login,
        onSuccess: () => emit(state.copyWith(
          signedInUiState: const UiState.success(),
          effect: const SignInEffect.signedIn(),
        )),
        onFailure: () => emit(state.copyWith(signedInUiState: const UiState.error())),
      ),
    );

    on<SignUpClicked>(
      (event, emit) => emit(state.copyWith(
        effect: const SignInEffect.signedUpClicked(),
      )),
    );
  }
}
