import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:poster/core/presentation/theme/mod.dart';
import 'package:poster/core/utils/functions/do_nothing.dart';
import 'package:poster/di/app_module.dart';
import 'package:poster/feature/auth/child/sign_in/presentation/bloc/mod.dart';
import 'package:poster/feature/auth/child/sign_in/presentation/widget/mod.dart';
import 'package:poster/feature/auth/child/sign_in/presentation/widget/password_input.dart';
import 'package:poster/feature/auth/child/sign_in/presentation/widget/sign_up_button.dart';
import 'package:poster/feature/root/presentation/root_screen.dart';
import 'package:universal_platform/universal_platform.dart';

final class SignInScreen extends StatelessWidget {
  final bloc = di<SignInBloc>();
  final theme = di<AppTheme>();
  final void Function(SignInResult result) onBack;

  SignInScreen({super.key, required this.onBack});

  @override
  Widget build(BuildContext context) {
    final strings = AppLocalizations.of(context)!;

    return BlocProvider(
      create: (_) => bloc,
      child: BlocConsumer<SignInBloc, SignInState>(
        listenWhen: (x, y) => x.effect != y.effect,
        listener: (context, state) => switch (state.effect) {
          SignedUpClicked() => onBack(const SignInResult.navigateToSignUp()),
          SignedIn() => onBack(const SignInResult.navigateToMain()),
          null => doNothing,
        },
        builder: (context, state) =>
          (UniversalPlatform.isIOS || UniversalPlatform.isMacOS ? CupertinoUi : MaterialUi)(
            strings: strings,
            state: state,
            onEvent: bloc.add,
          ),
      ),
    );
  }

  Widget MaterialUi({
    required AppLocalizations strings,
    required SignInState state,
    required void Function(SignInEvent) onEvent,
  }) => Scaffold(
    backgroundColor: theme.colors.background.primary,
    body: Body(strings: strings, state: state, onEvent: onEvent),
  );

  Widget CupertinoUi({
    required AppLocalizations strings,
    required SignInState state,
    required void Function(SignInEvent) onEvent,
  }) => CupertinoPageScaffold(
    backgroundColor: theme.colors.background.primary,
    child: Body(strings: strings, state: state, onEvent: onEvent),
  );

  Widget Body({
    required AppLocalizations strings,
    required SignInState state,
    required void Function(SignInEvent) onEvent,
  }) => SingleChildScrollView(
    child: Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        PreviewImage(),

        SizedBox(height: theme.dimensions.padding.medium),

        WelcomeText(strings),

        SizedBox(height: theme.dimensions.padding.large),

        const UsernameInput(),

        SizedBox(height: theme.dimensions.padding.medium),

        const PasswordInput(),

        SizedBox(height: theme.dimensions.padding.large),

        SignInButton(),

        SizedBox(height: theme.dimensions.padding.medium),

        SignUpButton(),

        SizedBox(height: theme.dimensions.padding.medium),
      ],
    ),
  );

  Widget PreviewImage() => Container(
    alignment: Alignment.center,
    margin: EdgeInsets.fromLTRB(
      theme.dimensions.padding.zero,
      theme.dimensions.padding.enormous,
      theme.dimensions.padding.zero,
      theme.dimensions.padding.zero,
    ),
    child: Image.asset(
      AppImages.loadPng('sign_in_preview').value,
      width: theme.dimensions.size.extraLarge,
      height: theme.dimensions.size.extraLarge,
    ),
  );

  Widget WelcomeText(AppLocalizations strings) => Text(
    strings.sign_in_welcome,
    style: theme.typography.h.h1.copyWith(
      color: theme.colors.text.header,
      fontWeight: FontWeight.w700,
    ),
  );

  void navigateToSignUp({required BuildContext context}) =>
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (_) => const RootScreen()), // TODO: SignUpScreen
    );

  void navigateToRoot({required BuildContext context}) =>
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (_) => const RootScreen()),
    );
}
