import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:poster/core/ui/theme/mod.dart';
import 'package:poster/feature/auth/component/component.dart';

final class AuthScreen extends StatelessWidget {
  const AuthScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = context.read<AppTheme>();

    return BlocProvider(
      create: (_) => AuthComponent(),
      child: Scaffold(
        backgroundColor: theme.colors.background.primary,
        body: const Text("TODO: Auth"),
      ),
    );
  }
}
