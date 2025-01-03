import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:poster/core/domain/post/entity/post.dart';
import 'package:poster/core/domain/post/repository/post_repository.dart';
import 'package:poster/core/domain/profile/repository/profile_repository.dart';
import 'package:poster/core/presentation/foundation/ui_state.dart';
import 'package:poster/feature/wall/presentation/bloc/wall_event.dart';
import 'package:poster/feature/wall/presentation/bloc/wall_state.dart';

final class WallBloc extends Bloc<WallEvent, WallState> {
  final ProfileRepository profileRepository;
  final PostRepository postRepository;

  WallBloc({
    required this.profileRepository,
    required this.postRepository,
  }) : super(WallState.initial()) {
    on<Create>(
      (event, emit) async {
        final profile = await profileRepository.profile;

        if (profile != null) {
          emit(state.copyWith(profileState: profile.toUiState()));
          await _loadPosts(emit);
        } else {
          emit(state.copyWith(
            profileState: const Error(null),
            postsState: const Error(null),
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

        // TODO: like
        // await postRepository.likePost(username: username, messageId: event.postId);
        // TODO: error handling
        add(Refresh());
      }
    );

    add(Create());
  }

  Future<void> _loadPosts(Emitter<WallState> emit) async {
    final username = state.profileState.getOrNull?.username;
    if (username == null) return;

    final res = await postRepository.wallPostsPage(email: username);

    final postsState = res.fold(
      (e) => Error<List<Post>>(e),
      (posts) => posts.toUiState(),
    );

    // TODO: Paging
    // emit(state.copyWith(postsState: postsState));
  }
}
