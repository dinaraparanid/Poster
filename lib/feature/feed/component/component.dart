import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:poster/core/ui/foundation/ui_state.dart';
import 'package:poster/domain/auth/mod.dart';
import 'package:poster/domain/post/mod.dart';
import 'package:poster/feature/feed/component/event.dart';
import 'package:poster/feature/feed/component/state.dart';

final class FeedComponent extends Bloc<FeedEvent, FeedState> {
  final AuthRepository authRepository;
  final PostRepository postRepository;

  FeedComponent({
    required this.authRepository,
    required this.postRepository,
  }) : super(FeedState.initial()) {
    on<Create>(
      (event, emit) async {
        emit(state.copyWith(postsState: const Loading()));
        await _loadPosts(emit);
      }
    );

    on<Refresh>(
      (event, emit) async {
        emit(state.copyWith(postsState: Refreshing(value: state.postsState)));
        await _loadPosts(emit);
      }
    );

    add(Create());
  }

  Future<void> _loadPosts(Emitter<FeedState> emit) async {
    final res = await postRepository.feedPosts;

    final postsState = res.fold(
      (e) => Error<List<Post>>(e),
      (posts) => posts.toUiState(),
    );

    emit(state.copyWith(postsState: postsState));
  }
}
