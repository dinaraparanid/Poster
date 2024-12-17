import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:poster/core/domain/profile/repository/profile_repository.dart';
import 'package:poster/core/presentation/foundation/ui_state.dart';
import 'package:poster/domain/post/mod.dart';
import 'package:poster/feature/feed/component/event.dart';
import 'package:poster/feature/feed/component/state.dart';

final class FeedComponent extends Bloc<FeedEvent, FeedState> {
  final ProfileRepository profileRepository;
  final PostRepository postRepository;

  FeedComponent({
    required this.profileRepository,
    required this.postRepository,
  }) : super(FeedState.initial()) {
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

        await _loadPosts(emit);
      }
    );

    on<Refresh>(
      (event, emit) async {
        emit(state.copyWith(postsState: Refreshing(value: state.postsState)));
        await _loadPosts(emit);
      }
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

  Future<void> _loadPosts(Emitter<FeedState> emit) async {
    final res = await postRepository.feedPosts;

    final postsState = res.fold(
      (e) => Error<List<Post>>(e),
      (posts) => posts.toUiState(),
    );

    emit(state.copyWith(postsState: postsState));
  }
}
