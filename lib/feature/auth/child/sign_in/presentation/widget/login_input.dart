import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:poster/feature/auth/child/sign_in/presentation/bloc/mod.dart';
import 'package:poster/feature/auth/presentation/widget/clearable_text_field.dart';

final class LoginInput extends StatelessWidget {
  final void Function(SignInEvent) onEvent;
  const LoginInput({super.key, required this.onEvent});

  @override
  Widget build(BuildContext context) {
    final strings = AppLocalizations.of(context)!;

    return BlocBuilder<SignInBloc, SignInState>(
      builder: (context, state) => ClearableTextField(
        label: strings.auth_username,
        onChanged: (username) => onEvent(LoginChange(login: username)),
        onClear: () => onEvent(LoginClear()),
      ),
    );
  }
}
