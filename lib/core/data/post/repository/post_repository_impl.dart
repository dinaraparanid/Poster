import 'package:fpdart/fpdart.dart';
import 'package:poster/core/domain/paging/page_data.dart';
import 'package:poster/core/domain/paging/paging_config.dart';
import 'package:poster/core/domain/post/data_source/like_api.dart';
import 'package:poster/core/domain/post/data_source/post_api.dart';
import 'package:poster/core/domain/post/entity/like.dart';
import 'package:poster/core/domain/post/entity/post.dart';
import 'package:poster/core/domain/post/entity/user.dart';
import 'package:poster/core/domain/post/repository/post_repository.dart';

final class PostRepositoryImpl extends PostRepository {
  final PostApi _postApi;
  final LikeApi _likeApi;

  PostRepositoryImpl({
    required PostApi postApi,
    required LikeApi likeApi,
  }) : _postApi = postApi, _likeApi = likeApi;

  @override
  Future<Either<Exception, Post>> createPost({
    required String email,
    required String text,
  }) => _postApi.createPost(email: email, text: text);

  @override
  Future<Either<Exception, PageData<int, Post>>> feedPostsPage({
    int? prevTimestamp,
    int perPage = PagingConfig.defaultPageSize,
  }) => _postApi.feedPostsPage(
    prevTimestamp: prevTimestamp,
    perPage: perPage,
  );

  @override
  Future<Either<Exception, PageData<int, Post>>> wallPostsPage({
    required String email,
    int? prevTimestamp,
    int perPage = PagingConfig.defaultPageSize,
  }) => _postApi.wallPostsPage(
    email: email,
    prevTimestamp: prevTimestamp,
    perPage: perPage,
  );

  @override
  Future<Either<Exception, Like>> likePost({
    required String email,
    required String postId,
  }) => _likeApi.likePost(email: email, postId: postId);

  @override
  Future<Either<Exception, int>> usersLikedPostCount({
    required String postId,
  }) => _likeApi.usersLikedPostCount(postId: postId);

  @override
  Future<Either<Exception, PageData<String, User>>> usersLikedPostPage({
    required String postId,
    String? lastEmail,
    int perPage = PagingConfig.defaultPageSize,
  }) => _likeApi.usersLikedPostPage(
    postId: postId,
    lastEmail: lastEmail,
    perPage: perPage,
  );
}
