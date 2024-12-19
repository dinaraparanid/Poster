import 'package:flutter/material.dart';
import 'package:poster/core/presentation/theme/app.dart';
import 'package:poster/di/app_module.dart';

final class AppClickable extends StatelessWidget {
  final theme = di<AppTheme>();

  final void Function() onClick;
  final ShapeBorder? border;
  final Color? rippleColor;
  final Widget child;

  AppClickable({
    super.key,
    required this.onClick,
    this.border,
    this.rippleColor,
    required this.child,
  });

  @override
  Widget build(BuildContext context) => Material(
    color: Colors.transparent,
    child: InkWell(
      onTap: onClick,
      customBorder: border,
      splashColor: rippleColor ?? theme.colors.button.ripple,
      child: Ink(
        child: IgnorePointer(
          child: Padding(
            padding: EdgeInsets.all(theme.dimensions.size.minimum),
            child: child,
          ),
        ),
      ),
    ),
  );
}
