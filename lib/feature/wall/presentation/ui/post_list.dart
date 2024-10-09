import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:poster/core/ui/foundation/post.dart';
import 'package:poster/core/ui/theme/app.dart';
import 'package:poster/feature/wall/component/mod.dart';

final class PostList extends StatelessWidget {
  const PostList({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = context.read<AppTheme>();

    // TODO: empty stub

    return BlocBuilder<WallComponent, WallState>(
      builder: (context, state) => ListView.separated(
        itemCount: state.posts.length,
        padding: EdgeInsets.only(
          top: theme.dimensions.padding.big,
          bottom: theme.dimensions.padding.enormous,
          right: theme.dimensions.padding.medium,
          left: theme.dimensions.padding.medium
        ),
        separatorBuilder: (context, index) => SizedBox(
          height: theme.dimensions.padding.big,
        ),
        itemBuilder: (context, index) => PostBlock(post: state.posts[index]),
      ),
    );
  }
}
