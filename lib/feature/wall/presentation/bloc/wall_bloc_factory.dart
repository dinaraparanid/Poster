import 'package:poster/core/domain/post/use_case/like_use_case.dart';
import 'package:poster/core/domain/profile/use_case/subscribe_on_profile_changes_use_case.dart';
import 'package:poster/feature/wall/data/wall_post_paging_source_factory.dart';
import 'package:poster/feature/wall/presentation/bloc/wall_bloc.dart';

final class WallBlocFactory {
  final SubscribeOnProfileChangesUseCase _profileChangesUseCase;
  final LikeUseCase _likeUseCase;
  final WallPostPagingSourceFactory _pagingSourceFactory;

  WallBlocFactory({
    required SubscribeOnProfileChangesUseCase profileChangesUseCase,
    required LikeUseCase likeUseCase,
    required WallPostPagingSourceFactory pagingSourceFactory,
  }) : _profileChangesUseCase = profileChangesUseCase,
    _likeUseCase = likeUseCase,
    _pagingSourceFactory = pagingSourceFactory;

  WallBloc create() => WallBloc(
    profileChangesUseCase: _profileChangesUseCase,
    likeUseCase: _likeUseCase,
    pagingSourceFactory: _pagingSourceFactory,
  );
}
