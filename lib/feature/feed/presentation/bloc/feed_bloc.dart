import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:poster/core/domain/post/repository/post_repository.dart';
import 'package:poster/core/domain/profile/repository/profile_repository.dart';
import 'package:poster/core/presentation/foundation/ui_state.dart';
import 'package:poster/feature/feed/domain/use_case/load_posts_use_case.dart';
import 'package:poster/feature/feed/presentation/bloc/feed_event.dart';
import 'package:poster/feature/feed/presentation/bloc/feed_state.dart';

final class FeedBloc extends Bloc<FeedEvent, FeedState> {
  final ProfileRepository _profileRepository;
  final LoadPostsUseCase _loadPostsUseCase;

  FeedBloc({
    required ProfileRepository profileRepository,
    required PostRepository postRepository,
    required LoadPostsUseCase loadPostsUseCase,
  }) : _profileRepository = profileRepository,
    _loadPostsUseCase = loadPostsUseCase,
    super(FeedState.initial()) {

    on<Create>(
      (event, emit) async {
        emit(state.copyWith(
          profileState: const Loading(),
          postsState: const Loading(),
        ));

        await _loadProfileWithPosts(emit);
      }
    );

    on<Refresh>(
      (event, emit) async {
        emit(state.copyWith(
          profileState: Refreshing(value: state.profileState),
          postsState: Refreshing(value: state.postsState),
        ));

        await _loadProfileWithPosts(emit);
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

  Future<void> _loadProfileWithPosts(Emitter<FeedState> emit) async {
    final profile = await _profileRepository.profile;

    if (profile != null) {
      emit(state.copyWith(profileState: profile.toUiState()));
      emit(state.copyWith(postsState: await _loadPostsUseCase.loadPosts()));
    } else {
      emit(state.copyWith(
        profileState: const Error(null),
        postsState: const Error(null),
      ));
    }

    emit(state.copyWith(postsState: await _loadPostsUseCase.loadPosts()));
  }
}
