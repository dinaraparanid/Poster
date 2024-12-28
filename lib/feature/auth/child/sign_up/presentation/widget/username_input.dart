import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:poster/core/presentation/theme/strings.dart';
import 'package:poster/feature/auth/child/sign_up/presentation/bloc/mod.dart';
import 'package:poster/feature/auth/presentation/widget/clearable_text_field.dart';

final class UsernameInput extends StatelessWidget {
  final void Function(SignUpEvent) onEvent;

  const UsernameInput({super.key, required this.onEvent});

  @override
  Widget build(BuildContext context) {
    final strings = context.strings;
    return BlocBuilder<SignUpBloc, SignUpState>(
      builder: (context, state) => ClearableTextField(
        label: strings.auth_username,
        onChanged: (username) => onEvent(UsernameChange(username: username)),
        onClear: () => onEvent(UsernameClear()),
      ),
    );
  }
}
