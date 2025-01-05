import 'package:poster/core/domain/post/repository/post_repository.dart';

final class SendMessageUseCase {
  final PostRepository _postRepository;

  SendMessageUseCase({
    required PostRepository postRepository,
  }) : _postRepository = postRepository;

  Future<void> execute({
    required String profileEmail,
    required String message,
    required void Function() onSuccess,
    required void Function() onFailure,
  }) => _postRepository
    .createPost(email: profileEmail, text: message)
    .then((res) => res.fold(
      (_) => onFailure(),
      (_) => onSuccess(),
    ));
}
