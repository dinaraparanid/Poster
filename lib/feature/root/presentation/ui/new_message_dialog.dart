import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:poster/core/ui/foundation/text_field.dart';
import 'package:poster/core/ui/theme/app.dart';
import 'package:poster/utils/functions/do_nothing.dart';

void showCupertinoNewMessageDialog({
  required BuildContext context,
  required AppTheme theme,
  required AppLocalizations strings,
  required void Function(String) onMessageChanged,
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
    actions: _actions(theme: theme, strings: strings),
  ),
);

void showMaterialNewMessageDialog({
  required BuildContext context,
  required AppTheme theme,
  required AppLocalizations strings,
  required void Function(String) onMessageChanged,
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
    actions: _actions(theme: theme, strings: strings),
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
}) => [
  _action(theme: theme, text: strings.cancel, onPressed: doNothing),
  _action(theme: theme, text: strings.send, onPressed: doNothing),
];

TextButton _action({
  required AppTheme theme,
  required String text,
  required Function() onPressed,
}) => TextButton(
  onPressed: doNothing,
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
