import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:poster/core/domain/post/entity/post.dart';
import 'package:poster/core/presentation/foundation/ui_state.dart';
import 'package:poster/core/presentation/post/block.dart';
import 'package:poster/core/presentation/theme/app.dart';

final class PostList extends StatelessWidget {
  final UiState<List<Post>> postsState;
  final void Function(int postId) onPostLike;

  const PostList({
    super.key,
    required this.postsState,
    required this.onPostLike,
  });

  @override
  Widget build(BuildContext context) {
    final theme = context.read<AppTheme>();

    return switch (postsState) {
      Initial<List<Post>>() => LoadingStub(theme: theme),

      Loading<List<Post>>() => LoadingStub(theme: theme),

      Refreshing<List<Post>>(value: final state) => switch (state) {
        Data<List<Post>>(value: final posts) =>
            Content(posts: posts, theme: theme, onPostLike: onPostLike),

        _ => LoadingStub(theme: theme),
      },

      Data<List<Post>>(value: final posts) =>
          Content(posts: posts, theme: theme, onPostLike: onPostLike),

      Success<List<Post>>() => Container(),

      Error<List<Post>>() => const Text('TODO: Error stub'),
    };
  }

  Widget Content({
    required List<Post> posts,
    required AppTheme theme,
    required void Function (int postId) onPostLike,
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
    itemBuilder: (context, index) => PostBlock(
      post: posts[index],
      onLike: () => onPostLike(posts[index].id),
    ),
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
