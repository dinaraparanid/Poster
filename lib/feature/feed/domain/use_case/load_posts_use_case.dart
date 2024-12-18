import 'package:poster/core/domain/post/entity/post.dart';
import 'package:poster/core/domain/post/repository/post_repository.dart';
import 'package:poster/core/presentation/foundation/ui_state.dart';

final class LoadPostsUseCase {
  final PostRepository _postRepository;

  LoadPostsUseCase({required PostRepository postRepository}) :
    _postRepository = postRepository;

  Future<UiState<List<Post>>> loadPosts() =>
    _postRepository.feedPosts.then((res) => res.fold(
      (e) => Error<List<Post>>(e),
      (posts) => posts.toUiState(),
    ));
}
