import 'package:poster/core/domain/paging/load_result_mapper.dart';
import 'package:poster/core/domain/post/entity/post.dart';
import 'package:poster/core/domain/post/repository/post_repository.dart';
import 'package:poster/core/domain/profile/repository/profile_repository.dart';
import 'package:super_paging/super_paging.dart';

final class WallPostPagingSource extends PagingSource<int, Post> {
  final PostRepository _postRepository;
  final ProfileRepository _profileRepository;

  WallPostPagingSource({
    required PostRepository postRepository,
    required ProfileRepository profileRepository,
  }) : _postRepository = postRepository, _profileRepository = profileRepository;

  @override
  Future<LoadResult<int, Post>> load(LoadParams<int> params) async {
    final profile = await _profileRepository.profile;
    if (profile == null) return const LoadResult.error();

    return _postRepository
      .wallPostsPage(email: profile.email, prevTimestamp: params.key)
      .then((x) => x.toLoadResult());
  }
}
