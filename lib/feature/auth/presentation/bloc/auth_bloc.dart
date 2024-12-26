import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:poster/feature/auth/child/sign_in/presentation/bloc/mod.dart';
import 'package:poster/feature/auth/child/sign_up/presentation/bloc/mod.dart';
import 'package:poster/feature/auth/presentation/bloc/auth_event.dart';
import 'package:poster/feature/auth/presentation/bloc/auth_state.dart';
import 'package:poster/feature/auth/child/sign_in/presentation/bloc/sign_in_result.dart' as sign_in_result;
import 'package:poster/feature/auth/child/sign_up/presentation/bloc/sign_up_result.dart' as sign_up_result;
import 'package:poster/navigation/app_route.dart';
import 'package:poster/navigation/app_router.dart';

final class AuthBloc extends Bloc<AuthEvent, void> {
  final SignInBlocFactory _signInBlocFactory;
  final SignUpBlocFactory _signUpBlocFactory;
  final AppRouter _router;

  AuthBloc({
    required SignInBlocFactory signInBlocFactory,
    required SignUpBlocFactory signUpBlocFactory,
    required AppRouter router,
  }) : _signInBlocFactory = signInBlocFactory,
    _signUpBlocFactory = signUpBlocFactory,
    _router = router,
    super(const AuthState()) {

    on<ShowSignIn>(
      (event, emit) => _router.router.replaceNamed(
        AppRoute.signIn.name,
        extra: createSignInBloc(),
      ),
    );

    on<ShowSignUp>(
      (event, emit) => _router.router.replaceNamed(
        AppRoute.signUp.name,
        extra: createSignUpBloc(),
      ),
    );

    add(ShowSignIn());
  }

  SignInBloc createSignInBloc() => _signInBlocFactory.create(
    onBack: (result) => switch (result) {
      sign_in_result.NavigateToMain() => navigateToMain(),
      sign_in_result.NavigateToSignUp() => add(ShowSignUp()),
    }
  );

  SignUpBloc createSignUpBloc() => _signUpBlocFactory.create(
    onBack: (result) => switch (result) {
      sign_up_result.NavigateToMain() => navigateToMain(),
      sign_up_result.ReturnToSignIn() => add(ShowSignIn()),
    }
  );

  void navigateToMain() {
    // TODO: navigate to RootScreen
  }
}
