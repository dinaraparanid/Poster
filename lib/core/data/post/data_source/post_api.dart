import 'package:dio/dio.dart';
import 'package:fpdart/fpdart.dart';
import 'package:poster/core/data/post/dto/request/create_post_request.dart';
import 'package:poster/core/data/post/dto/response/post_response.dart';
import 'package:poster/core/data/post/dto/response/posts_response.dart';
import 'package:poster/core/domain/post/data_source/post_api.dart';
import 'package:poster/core/domain/post/entity/post.dart';
import 'package:poster/data/url.dart';

final class PostApiImpl with PostApi {
  final Dio client;
  PostApiImpl({required this.client});

  @override
  Future<Either<Exception, void>> createPost({
    required String username,
    required String text,
  }) async {
    try {
      await client.post(
        '$BaseUrl/new',
        data: CreatePostRequest(username: username, text: text),
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
      final response = PostsResponse.fromJson(res.data);

      return Either.right(
        response.data
          .map((j) => j.toPost())
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

      final response = PostsResponse.fromJson(res.data);

      return Either.right(
        response.data
          .map((j) => j.toPost())
          .toList(growable: false),
      );
    } on Exception catch (e) {
      return Either.left(e);
    }
  }
}
