import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:poster/core/ui/theme/app.dart';
import 'package:poster/feature/wall/component/mod.dart';
import 'package:poster/feature/wall/presentation/ui/post_list.dart';
import 'package:poster/feature/wall/presentation/ui/profile/container.dart';
import 'package:poster/utils/functions/do_nothing.dart';

final class WallScreen extends StatelessWidget {
  const WallScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = context.read<AppTheme>();

    return BlocProvider(
      create: (context) => WallComponent(repository: context.read()),
      child: SizedBox(
        width: double.infinity,
        child: RefreshIndicator(
          color: theme.colors.indicator.primary,
          backgroundColor: theme.colors.indicator.background,
          onRefresh: () async {
            // TODO: refresh
            doNothing;
          },
          child: const Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ProfileContainer(),
              Expanded(child: PostList()),
            ],
          ),
        ),
      ),
    );
  }
}
