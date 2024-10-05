import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:poster/feature/auth/component/event.dart';
import 'package:poster/feature/auth/component/state.dart';

final class AuthComponent extends Bloc<AuthEvent, AuthState> {
  AuthComponent() : super(const AuthState(username: '')) {
    on<UsernameChanged>(
      (event, emit) => emit(state.copyWith(username: event.username))
    );

    on<SignInClicked>(
      (event, emit) {
        // TODO: move to next screen
      }
    );
  }
}
