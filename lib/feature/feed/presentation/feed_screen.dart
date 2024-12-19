import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:poster/core/presentation/post/list.dart';
import 'package:poster/core/presentation/theme/app.dart';
import 'package:poster/di/app_module.dart';
import 'package:poster/feature/feed/presentation/bloc/mod.dart';

final class FeedScreen extends StatelessWidget {
  final bloc = di<FeedBloc>();
  final theme = di<AppTheme>();

  FeedScreen({super.key});

  @override
  Widget build(BuildContext context) => BlocProvider(
    create: (context) => bloc,
    child: BlocBuilder<FeedBloc, FeedState>(
      builder: (context, state) {
        final onEvent = bloc.add;

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
