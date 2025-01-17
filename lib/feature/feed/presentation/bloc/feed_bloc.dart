import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:poster/core/domain/paging/paging_config.dart';
import 'package:poster/core/domain/post/entity/post.dart';
import 'package:poster/core/domain/post/use_case/like_use_case.dart';
import 'package:poster/core/domain/profile/use_case/subscribe_on_profile_changes_use_case.dart';
import 'package:poster/core/presentation/foundation/ui_state.dart';
import 'package:poster/feature/feed/data/feed_post_paging_source_factory.dart';
import 'package:poster/feature/feed/presentation/bloc/feed_event.dart';
import 'package:poster/feature/feed/presentation/bloc/feed_state.dart';
import 'package:super_paging/super_paging.dart' as paging_lib;

final class FeedBloc extends Bloc<FeedEvent, FeedState> {
  final paging_lib.Pager<int, Post> pager;

  FeedBloc({
    required SubscribeOnProfileChangesUseCase profileChangesUseCase,
    required LikeUseCase likeUseCase,
    required FeedPostPagingSourceFactory pagingSourceFactory,
  }) : pager = paging_lib.Pager(
    config: const paging_lib.PagingConfig(pageSize: PagingConfig.defaultPageSize),
    pagingSourceFactory: () => pagingSourceFactory.create(),
  ), super(FeedState.initial()) {

    on<Refresh>((event, emit) => pager.refresh());

    on<UpdateProfile>(
      (event, emit) => emit(state.copyWith(profileState: event.profileState))
    );

    on<Like>(
      (event, emit) async {
        final email = state.profileState.getOrNull?.email;
        if (email == null) return;

        likeUseCase.switchLikeForPost(
          email: email,
          postId: event.postId,
          onSuccess: (_) {
            // TODO: Success snackbar
            add(Refresh());
          },
          onError: (_) {
            // TODO: Error Snackbar
          },
        );
      }
    );

    on<Share>(
      (event, emit) async {
        // TODO: Share
      }
    );

    profileChangesUseCase.subscribe(
      onChanged: (profileState) => add(UpdateProfile(profileState: profileState))
    );
  }
}
