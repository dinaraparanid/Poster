import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:poster/core/presentation/foundation/clickable.dart';
import 'package:poster/core/presentation/theme/app.dart';
import 'package:poster/feature/auth/child/sign_in/presentation/bloc/mod.dart';

final class SignUpButton extends StatelessWidget {
  final void Function(SignInEvent) onEvent;

  const SignUpButton({super.key, required this.onEvent});

  @override
  Widget build(BuildContext context) {
    final theme = context.read<AppTheme>();
    final strings = AppLocalizations.of(context)!;

    return AppClickable(
      border: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(theme.dimensions.radius.medium)
        ),
      ),
      child: ButtonText(theme: theme, strings: strings),
      onClick: () => onEvent(SignUpClick()),
    );
  }

  Text ButtonText({
    required AppTheme theme,
    required AppLocalizations strings,
  }) => Text(
    strings.auth_sign_up,
    style: theme.typography.regular.copyWith(
      color: theme.colors.text.clickable,
      fontWeight: FontWeight.w700,
    ),
  );
}