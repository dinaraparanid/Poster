import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:poster/core/ui/foundation/ui_state.dart';
import 'package:poster/domain/auth/mod.dart';
import 'package:poster/domain/post/mod.dart';
import 'package:poster/feature/wall/component/event.dart';
import 'package:poster/feature/wall/component/state.dart';

final class WallComponent extends Bloc<WallEvent, WallState> {
  final AuthRepository authRepository;
  final PostRepository postRepository;

  WallComponent({
    required this.authRepository,
    required this.postRepository,
  }) : super(WallState.initial()) {
    on<Create>(
      (event, emit) async {
        final profile = await authRepository.profile;

        if (profile != null) {
          emit(state.copyWith(profileState: profile.toUiState()));
          await _loadPosts(emit);
        } else {
          emit(state.copyWith(
            profileState: const Error(null),
            postsState: const Error(null)
          ));
        }
      }
    );

    on<Refresh>(
      (event, emit) async {
        emit(state.copyWith(postsState: Refreshing(value: state.postsState)));
        await _loadPosts(emit);
      },
    );

    on<Like>(
      (event, emit) async {
        final username = state.profileState.getOrNull?.username;
        if (username == null) return;

        await postRepository.likePost(username: username, messageId: event.postId);
        // TODO: error handling
        add(Refresh());
      }
    );

    add(Create());
  }

  Future<void> _loadPosts(Emitter<WallState> emit) async {
    final username = state.profileState.getOrNull?.username;
    if (username == null) return;

    final res = await postRepository.wallPosts(username: username);

    final postsState = res.fold(
      (e) => Error<List<Post>>(e),
      (posts) => posts.toUiState(),
    );

    emit(state.copyWith(postsState: postsState));
  }
}
