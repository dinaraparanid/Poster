import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:poster/feature/auth/child/sign_up/presentation/bloc/mod.dart';
import 'package:poster/feature/auth/presentation/widget/clearable_text_field.dart';

final class EmailInput extends StatelessWidget {
  final void Function(SignUpEvent) onEvent;

  const EmailInput({super.key, required this.onEvent});

  @override
  Widget build(BuildContext context) {
    final strings = AppLocalizations.of(context)!;

    return BlocBuilder<SignUpBloc, SignUpState>(
      builder: (context, state) => ClearableTextField(
        label: strings.auth_email,
        error: state.isInvalidEmail ? strings.auth_email_error : null,
        onChanged: (email) => onEvent(EmailChange(email: email)),
        onClear: () => onEvent(EmailClear()),
      ),
    );
  }
}
