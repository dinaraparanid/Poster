import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:poster/core/domain/paging/paging_config.dart';
import 'package:poster/core/domain/post/entity/post.dart';
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
    required FeedPostPagingSourceFactory feedPostPagingSourceFactory,
  }) : pager = paging_lib.Pager(
      config: const paging_lib.PagingConfig(pageSize: PagingConfig.defaultPageSize),
      pagingSourceFactory: () => feedPostPagingSourceFactory.create(),
    ), super(FeedState.initial()) {

    on<Refresh>((event, emit) => pager.refresh());

    on<UpdateProfile>(
      (event, emit) => emit(state.copyWith(profileState: event.profileState))
    );

    on<Like>(
      (event, emit) async {
        final username = state.profileState.getOrNull?.username;
        if (username == null) return;

        // TODO: like
        //await postRepository.likePost(username: username, messageId: event.postId);
        // TODO: error handling
        add(Refresh());
      }
    );

    profileChangesUseCase.subscribe(
      onChanged: (profileState) => add(UpdateProfile(profileState: profileState))
    );
  }
}
