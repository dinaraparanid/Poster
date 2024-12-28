import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:poster/core/presentation/foundation/platform_ui.dart';
import 'package:poster/core/presentation/theme/mod.dart';

final class AppDialogAction extends StatelessWidget {
  final String text;
  final VoidCallback onClick;
  final bool isDefaultAction;
  final bool isDestructiveAction;

  const AppDialogAction({
    super.key,
    required this.text,
    required this.onClick,
    this.isDefaultAction = false,
    this.isDestructiveAction = false,
  });

  @override
  Widget build(BuildContext context) =>
    PlatformUi(cupertino: CupertinoUi, material: MaterialUi)(context);

  Widget CupertinoUi(BuildContext context) {
    final theme = context.read<AppTheme>();
    return CupertinoDialogAction(
      onPressed: () {
        onClick();
        Navigator.pop(context);
      },
      isDefaultAction: isDefaultAction,
      isDestructiveAction: isDestructiveAction,
      child: Text(text, style: TextStyle(color: theme.colors.text.clickable)),
    );
  }

  Widget MaterialUi(BuildContext context) {
    final theme = context.read<AppTheme>();
    return TextButton(
      onPressed: () {
        onClick();
        Navigator.pop(context);
      },
      child: Text(
        text,
        style: theme.typography.regular.copyWith(
          color: theme.colors.text.clickable,
        ),
      ),
    );
  }
}
