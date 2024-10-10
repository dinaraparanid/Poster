import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:poster/core/ui/foundation/post/list.dart';
import 'package:poster/core/ui/theme/app.dart';
import 'package:poster/feature/wall/component/mod.dart';
import 'package:poster/feature/wall/presentation/ui/mod.dart';

final class WallScreen extends StatelessWidget {
  const WallScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = context.read<AppTheme>();

    return BlocProvider(
      create: (context) => WallComponent(
        authRepository: context.read(),
        postRepository: context.read(),
      ),
      child: BlocBuilder<WallComponent, WallState>(
        builder: (context, state) {
          final onEvent = context.read<WallComponent>().add;

          return SizedBox(
            width: double.infinity,
            child: RefreshIndicator(
              color: theme.colors.indicator.primary,
              backgroundColor: theme.colors.indicator.background,
              onRefresh: () async => onEvent(Refresh()),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const ProfileContainer(),
                  Expanded(
                    child: PostList(
                      postsState: state.postsState,
                      onPostLike: (id) => onEvent(Like(postId: id)),
                    )
                  ),
                ],
              ),
            ),
          );
        }
      ),
    );
  }
}
