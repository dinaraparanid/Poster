import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:poster/core/presentation/foundation/app_text_field.dart';
import 'package:poster/core/presentation/foundation/dialog/app_dialog.dart';
import 'package:poster/core/presentation/foundation/dialog/app_dialog_action.dart';
import 'package:poster/core/presentation/theme/app.dart';
import 'package:poster/core/presentation/theme/images.dart';
import 'package:poster/core/presentation/theme/strings.dart';

const _messageTextFieldMaxLines = 8;

void showNewMessageDialog({
  required TextEditingController controller,
  required BuildContext context,
  required bool Function() canSend,
  required void Function(String) onMessageChanged,
  required void Function() onMessageCleared,
  required void Function() onSend,
  required void Function() onCancel,
}) {
  final theme = context.read<AppTheme>();
  final strings = context.strings;

  showAppDialog(
    context: context,
    title: strings.main_new_message_dialog_title,
    onCancel: onCancel,
    bodyBuilder: (_, setState) => _Body(
      controller: controller,
      strings: strings,
      onMessageCleared: onMessageCleared,
      onMessageChanged: (msg) {
        onMessageChanged(msg);
        setState(() {});
      },
    ),
    actionsBuilder: (_, __) => _Actions(
      theme: theme,
      strings: strings,
      canSend: canSend(),
      onSend: onSend,
      onCancel: onCancel,
    ),
  );
}

Widget _Body({
  required TextEditingController controller,
  required AppLocalizations strings,
  required void Function(String) onMessageChanged,
  required void Function() onMessageCleared,
}) => AppTextField(
  controller: controller,
  label: strings.main_new_message_dialog_label,
  icon: AppImages.loadSvg('ic_cancel'),
  maxLines: _messageTextFieldMaxLines,
  onChanged: (text) => onMessageChanged(text),
  onIconClicked: () {
    onMessageCleared();
    controller.clear();
  },
);

List<AppDialogAction> _Actions({
  required AppTheme theme,
  required AppLocalizations strings,
  required bool canSend,
  required void Function() onSend,
  required void Function() onCancel,
}) => [
  AppDialogAction(
    text: strings.cancel,
    onClick: onCancel,
    isDestructiveAction: true,
  ),

  AppDialogAction(
    text: strings.send,
    onClick: canSend ? onSend : null,
    isDefaultAction: true,
  ),
];
