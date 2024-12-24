import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:poster/core/presentation/foundation/button.dart';
import 'package:poster/core/presentation/theme/app.dart';
import 'package:poster/di/app_module.dart';
import 'package:poster/feature/auth/sign_in/presentation/bloc/mod.dart';

final class SignInButton extends StatelessWidget {
  final bloc = di<SignInBloc>();
  final theme = di<AppTheme>();

  SignInButton({super.key});

  @override
  Widget build(BuildContext context) {
    final strings = AppLocalizations.of(context)!;

    return BlocBuilder<SignInBloc, SignInState>(
      builder: (context, state) => AppButton(
        enabled: state.isSignInEnabled,
        onClick: () => bloc.add(SignInClicked()),
        child: ButtonText(strings),
      ),
    );
  }

  Text ButtonText(AppLocalizations strings) => Text(
    strings.sign_in_button_text,
    style: theme.typography.regular.copyWith(
      color: theme.colors.text.onButton,
      fontWeight: FontWeight.w700,
    ),
  );
}
