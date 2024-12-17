import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:poster/core/presentation/theme/app.dart';
import 'package:universal_platform/universal_platform.dart';

final class AppButton extends StatelessWidget {
  final bool enabled;
  final void Function() onClick;
  final Widget child;

  const AppButton({
    super.key,
    required this.enabled,
    required this.onClick,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    final theme = context.read<AppTheme>();

    return Container(
      width: double.infinity,
      margin: EdgeInsets.symmetric(horizontal: theme.dimensions.padding.medium),
      constraints: BoxConstraints(
        maxWidth: theme.dimensions.size.extraEnormous,
      ),
      child: UniversalPlatform.isIOS || UniversalPlatform.isMacOS
        ? cupertinoUi(theme)
        : materialUi(theme),
    );
  }

  Widget materialUi(AppTheme theme) => ElevatedButton(
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
    child: child,
  );

  Widget cupertinoUi(AppTheme theme) => CupertinoButton(
    onPressed: enabled ? onClick : null,
    color: theme.colors.button.primary,
    disabledColor: theme.colors.button.disabled,
    borderRadius: BorderRadius.all(
      Radius.circular(theme.dimensions.radius.small),
    ),
    child: child,
  );
}
