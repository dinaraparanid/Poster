import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:poster/feature/root/component/event.dart';
import 'package:poster/feature/root/component/state.dart';

final class RootComponent extends Bloc<RootEvent, RootState> {
  RootComponent() : super(const RootState(selectedTab: Tabs.wall)) {
    on<TabClicked>(
      (event, emit) => emit(state.copyWith(selectedTab: event.tab))
    );

    on<NewMessageButtonClicked>(
      (event, emit) {
        // TODO: show dialog
      }
    );
  }
}
