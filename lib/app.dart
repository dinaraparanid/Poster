import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:poster/core/ui/theme/mod.dart';
import 'package:poster/feature/auth/presentation/screen.dart';

final class App extends StatelessWidget {
  final AppTheme theme;

  const App({super.key, required this.theme});

  @override
  Widget build(BuildContext context) =>
      RepositoryProvider.value(
        value: theme,
        child: MaterialApp(
          color: theme.colors.background.primary,
          localizationsDelegates: AppLocalizations.localizationsDelegates,
          supportedLocales: AppLocalizations.supportedLocales,
          home: const AuthScreen(),
        ),
      );
}