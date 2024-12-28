import 'package:flutter/cupertino.dart';
import 'package:poster/core/presentation/foundation/dialog/app_dialog.dart';
import 'package:poster/core/presentation/foundation/dialog/app_dialog_action.dart';
import 'package:poster/core/presentation/theme/strings.dart';

void showProfileNotFoundDialog({
  required BuildContext context,
  required VoidCallback onCancel,
  required VoidCallback onOk,
}) {
  final strings = context.strings;

  showAppDialog(
    context: context,
    title: strings.auth_dialog_title_profile_not_found,
    body: Text(strings.auth_dialog_description_sign_up(strings.app_name)),
    actions: [
      AppDialogAction(text: strings.cancel, onClick: onCancel),
      AppDialogAction(text: strings.ok, onClick: onOk, isDefaultAction: true),
    ],
  );
}
