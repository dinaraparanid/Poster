import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:poster/core/domain/post/entity/post.dart';
import 'package:poster/core/presentation/foundation/ui_state.dart';
import 'package:poster/core/presentation/post/post_paging_list.dart';
import 'package:poster/feature/wall/presentation/bloc/mod.dart';
import 'package:super_paging/super_paging.dart';

final class ProfilePosts extends StatelessWidget {
  final Pager<int, Post> pager;
  final void Function(WallEvent) onEvent;

  const ProfilePosts({
    super.key,
    required this.pager,
    required this.onEvent,
  });

  @override
  Widget build(BuildContext context) =>
    BlocBuilder<WallBloc, WallState>(
      builder: (context, state) {
        if (state.profileState.isEvaluating) {
          return const Text('TODO: Shimmers');
        }

        return PostPagingList(
          pager: pager,
          onPostLike: (id) => onEvent(Like(postId: id)),
          onPostShare: (text) => onEvent(Share(postText: text)),
        );
      },
    );
}