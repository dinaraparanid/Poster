import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:poster/core/presentation/foundation/button.dart';
import 'package:poster/core/presentation/theme/app.dart';
import 'package:poster/core/presentation/theme/strings.dart';
import 'package:poster/feature/auth/child/sign_up/presentation/bloc/mod.dart';

final class SignUpButton extends StatelessWidget {
  final void Function(SignUpEvent) onEvent;

  const SignUpButton({super.key, required this.onEvent});

  @override
  Widget build(BuildContext context) {
    final theme = context.read<AppTheme>();
    final strings = context.strings;

    return BlocBuilder<SignUpBloc, SignUpState>(
      builder: (context, state) => AppButton(
        enabled: state.isSignUpEnabled,
        onClick: () => onEvent(SignUpClick()),
        child: ButtonText(theme: theme, strings: strings),
      ),
    );
  }

  Text ButtonText({
    required AppTheme theme,
    required AppLocalizations strings,
  }) => Text(
    strings.auth_sign_up,
    style: theme.typography.regular.copyWith(
      color: theme.colors.text.onButton,
      fontWeight: FontWeight.w700,
    ),
  );
}
