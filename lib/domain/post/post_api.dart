import 'package:fpdart/fpdart.dart';
import 'package:poster/domain/post/post.dart';

mixin PostApi {
  Future<Either<Exception, void>> createPost({
    required String username,
    required String text,
  });

  Future<Either<Exception, List<Post>>> wallPosts({required String username});

  Future<Either<Exception, List<Post>>> get feedPosts;
}