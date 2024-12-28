import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:poster/core/presentation/foundation/button.dart';
import 'package:poster/core/presentation/theme/app.dart';
import 'package:poster/core/presentation/theme/strings.dart';
import 'package:poster/feature/auth/child/sign_in/presentation/bloc/mod.dart';

final class SignInButton extends StatelessWidget {
  final void Function(SignInEvent) onEvent;

  const SignInButton({super.key, required this.onEvent});

  @override
  Widget build(BuildContext context) {
    final theme = context.read<AppTheme>();
    final strings = context.strings;

    return BlocBuilder<SignInBloc, SignInState>(
      builder: (context, state) => AppButton(
        enabled: state.isSignInEnabled,
        onClick: () => onEvent(SignInClick()),
        child: ButtonText(theme: theme, strings: strings),
      ),
    );
  }

  Text ButtonText({
    required AppTheme theme,
    required AppLocalizations strings,
  }) => Text(
    strings.auth_sign_in,
    style: theme.typography.regular.copyWith(
      color: theme.colors.text.onButton,
      fontWeight: FontWeight.w700,
    ),
  );
}
