import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:poster/core/presentation/theme/app.dart';
import 'package:poster/di/app_module.dart';
import 'package:universal_platform/universal_platform.dart';

final class AppButton extends StatelessWidget {
  final theme = di<AppTheme>();

  final bool enabled;
  final void Function() onClick;
  final Widget child;

  AppButton({
    super.key,
    required this.enabled,
    required this.onClick,
    required this.child,
  });

  @override
  Widget build(BuildContext context) => Container(
    width: double.infinity,
    margin: EdgeInsets.symmetric(horizontal: theme.dimensions.padding.medium),
    constraints: BoxConstraints(
      maxWidth: theme.dimensions.size.extraEnormous,
    ),
    child: UniversalPlatform.isIOS || UniversalPlatform.isMacOS
      ? cupertinoUi(theme)
      : materialUi(theme),
  );

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
