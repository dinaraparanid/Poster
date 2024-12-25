import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:poster/di/app_module.dart';
import 'package:poster/feature/auth/child/sign_in/presentation/bloc/sign_in_result.dart';
import 'package:poster/feature/auth/child/sign_in/presentation/sign_in_screen.dart';
import 'package:poster/feature/auth/presentation/bloc/auth_bloc.dart';
import 'package:poster/feature/auth/presentation/bloc/auth_child.dart';
import 'package:poster/feature/auth/presentation/bloc/auth_state.dart';
import 'package:poster/feature/root/presentation/root_screen.dart';

final class AuthScreen extends StatelessWidget {
  final bloc = di<AuthBloc>();

  AuthScreen({super.key});

  @override
  Widget build(BuildContext context) => BlocProvider(
    create: (_) => bloc,
    child: BlocBuilder<AuthBloc, AuthState>(
      builder: (context, state) => switch (state.child) {
        SignIn() => SignInScreen(
          onBack: (result) => switch (result) {
            NavigateToMain() => Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (_) => const RootScreen()),
            ),

            NavigateToSignUp() => print('TODO: Navigate to SignUp'),
          }
        ),

        SignUp() => const Text('TODO: SignUpScreen'),
      },
    ),
  );
}
