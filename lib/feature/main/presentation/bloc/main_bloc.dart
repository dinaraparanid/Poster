import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:poster/core/presentation/foundation/ui_state.dart';
import 'package:poster/feature/feed/presentation/bloc/feed_bloc.dart';
import 'package:poster/feature/feed/presentation/bloc/feed_bloc_factory.dart';
import 'package:poster/feature/main/domain/use_case/send_message_use_case.dart';
import 'package:poster/feature/main/domain/use_case/subscribe_on_incoming_announcements_use_case.dart';
import 'package:poster/core/domain/profile/use_case/subscribe_on_profile_changes_use_case.dart';
import 'package:poster/feature/main/presentation/bloc/main_effect.dart';
import 'package:poster/feature/main/presentation/bloc/main_event.dart';
import 'package:poster/feature/main/presentation/bloc/main_state.dart';
import 'package:poster/feature/wall/presentation/bloc/wall_bloc.dart';
import 'package:poster/feature/wall/presentation/bloc/wall_bloc_factory.dart';

final class MainBloc extends Bloc<MainEvent, MainState> {
  final FeedBlocFactory _feedBlocFactory;
  final WallBlocFactory _wallBlocFactory;

  MainBloc({
    required SubscribeOnProfileChangesUseCase profileChangesUseCase,
    required SubscribeOnIncomingAnnouncementsUseCase incomingAnnouncementsUseCase,
    required SendMessageUseCase sendMessageUseCase,
    required FeedBlocFactory feedBlocFactory,
    required WallBlocFactory wallBlocFactory,
  }) : _feedBlocFactory = feedBlocFactory,
    _wallBlocFactory = wallBlocFactory,
    super(const MainState()) {

    on<UpdateProfile>(
      (event, emit) => emit(state.copyWith(profileState: event.profileState)),
    );

    on<UpdateIncomingAnnouncements>(
      (event, emit) => emit(state.copyWith(
        hasIncomingAnnouncements: event.hasIncomingAnnouncements,
      )),
    );

    on<TabClicked>(
      (event, emit) => emit(state.copyWith(selectedTab: event.tab))
    );

    on<UpdateNewMessageDialogVisibility>(
      (event, emit) => emit(state.copyWith(
        effect: event.isVisible ? const MainEffect.showNewMessageDialog() : null
      ))
    );

    on<UpdateMessage>(
      (event, emit) => emit(state.copyWith(message: event.message)),
    );

    on<ClearMessage>((event, emit) => emit(state.copyWith(message: '')));

    on<SendMessage>(
      (event, emit) async {
        void onError() => emit(state.copyWith(
          effect: const MainEffect.showSendMessageFailureSnackbar(),
        ));

        void onSuccess() => emit(state.copyWith(
          effect: const MainEffect.showSendMessageSuccessSnackbar(),
        ));

        switch ((state.profileState.getOrNull?.email, state.message)) {
          case (String profileEmail, String message):
            await sendMessageUseCase.execute(
              profileEmail: profileEmail,
              message: message,
              onSuccess: onSuccess,
              onFailure: onError,
            );

          default: onError();
        }
      }
    );

    profileChangesUseCase.subscribe(
      onChanged: (profileState) => add(UpdateProfile(profileState: profileState))
    );

    incomingAnnouncementsUseCase.subscribe(
      onChanged: (hasAnnouncements) =>
        add(UpdateIncomingAnnouncements(hasIncomingAnnouncements: hasAnnouncements))
    );
  }

  FeedBloc createFeedBloc() => _feedBlocFactory.create();
  WallBloc createWallBloc() => _wallBlocFactory.create();
}
