import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:poster/core/presentation/foundation/platform_ui.dart';
import 'package:poster/core/presentation/theme/mod.dart';
import 'package:poster/feature/auth/child/sign_in/presentation/bloc/mod.dart';
import 'package:poster/feature/auth/child/sign_in/presentation/widget/mod.dart';
import 'package:poster/feature/auth/child/sign_in/presentation/widget/password_input.dart';
import 'package:poster/feature/auth/child/sign_in/presentation/widget/sign_up_button.dart';
import 'package:poster/feature/auth/presentation/widget/welcome_preview.dart';

final class SignInScreen extends StatelessWidget {
  final SignInBloc bloc;
  const SignInScreen({super.key, required this.bloc});

  @override
  Widget build(BuildContext context) {
    final theme = context.read<AppTheme>();
    final strings = AppLocalizations.of(context)!;

    return BlocProvider(
      create: (_) => bloc,
      child: BlocBuilder<SignInBloc, SignInState>(
        builder: (context, state) =>
          PlatformUi(cupertino: CupertinoUi, material: MaterialUi)(
            theme: theme,
            strings: strings,
            state: state,
            onEvent: bloc.add,
          ),
      ),
    );
  }

  Widget MaterialUi({
    required AppTheme theme,
    required AppLocalizations strings,
    required SignInState state,
    required void Function(SignInEvent) onEvent,
  }) => Scaffold(
    backgroundColor: theme.colors.background.primary,
    body: Body(theme: theme, strings: strings, state: state, onEvent: onEvent),
  );

  Widget CupertinoUi({
    required AppTheme theme,
    required AppLocalizations strings,
    required SignInState state,
    required void Function(SignInEvent) onEvent,
  }) => CupertinoPageScaffold(
    backgroundColor: theme.colors.background.primary,
    child: Body(theme: theme, strings: strings, state: state, onEvent: onEvent),
  );

  Widget Body({
    required AppTheme theme,
    required AppLocalizations strings,
    required SignInState state,
    required void Function(SignInEvent) onEvent,
  }) => SingleChildScrollView(
    child: Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const WelcomePreview(),

        SizedBox(height: theme.dimensions.padding.large),

        LoginInput(onEvent: onEvent),

        SizedBox(height: theme.dimensions.padding.medium),

        PasswordInput(onEvent: onEvent),

        SizedBox(height: theme.dimensions.padding.large),

        SignInButton(onEvent: onEvent),

        SizedBox(height: theme.dimensions.padding.extraSmall),

        SignUpButton(onEvent: onEvent),

        SizedBox(height: theme.dimensions.padding.medium),
      ],
    ),
  );
}
