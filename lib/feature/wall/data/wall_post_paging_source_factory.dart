import 'package:poster/core/domain/post/repository/post_repository.dart';
import 'package:poster/core/domain/profile/repository/profile_repository.dart';
import 'package:poster/feature/wall/data/wall_post_paging_source.dart';

final class WallPostPagingSourceFactory {
  final PostRepository _postRepository;
  final ProfileRepository _profileRepository;

  WallPostPagingSourceFactory({
    required PostRepository postRepository,
    required ProfileRepository profileRepository,
  }) : _postRepository = postRepository, _profileRepository = profileRepository;

  WallPostPagingSource create() => WallPostPagingSource(
    postRepository: _postRepository,
    profileRepository: _profileRepository,
  );
}
