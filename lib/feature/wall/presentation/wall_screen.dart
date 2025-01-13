import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:poster/core/presentation/theme/app.dart';
import 'package:poster/feature/wall/presentation/bloc/mod.dart';
import 'package:poster/feature/wall/presentation/widget/profile/profile_container.dart';
import 'package:poster/feature/wall/presentation/widget/profile_posts.dart';

final class WallScreen extends StatelessWidget {
  final WallBloc bloc;
  const WallScreen({super.key, required this.bloc});

  @override
  Widget build(BuildContext context) {
    final theme = context.read<AppTheme>();

    return BlocProvider(
      create: (context) => bloc,
      child: BlocBuilder<WallBloc, WallState>(
        builder: (context, state) => SizedBox(
          width: double.infinity,
          child: RefreshIndicator(
            color: theme.colors.indicator.primary,
            backgroundColor: theme.colors.indicator.background,
            onRefresh: () async => bloc.add(Refresh()),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const ProfileContainer(),
                Expanded(
                  child: ProfilePosts(
                    pager: bloc.pager,
                    onEvent: bloc.add,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
