import 'package:fpdart/fpdart.dart';
import 'package:poster/core/domain/paging/page_data.dart';
import 'package:poster/core/domain/paging/paging_config.dart';
import 'package:poster/core/domain/post/entity/like.dart';
import 'package:poster/core/domain/post/entity/user.dart';

mixin LikeApi {
  Future<Either<Exception, Like>> likePost({
    required String email,
    required String postId,
  });

  Future<Either<Exception, int>> usersLikedPostCount({
    required String postId,
  });

  Future<Either<Exception, PageData<User>>> usersLikedPostPage({
    required String postId,
    int page = PagingConfig.initialPage,
    int perPage = PagingConfig.defaultPageSize,
  });
}
