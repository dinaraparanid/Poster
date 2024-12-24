import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:poster/core/presentation/theme/app.dart';
import 'package:poster/core/presentation/theme/images.dart';
import 'package:poster/di/app_module.dart';
import 'package:poster/feature/root/presentation/bloc/mod.dart';

final class NewMessageFab extends StatelessWidget {
  const NewMessageFab({super.key});

  @override
  Widget build(BuildContext context) {
    final bloc = di<RootBloc>();
    final theme = di<AppTheme>();

    return BlocBuilder<RootBloc, RootState>(
      builder: (context, state) => FloatingActionButton(
        backgroundColor: theme.colors.button.fab.background,
        onPressed: () => bloc.add(
          UpdateNewMessageDialogVisibility(isVisible: true)
        ),
        shape: const CircleBorder(),
        child: Image.asset(
          AppImages.loadPng('send_message').value,
          color: theme.colors.button.fab.content,
          width: theme.dimensions.size.small,
          height: theme.dimensions.size.small,
        ),
      ),
    );
  }
}
