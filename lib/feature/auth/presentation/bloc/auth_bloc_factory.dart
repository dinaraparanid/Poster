import 'package:poster/feature/auth/child/sign_in/presentation/bloc/mod.dart';
import 'package:poster/feature/auth/child/sign_up/presentation/bloc/mod.dart';
import 'package:poster/feature/auth/presentation/bloc/auth_bloc.dart';

final class AuthBlocFactory {
  final SignInBlocFactory _signInBlocFactory;
  final SignUpBlocFactory _signUpBlocFactory;

  AuthBlocFactory({
    required SignInBlocFactory signInBlocFactory,
    required SignUpBlocFactory signUpBlocFactory,
  }) : _signInBlocFactory = signInBlocFactory,
    _signUpBlocFactory = signUpBlocFactory;

  AuthBloc create() => AuthBloc(
    signInBlocFactory: _signInBlocFactory,
    signUpBlocFactory: _signUpBlocFactory,
  );
}
