import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:poster/core/ui/foundation/ui_state.dart';
import 'package:poster/domain/auth/mod.dart';
import 'package:poster/feature/wall/component/event.dart';
import 'package:poster/feature/wall/component/state.dart';

final class WallComponent extends Bloc<WallEvent, WallState> {
  WallComponent({required AuthRepository repository}) : super(WallState.initial()) {
    on<OnCreate>(
      (event, emit) async {
        final profile = await repository.profile;

        if (profile != null) {
          emit(state.copyWith(profileState: profile.toUiState()));
        }
      }
    );

    on<Refresh>(
      (event, emit) {
        // TODO: request to load my messages
      }
    );

    add(OnCreate());
  }
}
