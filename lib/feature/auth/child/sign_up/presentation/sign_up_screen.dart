import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:poster/core/presentation/foundation/dialog/no_connection_dialog.dart';
import 'package:poster/core/presentation/foundation/platform_ui.dart';
import 'package:poster/core/presentation/theme/app.dart';
import 'package:poster/core/presentation/theme/strings.dart';
import 'package:poster/core/utils/functions/distinct_state.dart';
import 'package:poster/feature/auth/child/sign_up/presentation/bloc/mod.dart';
import 'package:poster/feature/auth/child/sign_up/presentation/widget/mod.dart';
import 'package:poster/feature/auth/presentation/widget/welcome_preview.dart';

final class SignUpScreen extends StatelessWidget {
  final SignUpBloc bloc;
  const SignUpScreen({super.key, required this.bloc});

  void onEvent(SignUpEvent event) => bloc.add(event);

  @override
  Widget build(BuildContext context) {
    final theme = context.read<AppTheme>();
    final strings = context.strings;

    return BlocProvider(
      create: (_) => bloc,
      child: BlocConsumer<SignUpBloc, SignUpState>(
        listenWhen: distinctState((x) => x.isNoConnection),
        listener: onEffect,
        builder: (context, state) => PopScope(
          canPop: false,
          onPopInvokedWithResult: (isPopped, _) => bloc.add(BackClick()),
          child: PlatformUi(cupertino: CupertinoUi, material: MaterialUi)(
            theme: theme,
            strings: strings,
            state: state,
          ),
        ),
      ),
    );
  }

  Widget MaterialUi({
    required AppTheme theme,
    required AppLocalizations strings,
    required SignUpState state,
  }) => Scaffold(
    extendBodyBehindAppBar: true,
    backgroundColor: theme.colors.background.primary,
    appBar: AppBar(
      elevation: 0,
      backgroundColor: Colors.transparent,
      foregroundColor: Colors.transparent,
      leading: IconButton(
        icon: Icon(Icons.arrow_back, color: theme.colors.button.topBar),
        onPressed: () => onEvent(BackClick()),
      ),
    ),
    body: Body(theme: theme, strings: strings, state: state),
  );

  Widget CupertinoUi({
    required AppTheme theme,
    required AppLocalizations strings,
    required SignUpState state,
  }) => CupertinoPageScaffold(
    backgroundColor: theme.colors.background.primary,
    navigationBar: CupertinoNavigationBar(
      leading: IconButton(
        icon: Icon(Icons.arrow_back_ios, color: theme.colors.button.topBar),
        onPressed: () => onEvent(BackClick()),
      ),
    ),
    child: Body(theme: theme, strings: strings, state: state),
  );

  Widget Body({
    required AppTheme theme,
    required AppLocalizations strings,
    required SignUpState state,
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

        UsernameInput(onEvent: onEvent),

        SizedBox(height: theme.dimensions.padding.medium),

        PasswordInput(onEvent: onEvent),

        SizedBox(height: theme.dimensions.padding.large),

        SignUpButton(onEvent: onEvent),

        SizedBox(height: theme.dimensions.padding.medium),
      ],
    ),
  );

  void onEffect(BuildContext context, SignUpState state) {
    if (state.isNoConnection) {
      showNoConnectionDialog(
        context: context,
        onCancel: () => onEvent(ClearError()),
        onOk: () => onEvent(ClearError()),
      );
    }
  }
}
