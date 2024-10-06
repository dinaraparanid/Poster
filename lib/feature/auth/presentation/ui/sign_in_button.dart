import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:poster/core/ui/theme/app.dart';
import 'package:poster/feature/auth/component/mod.dart';
import 'package:universal_platform/universal_platform.dart';

final class SignInButton extends StatelessWidget {
  const SignInButton({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = context.read<AppTheme>();
    final strings = AppLocalizations.of(context)!;

    return BlocBuilder<AuthComponent, AuthState>(
      builder: (context, state) {
        final onEvent = context.read<AuthComponent>().add;
        void onClick() => onEvent(SignInClicked());

        return Container(
          width: double.infinity,
          margin: EdgeInsets.symmetric(horizontal: theme.dimensions.padding.medium),
          constraints: BoxConstraints(
            maxWidth: theme.dimensions.size.extraEnormous,
          ),
          child: UniversalPlatform.isIOS || UniversalPlatform.isMacOS
            ? cupertinoButton(theme, strings, state.isSignInEnabled, onClick)
            : materialButton(theme, strings, state.isSignInEnabled, onClick),
        );
      },
    );
  }

  Widget materialButton(
    AppTheme theme,
    AppLocalizations strings,
    bool enabled,
    void Function() onClick,
  ) => ElevatedButton(
    onPressed: enabled ? onClick : null,
    style: ElevatedButton.styleFrom(
      backgroundColor: theme.colors.button.primary,
      disabledBackgroundColor: theme.colors.button.disabled,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(theme.dimensions.radius.small),
        ),
      ),
    ),
    child: buttonText(theme, strings),
  );

  Widget cupertinoButton(
    AppTheme theme,
    AppLocalizations strings,
    bool enabled,
    void Function() onClick,
  ) => CupertinoButton(
    onPressed: enabled ? onClick : null,
    color: theme.colors.button.primary,
    disabledColor: theme.colors.button.disabled,
    borderRadius: BorderRadius.all(
      Radius.circular(theme.dimensions.radius.small),
    ),
    child: buttonText(theme, strings),
  );

  Text buttonText(
    AppTheme theme,
    AppLocalizations strings,
  ) => Text(
    strings.sign_in_button_text,
    style: theme.typography.regular.copyWith(
      color: theme.colors.text.onButton,
      fontWeight: FontWeight.w700,
    ),
  );
}