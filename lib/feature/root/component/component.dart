import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:poster/feature/root/component/effect.dart';
import 'package:poster/feature/root/component/event.dart';
import 'package:poster/feature/root/component/state.dart';

final class RootComponent extends Bloc<RootEvent, RootState> {
  RootComponent() : super(
    const RootState(
      selectedTab: Tabs.wall,
      hasIncomingAnnouncements: false,
    )
  ) {
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
      (event, emit) {
        // TODO: make request if message is not empty
        emit(state.copyWith(effect: const None(), message: ''));
      }
    );

    on<AnnouncementsClicked>(
      (event, emit) {
        // TODO: announcements screen
      }
    );
  }
}