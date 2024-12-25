import 'package:flutter/cupertino.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:poster/core/presentation/theme/app.dart';
import 'package:poster/di/app_module.dart';
import 'package:poster/feature/auth/child/sign_in/presentation/bloc/mod.dart';

final class SignUpButton extends StatelessWidget {
  final bloc = di<SignInBloc>();
  final theme = di<AppTheme>();

  SignUpButton({super.key});

  @override
  Widget build(BuildContext context) {
    final strings = AppLocalizations.of(context)!;

    return GestureDetector(
      child: ButtonText(strings),
      onTap: () => bloc.add(SignUpClicked()),
    );
  }

  Text ButtonText(AppLocalizations strings) => Text(
    strings.sign_up_button_text,
    style: theme.typography.regular.copyWith(
      color: theme.colors.text.clickable,
      fontWeight: FontWeight.w700,
    ),
  );
}