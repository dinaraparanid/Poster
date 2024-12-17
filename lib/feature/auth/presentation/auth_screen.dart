import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:poster/core/presentation/theme/mod.dart';
import 'package:poster/core/utils/functions/do_nothing.dart';
import 'package:poster/feature/auth/domain/use_case/login_use_case.dart';
import 'package:poster/feature/auth/presentation/bloc/mod.dart';
import 'package:poster/feature/auth/presentation/widget/mod.dart';
import 'package:poster/feature/root/presentation/screen.dart';
import 'package:universal_platform/universal_platform.dart';

final class AuthScreen extends StatelessWidget {
  const AuthScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = context.read<AppTheme>();
    final strings = AppLocalizations.of(context)!;

    return BlocProvider(
      create: (context) => AuthBloc(
        // TODO: GetIt
        loginUseCase: LoginUseCase(repository: context.read())
      ),
      child: BlocConsumer<AuthBloc, AuthState>(
        listenWhen: (x, y) => x.effect != y.effect,
        listener: (context, state) => switch (state.effect) {
          SignedIn() => onSignedIn(
              context: context,
              onEvent: context.read<AuthBloc>().add,
          ),

          FailedToSignIn() => doNothing,
          None() => doNothing,
          null => doNothing,
        },
        builder: (context, state) {
          final onEvent = context.read<AuthBloc>().add;
          return UniversalPlatform.isIOS || UniversalPlatform.isMacOS
            ? cupertinoUi(theme, strings, state, onEvent)
            : materialUi(theme, strings, state, onEvent);
        },
      ),
    );
  }

  Widget materialUi(
    AppTheme theme,
    AppLocalizations strings,
    AuthState state,
    void Function(AuthEvent) onEvent,
  ) => Scaffold(
    backgroundColor: theme.colors.background.primary,
    body: body(theme, strings, state, onEvent),
  );

  Widget cupertinoUi(
    AppTheme theme,
    AppLocalizations strings,
    AuthState state,
    void Function(AuthEvent) onEvent,
  ) => CupertinoPageScaffold(
    backgroundColor: theme.colors.background.primary,
    child: body(theme, strings, state, onEvent),
  );

  Widget body(
    AppTheme theme,
    AppLocalizations strings,
    AuthState state,
    void Function(AuthEvent) onEvent,
  ) => SingleChildScrollView(
    physics: const AlwaysScrollableScrollPhysics(),
    child: Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        previewImage(theme),

        SizedBox(height: theme.dimensions.padding.medium),

        welcomeText(theme, strings),

        SizedBox(height: theme.dimensions.padding.large),

        const UsernameInput(),

        SizedBox(height: theme.dimensions.padding.large),

        const SignInButton(),
      ],
    ),
  );

  Widget previewImage(AppTheme theme) => Container(
    alignment: Alignment.center,
    margin: EdgeInsets.fromLTRB(
      theme.dimensions.padding.zero,
      theme.dimensions.padding.enormous,
      theme.dimensions.padding.zero,
      theme.dimensions.padding.zero,
    ),
    child: Image.asset(
      AppImages.loadPng('sign_in_preview'),
      width: theme.dimensions.size.extraLarge,
      height: theme.dimensions.size.extraLarge,
    ),
  );

  Widget welcomeText(
    AppTheme theme,
    AppLocalizations strings,
  ) => Text(
    strings.sign_in_welcome,
    style: theme.typography.h.h1.copyWith(
      color: theme.colors.text.header,
      fontWeight: FontWeight.w700,
    ),
  );

  void onSignedIn({
    required BuildContext context,
    required void Function(AuthEvent) onEvent,
  }) {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (_) => const RootScreen()),
    );

    onEvent(NavigatedToSignIn());
  }
}
