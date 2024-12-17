import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:poster/core/presentation/theme/app.dart';
import 'package:poster/feature/feed/component/mod.dart';
import 'package:poster/core/presentation/post/list.dart';

final class FeedScreen extends StatelessWidget {
  const FeedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = context.read<AppTheme>();

    return BlocProvider(
      create: (context) => FeedComponent(
        profileRepository: context.read(),
        postRepository: context.read(),
      ),
      child: BlocBuilder<FeedComponent, FeedState>(
        builder: (context, state) {
          final onEvent = context.read<FeedComponent>().add;

          return SizedBox(
            width: double.infinity,
            child: RefreshIndicator(
              color: theme.colors.indicator.primary,
              backgroundColor: theme.colors.indicator.background,
              onRefresh: () async => onEvent(Refresh()),
              child: PostList(
                postsState: state.postsState,
                onPostLike: (id) => onEvent(Like(postId: id)),
              ),
            ),
          );
        },
      ),
    );
  }
}
