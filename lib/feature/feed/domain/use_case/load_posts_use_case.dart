import 'package:poster/core/domain/post/entity/post.dart';
import 'package:poster/core/domain/post/repository/post_repository.dart';
import 'package:poster/core/presentation/foundation/ui_state.dart';

final class LoadPostsUseCase {
  final PostRepository _postRepository;

  LoadPostsUseCase({required PostRepository postRepository}) :
    _postRepository = postRepository;

  Future<UiState<List<Post>>> loadPosts() {
    // TODO: Paging
    // _postRepository.feedPostsPage.then((res) => res.fold(
    //   (e) => Error<List<Post>>(e),
    //   (posts) => posts.toUiState(),
    // ));
    return Future(() => const UiState.initial());
  }
}
