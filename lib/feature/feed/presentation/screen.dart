import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:poster/core/ui/foundation/post/list.dart';
import 'package:poster/core/ui/theme/app.dart';
import 'package:poster/feature/feed/component/mod.dart';

final class FeedScreen extends StatelessWidget {
  const FeedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = context.read<AppTheme>();

    return BlocProvider(
      create: (context) => FeedComponent(repository: context.read()),
      child: BlocBuilder<FeedComponent, FeedState>(
        builder: (context, state) {
          final onEvent = context.read<FeedComponent>().add;

          return SizedBox(
            width: double.infinity,
            child: RefreshIndicator(
              color: theme.colors.indicator.primary,
              backgroundColor: theme.colors.indicator.background,
              onRefresh: () async => onEvent(Refresh()),
              child: PostList(posts: state.posts),
            ),
          );
        },
      ),
    );
  }
}
