import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:poster/core/presentation/foundation/dialog/app_dialog_action.dart';
import 'package:poster/core/presentation/foundation/platform_ui.dart';
import 'package:poster/core/presentation/theme/mod.dart';

void showAppDialog({
  required BuildContext context,
  required String title,
  required Widget? body,
  required List<AppDialogAction> actions,
}) => PlatformUi(
  cupertino: _showCupertinoAlertDialog,
  material: _showMaterialAlertDialog,
)(
  context: context,
  title: title,
  body: body,
  actions: actions,
);

void _showCupertinoAlertDialog({
  required BuildContext context,
  required String title,
  required Widget? body,
  required List<AppDialogAction> actions,
}) => showCupertinoDialog(
  context: context,
  builder: (context) => CupertinoAlertDialog(
    title: Text(title),
    content: body,
    actions: actions,
  ),
);

void _showMaterialAlertDialog({
  required BuildContext context,
  required String title,
  required Widget? body,
  required List<AppDialogAction> actions,
}) {
  final theme = context.read<AppTheme>();

  showDialog(
    context: context,
    builder: (context) => AlertDialog(
      title: Text(title),
      titleTextStyle: theme.typography.h.h4.copyWith(
        color: theme.colors.text.primary,
      ),
      content: body,
      actions: actions,
      backgroundColor: theme.colors.background.primary,
    )
  );
}
