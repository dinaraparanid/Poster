import 'package:flutter/cupertino.dart';
import 'package:poster/core/presentation/foundation/dialog/app_dialog.dart';
import 'package:poster/core/presentation/foundation/dialog/app_dialog_action.dart';
import 'package:poster/core/presentation/theme/strings.dart';

void showNoConnectionDialog({
  required BuildContext context,
  required VoidCallback onCancel,
  required VoidCallback onOk,
}) {
  final strings = context.strings;

  showAppDialog(
    context: context,
    title: strings.no_connection_dialog_title,
    body: Text(strings.no_connection_dialog_description),
    actions: [
      AppDialogAction(text: strings.ok, onClick: onOk, isDefaultAction: true),
    ],
  );
}
