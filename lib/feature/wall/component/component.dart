import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:poster/core/ui/foundation/ui_state.dart';
import 'package:poster/domain/auth/mod.dart';
import 'package:poster/domain/post/post.dart';
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

        // TODO: request posts by user
        emit(state.copyWith(posts: _stub));
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

List<Post> get _stub => const [
  Post(
    text: 'I ended up in the back of a flashing car With the city shining on my face The lights are blinding me again',
    author: 'Michael Jackson',
    timestamp: 1728456918,
    liked: ['Michael Jordon', 'Elon Musk'],
  ),
  Post(
    text: 'I ended up in the back of a flashing car With the city shining on my face The lights are blinding me again',
    author: 'Michael Jackson',
    timestamp: 1728370518,
    liked: ['Michael Jordon', 'Elon Musk'],
  ),
  Post(
    text: 'I ended up in the back of a flashing car With the city shining on my face The lights are blinding me again',
    author: 'Michael Jackson',
    timestamp: 1728456918,
    liked: ['Michael Jordon', 'Elon Musk'],
  )
];
