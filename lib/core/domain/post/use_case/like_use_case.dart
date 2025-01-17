import 'package:fpdart/fpdart.dart';
import 'package:poster/core/domain/post/repository/post_repository.dart';
import 'package:poster/core/utils/functions/try_future.dart';

final class LikeUseCase {
  final PostRepository _repository;

  LikeUseCase({required PostRepository repository}) : _repository = repository;

  Future<Either<Exception, void>> switchLikeForPost({
    required String email,
    required String postId,
    required void Function(bool) onSuccess,
    required void Function(Exception) onError,
  }) => tryFuture(() async {
    _repository
      .switchLikeForPost(email: email, postId: postId)
      .then((res) => res.fold(onError, onSuccess));
  });
}
