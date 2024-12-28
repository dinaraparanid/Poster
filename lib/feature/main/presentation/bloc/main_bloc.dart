import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:poster/core/domain/post/repository/post_repository.dart';
import 'package:poster/core/domain/profile/repository/profile_repository.dart';
import 'package:poster/core/presentation/foundation/ui_state.dart';
import 'package:poster/core/utils/functions/do_nothing.dart';
import 'package:poster/feature/main/domain/use_case/create_post_use_case.dart';
import 'package:poster/feature/main/presentation/bloc/main_effect.dart';
import 'package:poster/feature/main/presentation/bloc/main_event.dart';
import 'package:poster/feature/main/presentation/bloc/main_state.dart';

final class MainBloc extends Bloc<MainEvent, MainState> {
  MainBloc({
    required CreatePostUseCase createPostUseCase,
    required ProfileRepository profileRepository,
    required PostRepository postsRepository,
  }) : super(MainState.initial()) {
    on<Create>(
      (event, emit) async {
        final profile = await profileRepository.profile;

        if (profile != null) {
          emit(state.copyWith(profileState: profile.toUiState()));
        } else {
          emit(state.copyWith(profileState: const Error(null)));
        }
      }
    );

    on<TabClicked>(
      (event, emit) => emit(state.copyWith(selectedTab: event.tab))
    );

    on<UpdateNewMessageDialogVisibility>(
      (event, emit) => emit(
        switch (event.isVisible) {
          true => state.copyWith(effect: const ShowNewMessageDialog()),
          false => state.copyWith(effect: const None()),
        }
      )
    );

    on<UpdateMessage>(
      (event, emit) => emit(state.copyWith(message: event.message))
    );

    on<SendMessage>(
      (event, emit) async {
        final username = state.profileState.getOrNull?.username;
        final message = state.message;

        if (username != null && message != null && message.isNotEmpty) {
          createPostUseCase.execute(
            username: username,
            message: message,
            onFailure: doNothing, // TODO: show error snackbar
            onSuccess: () {
              // TODO: show success snackbar
              emit(state.copyWith(effect: const None(), message: ''));
            }
          );
        } else {
          // TODO: show error snackbar
        }
      }
    );

    on<AnnouncementsClicked>(
      (event, emit) {
        // TODO: announcements screen
      }
    );

    add(Create());
  }
}
