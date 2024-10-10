import 'package:dio/dio.dart';
import 'package:fpdart/fpdart.dart';
import 'package:poster/data/url.dart';
import 'package:poster/domain/auth/user.dart';
import 'package:poster/domain/post/mod.dart';

final class LikeApiImpl with LikeApi {
  final Dio client;
  LikeApiImpl({required this.client});

  @override
  Future<Either<Exception, void>> likePost({
    required String username,
    required int messageId,
  }) async {
    try {
      await client.patch(
        '$BaseUrl/like',
        data: { 'username': username, 'messageId': messageId },
      );
      return Either.right(null);
    } on Exception catch (e) {
      return Either.left(e);
    }
  }

  @override
  Future<Either<Exception, List<User>>> usersLikedPost({
    required int messageId,
  }) async {
    try {
      final res = await client.get(
        '$BaseUrl/likes',
        queryParameters: { 'message_id': messageId },
      );

      return Either.right(
        (res.data['data'] as List<String>)
          .map((name) => User(username: name))
          .toList(growable: false)
      );
    } on Exception catch (e) {
      return Either.left(e);
    }
  }
}
