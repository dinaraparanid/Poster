import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:poster/core/ui/foundation/post/block.dart';
import 'package:poster/core/ui/foundation/ui_state.dart';
import 'package:poster/core/ui/theme/app.dart';
import 'package:poster/domain/post/post.dart';

final class PostList extends StatelessWidget {
  final UiState<List<Post>> postsState;

  const PostList({
    super.key,
    required this.postsState,
  });

  @override
  Widget build(BuildContext context) {
    final theme = context.read<AppTheme>();

    return switch (postsState) {
      Initial<List<Post>>() => LoadingStub(theme: theme),

      Loading<List<Post>>() => LoadingStub(theme: theme),

      Refreshing<List<Post>>(value: final state) => switch (state) {
        Data<List<Post>>(value: final posts) =>
          Content(posts: posts, theme: theme),

        _ => LoadingStub(theme: theme),
      },

      Data<List<Post>>(value: final posts) =>
        Content(posts: posts, theme: theme),

      Success<List<Post>>() => Container(),

      Error<List<Post>>() => const Text("TODO: Error stub"),
    };
  }

  Widget Content({
    required List<Post> posts,
    required AppTheme theme,
  }) => ListView.separated(
    itemCount: posts.length,
    padding: EdgeInsets.only(
      top: theme.dimensions.padding.big,
      bottom: theme.dimensions.padding.enormous,
      right: theme.dimensions.padding.medium,
      left: theme.dimensions.padding.medium
    ),
    separatorBuilder: (context, index) => SizedBox(
      height: theme.dimensions.padding.big,
    ),
    itemBuilder: (context, index) => PostBlock(post: posts[index]),
  );

  Widget LoadingStub({required AppTheme theme}) => Container(
    alignment: Alignment.center,
    width: double.infinity,
    height: double.infinity,
    padding: EdgeInsets.only(
      bottom: theme.dimensions.padding.extraEnormous,
    ),
    child: CircularProgressIndicator(
      color: theme.colors.indicator.primary,
    ),
  );
}
