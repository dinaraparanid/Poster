import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:poster/core/domain/post/entity/post.dart';
import 'package:poster/core/presentation/foundation/app_empty_stub.dart';
import 'package:poster/core/presentation/post/post_item.dart';
import 'package:poster/core/presentation/post/post_shimmer.dart';
import 'package:poster/core/presentation/theme/app.dart';
import 'package:super_paging/super_paging.dart';

final class PostPagingList extends StatelessWidget {
  static const _shimmerItemsAmount = 10;

  final Pager<int, Post> pager;
  final void Function(String postId) onPostLike;
  final void Function(String postText) onPostShare;

  const PostPagingList({
    super.key,
    required this.pager,
    required this.onPostLike,
    required this.onPostShare,
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
      separatorBuilder: (_, __) => ItemSeparator(theme: theme),
      itemBuilder: (context, index) {
        final post = pager.items.elementAt(index);
        return PostItem(
          post: post,
          onLike: () => onPostLike(post.id),
          onShare: () => onPostShare(post.data.text),
        );
      },
      emptyBuilder: (_) => const AppEmptyStub(),
      loadingBuilder: (_) => LoadingStub(theme: theme),
      errorBuilder: (_, __) => const Text('TODO: error stub'),
    );
  }

  Widget LoadingStub({required AppTheme theme}) =>
    ListView.separated(
      itemCount: _shimmerItemsAmount,
      itemBuilder: (_, __) => const PostShimmer(),
      separatorBuilder: (_, __) => ItemSeparator(theme: theme),
    );

  Widget ItemSeparator({required AppTheme theme}) =>
    SizedBox(height: theme.dimensions.padding.big);
}
