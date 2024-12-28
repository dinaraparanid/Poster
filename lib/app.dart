import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:poster/core/presentation/theme/mod.dart';
import 'package:poster/di/app_module.dart';
import 'package:poster/feature/root/presentation/bloc/root_bloc_factory.dart';
import 'package:poster/navigation/app_router.dart';

final class App extends StatelessWidget {
  final AppTheme theme;
  final rootBlocFactory = di<RootBlocFactory>();
  final router = di<AppRouter>();

  App({super.key, required this.theme});

  @override
  Widget build(BuildContext context) => RepositoryProvider(
    create: (_) => theme,
    child: BlocProvider(
      create: (_) => rootBlocFactory.create(),
      child: MaterialApp.router(
        routerConfig: router.router,
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
      ),
    ),
  );
}
