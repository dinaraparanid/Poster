import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:poster/core/presentation/foundation/button.dart';
import 'package:poster/core/presentation/theme/app.dart';
import 'package:poster/feature/auth/presentation/bloc/mod.dart';

final class SignInButton extends StatelessWidget {
  const SignInButton({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = context.read<AppTheme>();
    final strings = AppLocalizations.of(context)!;

    return BlocBuilder<AuthBloc, AuthState>(
      builder: (context, state) {
        final onEvent = context.read<AuthBloc>().add;
        void onClick() => onEvent(SignInClicked());

        return AppButton(
          enabled: state.isSignInEnabled,
          onClick: onClick,
          child: buttonText(theme, strings),
        );
      },
    );
  }

  Text buttonText(
    AppTheme theme,
    AppLocalizations strings,
  ) => Text(
    strings.sign_in_button_text,
    style: theme.typography.regular.copyWith(
      color: theme.colors.text.onButton,
      fontWeight: FontWeight.w700,
    ),
  );
}
