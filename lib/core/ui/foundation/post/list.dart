import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:poster/core/ui/foundation/post/block.dart';
import 'package:poster/core/ui/theme/app.dart';
import 'package:poster/domain/post/post.dart';

final class PostList extends StatelessWidget {
  final List<Post> posts;

  const PostList({
    super.key,
    required this.posts,
  });

  @override
  Widget build(BuildContext context) {
    final theme = context.read<AppTheme>();

    // TODO: empty stub

    return ListView.separated(
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
  }
}
