import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:poster/core/domain/post/entity/post.dart';
import 'package:poster/core/presentation/foundation/app_empty_stub.dart';
import 'package:poster/core/presentation/post/post_block.dart';
import 'package:poster/core/presentation/theme/app.dart';
import 'package:super_paging/super_paging.dart';

final class PostPagingList extends StatelessWidget {
  final Pager<int, Post> pager;
  final void Function(String postId) onPostLike;

  const PostPagingList({
    super.key,
    required this.pager,
    required this.onPostLike,
  });

  @override
  Widget build(BuildContext context) {
    final theme = context.read<AppTheme>();

    return PagingListView.separated(
      pager: pager,
      padding: EdgeInsets.only(
        top: theme.dimensions.padding.big,
        bottom: theme.dimensions.padding.enormous,
        right: theme.dimensions.padding.medium,
        left: theme.dimensions.padding.medium
      ),
      separatorBuilder: (context, index) => SizedBox(
        height: theme.dimensions.padding.big,
      ),
      itemBuilder: (context, index) {
        final post = pager.items.elementAt(index);
        return PostBlock(
          post: post,
          onLike: () => onPostLike(post.id),
        );
      },
      emptyBuilder: (_) => const AppEmptyStub(),
      loadingBuilder: (_) => LoadingStub(theme: theme),
      errorBuilder: (_, __) => const Text('TODO: error stub'),
    );
  }

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
