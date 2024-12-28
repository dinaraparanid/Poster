import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:poster/core/presentation/foundation/dialog/no_connection_dialog.dart';
import 'package:poster/core/presentation/foundation/platform_ui.dart';
import 'package:poster/core/presentation/theme/mod.dart';
import 'package:poster/core/presentation/theme/strings.dart';
import 'package:poster/core/utils/functions/distinct_state.dart';
import 'package:poster/feature/auth/child/sign_in/presentation/bloc/mod.dart';
import 'package:poster/feature/auth/child/sign_in/presentation/widget/mod.dart';
import 'package:poster/feature/auth/child/sign_in/presentation/widget/password_input.dart';
import 'package:poster/feature/auth/child/sign_in/presentation/widget/sign_up_button.dart';
import 'package:poster/feature/auth/presentation/widget/dialog/profile_not_found_dialog.dart';
import 'package:poster/feature/auth/presentation/widget/welcome_preview.dart';

final class SignInScreen extends StatelessWidget {
  final SignInBloc bloc;
  const SignInScreen({super.key, required this.bloc});

  void onEvent(SignInEvent event) => bloc.add(event);

  @override
  Widget build(BuildContext context) {
    final theme = context.read<AppTheme>();
    final strings = context.strings;

    return BlocProvider(
      create: (_) => bloc,
      child: BlocConsumer<SignInBloc, SignInState>(
        listenWhen: distinctState((x) => x.isAlertDialogRequired),
        listener: onEffect,
        builder: (context, state) =>
          PlatformUi(cupertino: CupertinoUi, material: MaterialUi)(
            theme: theme,
            strings: strings,
            state: state,
          ),
      ),
    );
  }

  Widget MaterialUi({
    required AppTheme theme,
    required AppLocalizations strings,
    required SignInState state,
  }) => Scaffold(
    backgroundColor: theme.colors.background.primary,
    body: Body(theme: theme, strings: strings, state: state),
  );

  Widget CupertinoUi({
    required AppTheme theme,
    required AppLocalizations strings,
    required SignInState state,
  }) => CupertinoPageScaffold(
    backgroundColor: theme.colors.background.primary,
    child: Body(theme: theme, strings: strings, state: state),
  );

  Widget Body({
    required AppTheme theme,
    required AppLocalizations strings,
    required SignInState state,
  }) => SingleChildScrollView(
    child: Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(height: theme.dimensions.padding.enormous),

        const WelcomePreview(),

        SizedBox(height: theme.dimensions.padding.large),

        EmailInput(onEvent: onEvent),

        SizedBox(height: theme.dimensions.padding.medium),

        PasswordInput(onEvent: onEvent),

        SizedBox(height: theme.dimensions.padding.large),

        SignInButton(onEvent: onEvent),

        SizedBox(height: theme.dimensions.padding.extraSmall),

        SignUpButton(onEvent: onEvent),

        SizedBox(height: theme.dimensions.padding.medium),
      ],
    ),
  );

  void onEffect(BuildContext context, SignInState state) {
    if (state.isUserNotFoundOrDisabled) {
      showProfileNotFoundDialog(
        context: context,
        onCancel: () => onEvent(ClearError()),
        onOk: () => onEvent(SignUpClick()),
      );
    } else if (state.isNoConnection) {
      showNoConnectionDialog(
        context: context,
        onCancel: () => onEvent(ClearError()),
        onOk: () => onEvent(ClearError()),
      );
    }
  }
}
