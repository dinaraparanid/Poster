import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:poster/feature/auth/child/sign_in/presentation/bloc/sign_in_result.dart' as sign_in_result;
import 'package:poster/feature/auth/child/sign_in/presentation/sign_in_screen.dart';
import 'package:poster/feature/auth/child/sign_up/presentation/bloc/sign_up_result.dart' as sign_up_result;
import 'package:poster/feature/auth/child/sign_up/presentation/sign_up_screen.dart';
import 'package:poster/feature/auth/presentation/bloc/mod.dart';
import 'package:poster/feature/root/presentation/root_screen.dart';

final class AuthScreen extends StatelessWidget {
  final AuthBloc bloc;

  const AuthScreen({super.key, required this.bloc});

  @override
  Widget build(BuildContext context) => BlocProvider(
    create: (_) => bloc,
    child: BlocBuilder<AuthBloc, AuthState>(
      builder: (context, state) => switch (state.child) {
        SignIn() => buildSignInScreen(context),
        SignUp() => buildSignUpScreen(context),
      },
    ),
  );

  Widget buildSignInScreen(BuildContext context) => SignInScreen(
    bloc: bloc.createSignInBloc(),
    onBack: (result) => switch (result) {
      sign_in_result.NavigateToMain() => navigateToMain(context),
      sign_in_result.NavigateToSignUp() => bloc.add(ShowSignUp()),
    }
  );

  Widget buildSignUpScreen(BuildContext context) => SignUpScreen(
    bloc: bloc.createSignUpBloc(),
    onBack: (result) => switch (result) {
      sign_up_result.NavigateToMain() => navigateToMain(context),
      sign_up_result.ReturnToSignIn() => bloc.add(ShowSignIn()),
    }
  );

  void navigateToMain(BuildContext context) => Navigator.pushReplacement(
    context,
    MaterialPageRoute(builder: (_) => const RootScreen()),
  );
}
