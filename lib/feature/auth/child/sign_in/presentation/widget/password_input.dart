import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:poster/feature/auth/child/sign_in/presentation/bloc/mod.dart';
import 'package:poster/feature/auth/presentation/widget/password_text_field.dart';

final class PasswordInput extends StatelessWidget {
  final void Function(SignInEvent) onEvent;

  const PasswordInput({super.key, required this.onEvent});

  @override
  Widget build(BuildContext context) => BlocBuilder<SignInBloc, SignInState>(
    builder: (context, state) => PasswordTextField(
      isPasswordVisible: state.isPasswordVisible,
      onChanged: (password) => onEvent(PasswordChange(password: password)),
      onPasswordVisibilityChanged: () => onEvent(PasswordVisibilityChange()),
    ),
  );
}
