import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:poster/core/presentation/foundation/platform_ui.dart';
import 'package:poster/core/presentation/theme/app.dart';
import 'package:poster/core/utils/functions/do_nothing.dart';
import 'package:poster/feature/auth/child/sign_up/presentation/bloc/mod.dart';
import 'package:poster/feature/auth/child/sign_up/presentation/widget/mod.dart';
import 'package:poster/feature/auth/presentation/widget/welcome_preview.dart';

final class SignUpScreen extends StatelessWidget {
  final SignUpBloc bloc;
  final void Function(SignUpResult result) onBack;

  const SignUpScreen({
    super.key,
    required this.bloc,
    required this.onBack,
  });

  @override
  Widget build(BuildContext context) {
    final theme = context.read<AppTheme>();
    final strings = AppLocalizations.of(context)!;

    return BlocProvider(
      create: (_) => bloc,
      child: BlocConsumer<SignUpBloc, SignUpState>(
        listenWhen: (x, y) => x.effect != y.effect,
        listener: (context, state) => switch (state.effect) {
          BackClicked() => onBack(const SignUpResult.returnToSignIn()),
          SignedUp() => onBack(const SignUpResult.navigateToMain()),
          null => doNothing,
        },
        builder: (context, state) => PopScope(
          canPop: false,
          onPopInvokedWithResult: (isPopped, _) => bloc.add(BackClick()),
          child: PlatformUi(cupertino: CupertinoUi, material: MaterialUi)(
            theme: theme,
            strings: strings,
            state: state,
            onEvent: bloc.add,
          ),
        ),
      ),
    );
  }

  Widget MaterialUi({
    required AppTheme theme,
    required AppLocalizations strings,
    required SignUpState state,
    required void Function(SignUpEvent) onEvent,
  }) => Scaffold(
    backgroundColor: theme.colors.background.primary,
    body: Body(theme: theme, strings: strings, state: state, onEvent: onEvent),
  );

  Widget CupertinoUi({
    required AppTheme theme,
    required AppLocalizations strings,
    required SignUpState state,
    required void Function(SignUpEvent) onEvent,
  }) => CupertinoPageScaffold(
    backgroundColor: theme.colors.background.primary,
    child: Body(theme: theme, strings: strings, state: state, onEvent: onEvent),
  );

  Widget Body({
    required AppTheme theme,
    required AppLocalizations strings,
    required SignUpState state,
    required void Function(SignUpEvent) onEvent,
  }) => SingleChildScrollView(
    child: Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        WelcomePreview(),

        SizedBox(height: theme.dimensions.padding.large),

        EmailInput(onEvent: onEvent),

        SizedBox(height: theme.dimensions.padding.medium),

        UsernameInput(onEvent: onEvent),

        SizedBox(height: theme.dimensions.padding.medium),

        PasswordInput(onEvent: onEvent),

        SizedBox(height: theme.dimensions.padding.large),

        SignUpButton(onEvent: onEvent),

        SizedBox(height: theme.dimensions.padding.medium),
      ],
    ),
  );
}
