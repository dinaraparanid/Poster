import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:poster/core/presentation/foundation/platform_ui.dart';
import 'package:poster/core/presentation/theme/app.dart';
import 'package:poster/core/utils/functions/distinct_state.dart';
import 'package:poster/feature/auth/child/sign_up/presentation/bloc/mod.dart';
import 'package:poster/feature/auth/child/sign_up/presentation/widget/mod.dart';
import 'package:poster/feature/auth/presentation/widget/welcome_preview.dart';

final class SignUpScreen extends StatelessWidget {
  final SignUpBloc bloc;
  const SignUpScreen({super.key, required this.bloc});

  @override
  Widget build(BuildContext context) {
    final theme = context.read<AppTheme>();
    final strings = AppLocalizations.of(context)!;

    return BlocProvider(
      create: (_) => bloc,
      child: BlocConsumer<SignUpBloc, SignUpState>(
        listenWhen: distinctState((x) => x.isNoConnection),
        listener: (context, state) {
          if (state.isNoConnection) {
            // TODO: показать диалог
          }
        },
        builder: (context, state) => PopScope(
          canPop: false,
          onPopInvokedWithResult: (isPopped, _) => bloc.add(BackClick()),
          child: PlatformUi(cupertino: CupertinoUi, material: MaterialUi)(
            theme: theme,
            strings: strings,
            state: state,
            onEvent: bloc.add,
          ),
        ),
      ),
    );
  }

  Widget MaterialUi({
    required AppTheme theme,
    required AppLocalizations strings,
    required SignUpState state,
    required void Function(SignUpEvent) onEvent,
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
    body: Body(theme: theme, strings: strings, state: state, onEvent: onEvent),
  );

  Widget CupertinoUi({
    required AppTheme theme,
    required AppLocalizations strings,
    required SignUpState state,
    required void Function(SignUpEvent) onEvent,
  }) => CupertinoPageScaffold(
    backgroundColor: theme.colors.background.primary,
    navigationBar: CupertinoNavigationBar(
      leading: IconButton(
        icon: Icon(Icons.arrow_back_ios, color: theme.colors.button.topBar),
        onPressed: () => onEvent(BackClick()),
      ),
    ),
    child: Body(theme: theme, strings: strings, state: state, onEvent: onEvent),
  );

  Widget Body({
    required AppTheme theme,
    required AppLocalizations strings,
    required SignUpState state,
    required void Function(SignUpEvent) onEvent,
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
}
