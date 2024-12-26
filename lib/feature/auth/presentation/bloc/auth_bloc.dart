import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:poster/feature/auth/child/sign_in/presentation/bloc/mod.dart';
import 'package:poster/feature/auth/child/sign_up/presentation/bloc/mod.dart';
import 'package:poster/feature/auth/presentation/bloc/auth_child.dart';
import 'package:poster/feature/auth/presentation/bloc/auth_event.dart';
import 'package:poster/feature/auth/presentation/bloc/auth_state.dart';

final class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final SignInBlocFactory _signInBlocFactory;
  final SignUpBlocFactory _signUpBlocFactory;

  AuthBloc({
    required SignInBlocFactory signInBlocFactory,
    required SignUpBlocFactory signUpBlocFactory,
  }) : _signInBlocFactory = signInBlocFactory,
    _signUpBlocFactory = signUpBlocFactory,
    super(const AuthState()) {

    on<ShowSignIn>((event, emit) => emit(state.copyWith(child: const AuthChild.signIn())));
    on<ShowSignUp>((event, emit) => emit(state.copyWith(child: const AuthChild.signUp())));
  }

  SignInBloc createSignInBloc() => _signInBlocFactory.create();
  SignUpBloc createSignUpBloc() => _signUpBlocFactory.create();
}
