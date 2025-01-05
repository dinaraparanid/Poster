import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:poster/core/presentation/foundation/dialog/app_dialog_action.dart';
import 'package:poster/core/presentation/theme/mod.dart';

void showAppDialog({
  required BuildContext context,
  required String title,
  required Widget Function(BuildContext, void Function(void Function())) bodyBuilder,
  required List<AppDialogAction> Function(BuildContext, void Function(void Function())) actionsBuilder,
  void Function()? onCancel,
}) {
  final theme = context.read<AppTheme>();

  showAdaptiveDialog(
    context: context,
    builder: (context) => PopScope(
      onPopInvokedWithResult: (_, __) => onCancel?.call(),
      child: StatefulBuilder(
        builder: (context, setState) => AlertDialog.adaptive(
          title: Text(title),
          titleTextStyle: theme.typography.h.h4.copyWith(
            color: theme.colors.text.primary,
          ),
          content: bodyBuilder(context, setState),
          actions: actionsBuilder(context, setState),
          backgroundColor: theme.colors.background.primary,
        ),
      ),
    ),
  );
}
