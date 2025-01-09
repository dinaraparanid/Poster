import 'package:poster/core/domain/paging/load_result_mapper.dart';
import 'package:poster/core/domain/post/entity/post.dart';
import 'package:poster/core/domain/post/repository/post_repository.dart';
import 'package:super_paging/super_paging.dart' hide PagingConfig;

final class FeedPostPagingSource extends PagingSource<int, Post> {
  final PostRepository _repository;

  FeedPostPagingSource({required PostRepository repository}) :
    _repository = repository;

  @override
  Future<LoadResult<int, Post>> load(LoadParams<int> params) async =>
    _repository
      .feedPostsPage(prevTimestamp: params.key)
      .then((x) => x.toLoadResult());
}
