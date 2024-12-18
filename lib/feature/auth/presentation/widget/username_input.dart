import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:poster/core/presentation/foundation/text_field.dart';
import 'package:poster/core/presentation/theme/app.dart';
import 'package:poster/di/app_module.dart';
import 'package:poster/feature/auth/presentation/bloc/mod.dart';

final class UsernameInput extends StatelessWidget {
  const UsernameInput({super.key});

  @override
  Widget build(BuildContext context) {
    final bloc = di<AuthBloc>();
    final theme = di<AppTheme>();
    final strings = AppLocalizations.of(context)!;

    return BlocBuilder<AuthBloc, AuthState>(
      builder: (context, state) {
        void onChanged(String username) =>
            bloc.add(UsernameChanged(username: username));

        void onCanceled() =>
            bloc.add(UsernameCleared());

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
