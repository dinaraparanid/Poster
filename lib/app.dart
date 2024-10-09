import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:poster/core/ui/theme/mod.dart';
import 'package:poster/data/auth/mod.dart';
import 'package:poster/data/dio/dio.dart';
import 'package:poster/domain/auth/mod.dart';
import 'package:poster/feature/auth/presentation/screen.dart';

final class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = AppTheme.create();

    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider(create: (_) => theme),
        RepositoryProvider(create: (_) => AppDio()),

        // ---------------------- Auth ----------------------
        RepositoryProvider<AuthApi>(create: (context) => AuthApiImpl(client: context.read())),
        RepositoryProvider<AuthStorage>(create: (context) => AuthStorageImpl()),
        RepositoryProvider<AuthRepository>(
          create: (context) => AuthRepositoryImpl(
            storage: context.read(),
            api: context.read(),
          ),
        ),
      ],
      child: MaterialApp(
        color: theme.colors.background.primary,
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
        theme: ThemeData(
          textSelectionTheme: TextSelectionThemeData(
            selectionColor: theme.colors.textField.primary.withOpacity(0.5),
            selectionHandleColor: theme.colors.textField.primary,
            cursorColor: theme.colors.textField.primary,
          ),
        ),
        home: const AuthScreen(),
      ),
    );
  }
}
