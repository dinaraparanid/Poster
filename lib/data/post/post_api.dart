import 'package:dio/dio.dart';
import 'package:fpdart/fpdart.dart';
import 'package:poster/data/post/post_response.dart';
import 'package:poster/data/url.dart';
import 'package:poster/domain/post/mod.dart';

final class PostApiImpl with PostApi {
  final Dio client;
  PostApiImpl({required this.client});

  @override
  Future<Either<Exception, void>> createPost({
    required String username,
    required String text,
  }) async {
    try {
      await client.patch(
        '$BaseUrl/new',
        data: { 'username': username, 'text': text },
      );
      return Either.right(null);
    } on Exception catch (e) {
      return Either.left(e);
    }
  }

  @override
  Future<Either<Exception, List<Post>>> get feedPosts async {
    try {
      final res = await client.get('$BaseUrl/feed');

      return Either.right(
        (res.data['data'] as List<Map<String, dynamic>>)
          .map((j) => PostResponse.fromJson(j).toPost())
          .toList(growable: false)
      );
    } on Exception catch (e) {
      return Either.left(e);
    }
  }

  @override
  Future<Either<Exception, List<Post>>> wallPosts({
    required String username,
  }) async {
    try {
      final res = await client.get(
        '$BaseUrl/wall',
        queryParameters: { 'username': username },
      );

      return Either.right(
        (res.data['data'] as List<Map<String, dynamic>>)
          .map((j) => PostResponse.fromJson(j).toPost())
          .toList(growable: false)
      );
    } on Exception catch (e) {
      return Either.left(e);
    }
  }
}
