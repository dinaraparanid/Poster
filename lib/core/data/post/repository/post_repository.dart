import 'package:fpdart/fpdart.dart';
import 'package:poster/core/domain/post/data_source/like_api.dart';
import 'package:poster/core/domain/post/data_source/post_api.dart';
import 'package:poster/core/domain/post/entity/post.dart';
import 'package:poster/core/domain/post/repository/post_repository.dart';
import 'package:poster/core/domain/post/entity/user.dart';

final class PostRepositoryImpl extends PostRepository {
  final PostApi _postApi;
  final LikeApi _likeApi;

  PostRepositoryImpl({
    required PostApi postApi,
    required LikeApi likeApi,
  }) : _postApi = postApi, _likeApi = likeApi;

  @override
  Future<Either<Exception, void>> createPost({
    required String username,
    required String text,
  }) => _postApi.createPost(username: username, text: text);

  @override
  Future<Either<Exception, List<Post>>> get feedPosts =>
    _postApi.feedPosts;

  @override
  Future<Either<Exception, void>> likePost({
    required String username,
    required int messageId,
  }) => _likeApi.likePost(username: username, messageId: messageId);

  @override
  Future<Either<Exception, List<User>>> usersLikedPost({
    required int messageId,
  }) => _likeApi.usersLikedPost(messageId: messageId);

  @override
  Future<Either<Exception, List<Post>>> wallPosts({
    required String username,
  }) => _postApi.wallPosts(username: username);
}
