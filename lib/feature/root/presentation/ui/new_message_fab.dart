import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:poster/core/ui/theme/app.dart';
import 'package:poster/core/ui/theme/images.dart';
import 'package:poster/feature/root/component/mod.dart';

final class NewMessageFab extends StatelessWidget {
  const NewMessageFab({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = context.read<AppTheme>();

    return BlocBuilder<RootComponent, RootState>(
      builder: (context, state) {
        final onEvent = context.read<RootComponent>().add;

        return FloatingActionButton(
          backgroundColor: theme.colors.button.fab.background,
          onPressed: () => onEvent(
            UpdateNewMessageDialogVisibility(isVisible: true)
          ),
          shape: const CircleBorder(),
          child: Image.asset(
            AppImages.load('send_message.png'),
            color: theme.colors.button.fab.content,
            width: theme.dimensions.size.small,
            height: theme.dimensions.size.small,
          ),
        );
      }
    );
  }
}
