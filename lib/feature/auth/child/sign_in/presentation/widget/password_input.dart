import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:poster/core/presentation/foundation/app_text_field.dart';
import 'package:poster/core/presentation/theme/app.dart';
import 'package:poster/core/presentation/theme/images.dart';
import 'package:poster/di/app_module.dart';
import 'package:poster/feature/auth/child/sign_in/presentation/bloc/mod.dart';

final class PasswordInput extends StatefulWidget {
  const PasswordInput({super.key});

  @override
  State<StatefulWidget> createState() => _PasswordInputState();
}

final class _PasswordInputState extends State<PasswordInput> {
  final bloc = di<SignInBloc>();
  final theme = di<AppTheme>();
  final controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final strings = AppLocalizations.of(context)!;

    return BlocBuilder<SignInBloc, SignInState>(
      builder: (context, state) => Container(
        padding: EdgeInsets.symmetric(
          horizontal: theme.dimensions.padding.medium,
        ),
        constraints: BoxConstraints(
          maxWidth: theme.dimensions.size.extraEnormous,
        ),
        child: AppTextField(
          controller: controller,
          label: strings.sign_in_password,
          icon: AppImages.loadSvg(
            state.isPasswordVisible ? 'ic_eye' : 'ic_eye_closed',
          ),
          obscureText: !state.isPasswordVisible,
          onChanged: (username) => bloc.add(LoginChanged(login: username)),
          onIconClicked: () => bloc.add(PasswordVisibilityChanged()),
        ),
      ),
    );
  }
}
