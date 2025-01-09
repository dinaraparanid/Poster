import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:poster/core/presentation/post/post_paging_list.dart';
import 'package:poster/core/presentation/theme/app.dart';
import 'package:poster/feature/feed/presentation/bloc/mod.dart';

final class FeedScreen extends StatelessWidget {
  final FeedBloc bloc;
  const FeedScreen({super.key, required this.bloc});

  void onEvent(FeedEvent event) => bloc.add(event);

  @override
  Widget build(BuildContext context) {
    final theme = context.read<AppTheme>();

    return BlocProvider(
      create: (context) => bloc,
      child: BlocBuilder<FeedBloc, FeedState>(
        builder: (context, state) => SizedBox(
          width: double.infinity,
          child: RefreshIndicator(
            color: theme.colors.indicator.primary,
            backgroundColor: theme.colors.indicator.background,
            onRefresh: () async => bloc.add(Refresh()),
            child: PostPagingList(
              pager: bloc.pager,
              onPostLike: (id) => onEvent(Like(postId: id)),
            ),
          ),
        ),
      ),
    );
  }
}
