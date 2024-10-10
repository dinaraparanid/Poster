import 'package:fpdart/fpdart.dart';
import 'package:poster/domain/auth/user.dart';
import 'package:poster/domain/post/mod.dart';

final class PostRepositoryImpl extends PostRepository {
  final PostApi postApi;
  final LikeApi likeApi;
  PostRepositoryImpl({required this.postApi, required this.likeApi});

  @override
  Future<Either<Exception, void>> createPost({
    required String username,
    required String text,
  }) => postApi.createPost(username: username, text: text);

  @override
  Future<Either<Exception, List<Post>>> get feedPosts =>
    postApi.feedPosts;

  @override
  Future<Either<Exception, void>> likePost({
    required String username,
    required int messageId,
  }) => likeApi.likePost(username: username, messageId: messageId);

  @override
  Future<Either<Exception, List<User>>> usersLikedPost({
    required int messageId,
  }) => likeApi.usersLikedPost(messageId: messageId);

  @override
  Future<Either<Exception, List<Post>>> wallPosts({
    required String username,
  }) => postApi.wallPosts(username: username);
}
