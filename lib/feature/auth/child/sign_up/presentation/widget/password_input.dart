import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:poster/feature/auth/child/sign_up/presentation/bloc/mod.dart';
import 'package:poster/feature/auth/domain/error/auth_error.dart';
import 'package:poster/feature/auth/presentation/widget/password_text_field.dart';

final class PasswordInput extends StatelessWidget {
  final void Function(SignUpEvent) onEvent;
  const PasswordInput({super.key, required this.onEvent});

  @override
  Widget build(BuildContext context) {
    final strings = AppLocalizations.of(context)!;

    return BlocBuilder<SignUpBloc, SignUpState>(
      builder: (context, state) => PasswordTextField(
        isPasswordVisible: state.isPasswordVisible,
        error: switch (state.error) {
          AuthError.weakPassword => strings.auth_password_weak,
          AuthError.wrongPassword => strings.auth_password_error,
          AuthError.invalidCredential => strings.auth_password_error,
          _ => null,
        },
        onChanged: (password) => onEvent(PasswordChange(password: password)),
        onPasswordVisibilityChanged: () => onEvent(PasswordVisibilityChange()),
      ),
    );
  }
}
