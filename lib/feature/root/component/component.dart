import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:poster/core/domain/profile/repository/profile_repository.dart';
import 'package:poster/core/presentation/foundation/ui_state.dart';
import 'package:poster/domain/post/mod.dart';
import 'package:poster/feature/root/component/effect.dart';
import 'package:poster/feature/root/component/event.dart';
import 'package:poster/feature/root/component/state.dart';
import 'package:poster/core/utils/functions/do_nothing.dart';

final class RootComponent extends Bloc<RootEvent, RootState> {
  final ProfileRepository profileRepository;
  final PostRepository postsRepository;

  RootComponent({
    required this.profileRepository,
    required this.postsRepository,
  }) : super(RootState.initial()) {
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
          final res = await postsRepository.createPost(
            username: username,
            text: message,
          );

          res.fold(
            (_) => doNothing(), // TODO: show error snackbar
            (_) {
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
