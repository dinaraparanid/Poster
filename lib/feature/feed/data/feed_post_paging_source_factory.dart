import 'package:poster/core/domain/post/repository/post_repository.dart';
import 'package:poster/feature/feed/data/feed_post_paging_source.dart';

final class FeedPostPagingSourceFactory {
  final PostRepository _repository;

  FeedPostPagingSourceFactory({required PostRepository repository}) :
    _repository = repository;

  FeedPostPagingSource create() => FeedPostPagingSource(repository: _repository);
}
