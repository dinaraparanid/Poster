import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:poster/core/presentation/foundation/app_text_field.dart';
import 'package:poster/core/presentation/theme/app.dart';
import 'package:poster/core/presentation/theme/images.dart';
import 'package:universal_platform/universal_platform.dart';

void showNewMessageDialog({
  required TextEditingController controller,
  required BuildContext context,
  required void Function(String) onMessageChanged,
  required void Function() onSend,
  required void Function() onCancel,
}) {
  final showDialog = UniversalPlatform.isIOS || UniversalPlatform.isMacOS
    ? _showCupertinoNewMessageDialog : _showMaterialNewMessageDialog;

  showDialog(
    controller: controller,
    context: context,
    onMessageChanged: onMessageChanged,
    onSend: onSend,
    onCancel: onCancel,
  );
}

void _showCupertinoNewMessageDialog({
  required TextEditingController controller,
  required BuildContext context,
  required void Function(String) onMessageChanged,
  required void Function() onSend,
  required void Function() onCancel,
}) {
  final theme = context.read<AppTheme>();
  final strings = AppLocalizations.of(context)!;

  showCupertinoDialog(
    context: context,
    builder: (context) => CupertinoAlertDialog(
      title: Text(
        strings.main_new_message_dialog_title,
        style: theme.typography.body.copyWith(
          color: theme.colors.text.header,
        ),
      ),
      content: _body(
        controller: controller,
        strings: strings,
        onMessageChanged: onMessageChanged,
      ),
      actions: _actions(
        theme: theme,
        strings: strings,
        onSend: () {
          onSend();
          Navigator.pop(context);
        },
        onCancel: () {
          onCancel();
          Navigator.pop(context);
        },
      ),
    ),
  );
}

void _showMaterialNewMessageDialog({
  required TextEditingController controller,
  required BuildContext context,
  required void Function(String) onMessageChanged,
  required void Function() onSend,
  required void Function() onCancel,
}) {
  final theme = context.read<AppTheme>();
  final strings = AppLocalizations.of(context)!;

  showDialog(
    context: context,
    barrierDismissible: false,
    builder: (context) => AlertDialog(
      backgroundColor: theme.colors.background.primary,
      title: Text(
        strings.main_new_message_dialog_title,
        style: theme.typography.body.copyWith(
          color: theme.colors.text.header,
        ),
      ),
      content: _body(
        controller: controller,
        strings: strings,
        onMessageChanged: onMessageChanged,
      ),
      actions: _actions(
        theme: theme,
        strings: strings,
        onSend: () {
          onSend();
          Navigator.pop(context);
        },
        onCancel: () {
          onCancel();
          Navigator.pop(context);
        },
      ),
    ),
  );
}

Widget _body({
  required TextEditingController controller,
  required AppLocalizations strings,
  required void Function(String) onMessageChanged,
}) => AppTextField(
  controller: controller,
  label: strings.main_new_message_dialog_label,
  icon: AppImages.loadSvg('ic_cancel'),
  onChanged: (text) {
    onMessageChanged(text);
    controller.clear();
  },
);

List<Widget> _actions({
  required AppTheme theme,
  required AppLocalizations strings,
  required void Function() onSend,
  required void Function() onCancel,
}) => [
  _action(
    theme: theme,
    text: strings.cancel,
    onPressed: onCancel,
  ),

  _action(
    theme: theme,
    text: strings.send,
    onPressed: onSend,
  ),
];

TextButton _action({
  required AppTheme theme,
  required String text,
  required void Function() onPressed,
}) => TextButton(
  onPressed: onPressed,
  style: TextButton.styleFrom(
    overlayColor: theme.colors.text.primary,
  ),
  child: Text(
    text,
    textAlign: TextAlign.center,
    style: theme.typography.regular.copyWith(
      color: theme.colors.text.primary,
    ),
  ),
);
