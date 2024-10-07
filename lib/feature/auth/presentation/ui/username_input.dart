import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:poster/core/ui/foundation/text_field.dart';
import 'package:poster/core/ui/theme/app.dart';
import 'package:poster/feature/auth/component/mod.dart';

final class UsernameInput extends StatelessWidget {
  const UsernameInput({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = context.read<AppTheme>();
    final strings = AppLocalizations.of(context)!;

    return BlocBuilder<AuthComponent, AuthState>(
      builder: (context, state) {
        final onEvent = context.read<AuthComponent>().add;

        void onChanged(String username) =>
            onEvent(UsernameChanged(username: username));

        void onCanceled() => onEvent(UsernameCleared());

        return Container(
          padding: EdgeInsets.symmetric(
            horizontal: theme.dimensions.padding.medium
          ),
          constraints: BoxConstraints(
            maxWidth: theme.dimensions.size.extraEnormous,
          ),
          child: AppTextField(
            label: strings.sign_in_username,
            onChanged: onChanged,
            onCanceled: onCanceled,
          ),
        );
      },
    );
  }
}
