import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:poster/core/presentation/theme/app.dart';
import 'package:poster/di/app_module.dart';
import 'package:poster/feature/wall/presentation/bloc/mod.dart';
import 'package:poster/feature/wall/presentation/widget/profile/profile_container.dart';

final class WallScreen extends StatelessWidget {
  final bloc = di<WallBloc>();
  final theme = di<AppTheme>();

  WallScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
                ProfileContainer(),
                // TODO:
                // Expanded(
                //   child: PostList(
                //     postsState: state.postsState,
                //     onPostLike: (id) => bloc.add(Like(postId: id)),
                //   )
                // ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
