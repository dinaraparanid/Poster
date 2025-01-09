import 'package:fpdart/fpdart.dart';
import 'package:poster/core/domain/paging/page_data.dart';
import 'package:poster/core/domain/paging/paging_config.dart';
import 'package:poster/core/domain/post/entity/post.dart';

mixin PostApi {
  Future<Either<Exception, Post>> createPost({
    required String email,
    required String text,
  });

  Future<Either<Exception, PageData<int, Post>>> feedPostsPage({
    int? prevTimestamp,
    int perPage = PagingConfig.defaultPageSize,
  });

  Future<Either<Exception, PageData<int, Post>>> wallPostsPage({
    required String email,
    int? prevTimestamp,
    int perPage = PagingConfig.defaultPageSize,
  });
}
