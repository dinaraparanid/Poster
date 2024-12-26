import 'package:poster/feature/auth/child/sign_in/presentation/bloc/mod.dart';
import 'package:poster/feature/auth/child/sign_up/presentation/bloc/mod.dart';
import 'package:poster/feature/auth/presentation/bloc/auth_bloc.dart';
import 'package:poster/navigation/app_router.dart';

final class AuthBlocFactory {
  final SignInBlocFactory _signInBlocFactory;
  final SignUpBlocFactory _signUpBlocFactory;
  final AppRouter _router;

  AuthBlocFactory({
    required SignInBlocFactory signInBlocFactory,
    required SignUpBlocFactory signUpBlocFactory,
    required AppRouter router,
  }) : _signInBlocFactory = signInBlocFactory,
    _signUpBlocFactory = signUpBlocFactory,
    _router = router;

  AuthBloc create() => AuthBloc(
    signInBlocFactory: _signInBlocFactory,
    signUpBlocFactory: _signUpBlocFactory,
    router: _router,
  );
}
