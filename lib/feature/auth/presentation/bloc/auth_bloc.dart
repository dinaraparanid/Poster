import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:poster/feature/auth/domain/use_case/login_use_case.dart';
import 'package:poster/feature/auth/presentation/bloc/auth_effect.dart';
import 'package:poster/feature/auth/presentation/bloc/auth_event.dart';
import 'package:poster/feature/auth/presentation/bloc/auth_state.dart';
import 'package:poster/core/utils/functions/do_nothing.dart';

final class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc({required LoginUseCase loginUseCase}) : super(const AuthState()) {

    on<UsernameChanged>(
      (event, emit) => emit(state.copyWith(username: event.username))
    );

    on<UsernameCleared>(
      (event, emit) => emit(state.copyWith(username: ''))
    );

    on<SignInClicked>(
      (event, emit) => loginUseCase.login(
        username: state.username,
        onSuccess: () => emit(state.copyWith(effect: const SignedIn())),
        onFailure: doNothing, // TODO: error handling
      ),
    );

    on<NavigatedToSignIn>(
      (event, emit) => emit(state.copyWith(effect: const None())),
    );
  }
}
