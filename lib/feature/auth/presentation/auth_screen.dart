import 'package:flutter/material.dart';
import 'package:poster/feature/auth/child/sign_in/presentation/sign_in_screen.dart';
import 'package:poster/feature/auth/child/sign_up/presentation/sign_up_screen.dart';
import 'package:poster/feature/auth/presentation/bloc/mod.dart';

final class AuthScreen extends StatelessWidget {
  final AuthBloc bloc;
  const AuthScreen({super.key, required this.bloc});

  @override
  Widget build(BuildContext context) => const SizedBox.expand();

  Widget buildSignInScreen(BuildContext context) => SignInScreen(
    bloc: bloc.createSignInBloc(),
  );

  Widget buildSignUpScreen(BuildContext context) => SignUpScreen(
    bloc: bloc.createSignUpBloc(),
  );
}
