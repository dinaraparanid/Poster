import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:poster/core/presentation/theme/mod.dart';
import 'package:poster/di/app_module.dart';
import 'package:poster/feature/auth/child/sign_in/presentation/sign_in_screen.dart';
import 'package:poster/feature/auth/presentation/auth_screen.dart';

final class App extends StatelessWidget {
  final theme = di<AppTheme>();

  App({super.key});

  @override
  Widget build(BuildContext context) => MaterialApp(
    color: theme.colors.background.primary,
    localizationsDelegates: AppLocalizations.localizationsDelegates,
    supportedLocales: AppLocalizations.supportedLocales,
    theme: ThemeData(
      textSelectionTheme: TextSelectionThemeData(
        selectionColor: theme.colors.textField.primary.withValues(alpha: 0.5),
        selectionHandleColor: theme.colors.textField.primary,
        cursorColor: theme.colors.textField.primary,
      ),
    ),
    home: AuthScreen(),
  );
}
