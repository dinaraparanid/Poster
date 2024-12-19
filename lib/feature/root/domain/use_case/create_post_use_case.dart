import 'package:poster/core/domain/post/repository/post_repository.dart';

final class CreatePostUseCase {
  final PostRepository _postRepository;

  CreatePostUseCase({required PostRepository postRepository}) :
    _postRepository = postRepository;

  Future<void> execute({
    required String username,
    required String message,
    required void Function() onFailure,
    required void Function() onSuccess,
  }) => _postRepository.createPost(
    username: username,
    text: message,
  ).then((res) => res.fold(
    (_) => onFailure(),
    (_) => onSuccess(),
  ));
}
