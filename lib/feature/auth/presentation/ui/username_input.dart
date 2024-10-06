import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:poster/core/ui/theme/app.dart';
import 'package:poster/core/ui/theme/images.dart';
import 'package:poster/feature/auth/component/mod.dart';
import 'package:universal_platform/universal_platform.dart';

const _cancelIconAnimDuration = Duration(milliseconds: 100);

final class UsernameInput extends StatefulWidget {
  const UsernameInput({super.key});

  @override
  State<StatefulWidget> createState() => _UsernameInputState();
}

final class _UsernameInputState extends State<UsernameInput> {
  final _controller = TextEditingController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = context.read<AppTheme>();
    final strings = AppLocalizations.of(context)!;

    return BlocBuilder<AuthComponent, AuthState>(
      builder: (context, state) {
        final onEvent = context.read<AuthComponent>().add;

        void onChanged(String username) =>
            onEvent(UsernameChanged(username: username));

        void onCleared() => onEvent(UsernameCleared());

        return Container(
          padding: EdgeInsets.symmetric(
            horizontal: theme.dimensions.padding.medium
          ),
          constraints: BoxConstraints(
            maxWidth: theme.dimensions.size.extraEnormous,
          ),
          child: UniversalPlatform.isIOS || UniversalPlatform.isMacOS
            ? cupertinoUsernameInput(theme, strings, onChanged, onCleared)
            : materialUsernameInput(theme, strings, onChanged, onCleared),
        );
      },
    );
  }

  Widget materialUsernameInput(
    AppTheme theme,
    AppLocalizations strings,
    void Function(String) onChanged,
    void Function() onCanceled,
  ) => TextField(
    controller: _controller,
    style: theme.typography.body.copyWith(
      color: theme.colors.text.primary
    ),
    cursorColor: theme.colors.textField.primary,
    decoration: InputDecoration(
      contentPadding: EdgeInsets.symmetric(
        vertical: theme.dimensions.padding.medium,
        horizontal: theme.dimensions.padding.medium,
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: theme.colors.textField.primary,
          width: theme.dimensions.size.line.small,
        )
      ),
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: theme.colors.textField.primary,
        )
      ),
      labelText: strings.sign_in_username,
      labelStyle: theme.typography.regular.copyWith(
        color: theme.colors.textField.primary
      ),
      suffixIcon: AnimatedOpacity(
        opacity: _controller.text.isEmpty ? 0.0 : 1.0,
        duration: _cancelIconAnimDuration,
        child: Container(
          margin: EdgeInsets.only(right: theme.dimensions.padding.medium),
          child: cancelIcon(theme, onCanceled),
        ),
      ),
      suffixIconConstraints: BoxConstraints.expand(
        width: theme.dimensions.size.medium,
        height: theme.dimensions.size.small,
      )
    ),
    onChanged: onChanged,
  );

  Widget cupertinoUsernameInput(
    AppTheme theme,
    AppLocalizations strings,
    void Function(String) onChanged,
    void Function() onCanceled,
  ) => CupertinoTextField(
    controller: _controller,
    placeholder: strings.sign_in_username,
    style: theme.typography.regular.copyWith(
        color: theme.colors.text.primary
    ),
    cursorColor: theme.colors.textField.primary,
    decoration: BoxDecoration(
      border: Border.all(color: theme.colors.textField.primary),
      borderRadius: BorderRadius.all(
          Radius.circular(theme.dimensions.radius.minimum)
      ),
    ),
    onChanged: onChanged,
    suffix: AnimatedOpacity(
      opacity: _controller.text.isEmpty ? 0.0 : 1.0,
      duration: _cancelIconAnimDuration,
      child: Container(
        margin: EdgeInsets.only(right: theme.dimensions.padding.medium),
        child: cancelIcon(theme, onCanceled),
      ),
    ),
    padding: EdgeInsets.symmetric(
      vertical: theme.dimensions.padding.medium,
      horizontal: theme.dimensions.padding.medium,
    ),
  );
  
  Widget cancelIcon(
    AppTheme theme,
    void Function() onClick,
  ) => GestureDetector(
    onTap: () {
      setState(_controller.clear);
      onClick();
    },
    child: Image.asset(
      AppImages.load('ic_cancel.png'),
      width: theme.dimensions.size.small,
      height: theme.dimensions.size.small,
      color: theme.colors.textField.primary,
    ),
  );
}