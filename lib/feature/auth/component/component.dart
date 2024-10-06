import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:poster/feature/auth/component/effect.dart';
import 'package:poster/feature/auth/component/event.dart';
import 'package:poster/feature/auth/component/state.dart';

final class AuthComponent extends Bloc<AuthEvent, AuthState> {
  AuthComponent() : super(const AuthState(username: '')) {
    on<UsernameChanged>(
      (event, emit) => emit(state.copyWith(username: event.username))
    );

    on<UsernameCleared>(
      (event, emit) => emit(state.copyWith(username: ''))
    );

    on<SignInClicked>(
      (event, emit) {
        // TODO: make request and check status
        emit(state.copyWith(effect: const SignedIn()));
      }
    );
  }
}
