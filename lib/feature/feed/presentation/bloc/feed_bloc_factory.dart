import 'package:poster/core/domain/post/use_case/like_use_case.dart';
import 'package:poster/core/domain/profile/use_case/subscribe_on_profile_changes_use_case.dart';
import 'package:poster/feature/feed/data/feed_post_paging_source_factory.dart';
import 'package:poster/feature/feed/presentation/bloc/feed_bloc.dart';

final class FeedBlocFactory {
  final SubscribeOnProfileChangesUseCase _profileChangesUseCase;
  final LikeUseCase _likeUseCase;
  final FeedPostPagingSourceFactory _feedPostPagingSourceFactory;

  FeedBlocFactory({
    required SubscribeOnProfileChangesUseCase profileChangesUseCase,
    required LikeUseCase likeUseCase,
    required FeedPostPagingSourceFactory feedPostPagingSourceFactory,
  }) : _profileChangesUseCase = profileChangesUseCase,
    _likeUseCase = likeUseCase,
    _feedPostPagingSourceFactory = feedPostPagingSourceFactory;

  FeedBloc create() => FeedBloc(
    profileChangesUseCase: _profileChangesUseCase,
    likeUseCase: _likeUseCase,
    pagingSourceFactory: _feedPostPagingSourceFactory,
  );
}
