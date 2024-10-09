import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:poster/domain/auth/profile.dart';
import 'package:poster/domain/auth/repository.dart';
import 'package:poster/feature/auth/component/effect.dart';
import 'package:poster/feature/auth/component/event.dart';
import 'package:poster/feature/auth/component/state.dart';
import 'package:poster/utils/functions/do_nothing.dart';

final class AuthComponent extends Bloc<AuthEvent, AuthState> {
  final AuthRepository repository;

  AuthComponent({required this.repository}) : super(const AuthState(username: '')) {
    on<UsernameChanged>(
      (event, emit) => emit(state.copyWith(username: event.username))
    );

    on<UsernameCleared>(
      (event, emit) => emit(state.copyWith(username: ''))
    );

    on<SignInClicked>(
      (event, emit) async {
        final res = await repository.login(state.username);

        await res.fold(
          (_) async => doNothing(), // TODO: error handling
          (_) async {
            final profile = Profile(username: state.username);
            await repository.updateProfile(profile);
            emit(state.copyWith(effect: const SignedIn()));
          }
        );
      }
    );

    on<NavigatedToSignIn>(
      (event, emit) => emit(state.copyWith(effect: const None())),
    );
  }
}
