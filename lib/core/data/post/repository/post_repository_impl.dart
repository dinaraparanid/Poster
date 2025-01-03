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
  Future<Either<Exception, PageData<Post>>> feedPostsPage({
    int page = PagingConfig.initialPage,
    int perPage = PagingConfig.defaultPageSize,
  }) => _postApi.feedPostsPage(page: page, perPage: perPage);

  @override
  Future<Either<Exception, PageData<Post>>> wallPostsPage({
    required String email,
    int page = PagingConfig.initialPage,
    int perPage = PagingConfig.defaultPageSize,
  }) => _postApi.wallPostsPage(email: email, page: page, perPage: perPage);

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
  Future<Either<Exception, PageData<User>>> usersLikedPostPage({
    required String postId,
    int page = PagingConfig.initialPage,
    int perPage = PagingConfig.defaultPageSize,
  }) => _likeApi.usersLikedPostPage(postId: postId, page: page, perPage: perPage);
}
