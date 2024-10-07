import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:poster/core/ui/foundation/text_field.dart';
import 'package:poster/core/ui/theme/app.dart';
import 'package:universal_platform/universal_platform.dart';

void onShowNewMessageDialog({
  required BuildContext context,
  required AppTheme theme,
  required AppLocalizations strings,
  required void Function(String) onMessageChanged,
  required void Function() onSend,
  required void Function() onCancel,
}) {
  if (UniversalPlatform.isIOS || UniversalPlatform.isMacOS) {
    _showCupertinoNewMessageDialog(
      context: context,
      theme: theme,
      strings: strings,
      onMessageChanged: onMessageChanged,
      onSend: onSend,
      onCancel: onCancel,
    );
  } else {
    _showMaterialNewMessageDialog(
      context: context,
      theme: theme,
      strings: strings,
      onMessageChanged: onMessageChanged,
      onSend: onSend,
      onCancel: onCancel,
    );
  }
}

void _showCupertinoNewMessageDialog({
  required BuildContext context,
  required AppTheme theme,
  required AppLocalizations strings,
  required void Function(String) onMessageChanged,
  required void Function() onSend,
  required void Function() onCancel,
}) => showCupertinoDialog(
  context: context,
  builder: (context) => CupertinoAlertDialog(
    title: Text(
      strings.root_new_message_dialog_title,
      style: theme.typography.body.copyWith(
        color: theme.colors.text.header,
      ),
    ),
    content: _body(strings: strings, onMessageChanged: onMessageChanged),
    actions: _actions(
      theme: theme,
      strings: strings,
      onSend: onSend,
      onCancel: onCancel,
    ),
  ),
);

void _showMaterialNewMessageDialog({
  required BuildContext context,
  required AppTheme theme,
  required AppLocalizations strings,
  required void Function(String) onMessageChanged,
  required void Function() onSend,
  required void Function() onCancel,
}) => showDialog(
  context: context,
  builder: (context) => AlertDialog(
    backgroundColor: theme.colors.background.primary,
    title: Text(
      strings.root_new_message_dialog_title,
      style: theme.typography.body.copyWith(
        color: theme.colors.text.header,
      ),
    ),
    content: _body(strings: strings, onMessageChanged: onMessageChanged),
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

Widget _body({
  required AppLocalizations strings,
  required void Function(String) onMessageChanged,
}) => AppTextField(
  label: strings.root_new_message_dialog_label,
  onChanged: onMessageChanged,
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
