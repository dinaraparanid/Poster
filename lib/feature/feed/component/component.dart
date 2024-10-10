import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:poster/domain/auth/repository.dart';
import 'package:poster/domain/post/post.dart';
import 'package:poster/feature/feed/component/event.dart';
import 'package:poster/feature/feed/component/state.dart';

final class FeedComponent extends Bloc<FeedEvent, FeedState> {
  FeedComponent({required AuthRepository repository}) : super(FeedState.initial()) {
    on<Create>(
      (event, emit) async {
        // TODO: request posts
        emit(state.copyWith(posts: _stub));
      }
    );

    on<Refresh>(
      (event, emit) async {
        // TODO: request posts
        emit(state.copyWith(posts: _stub));
      }
    );

    add(Create());
  }
}

List<Post> get _stub => const [
  Post(
    id: 0,
    text: 'I ended up in the back of a flashing car With the city shining on my face The lights are blinding me again',
    author: 'Michael Jackson',
    timestamp: 1728456918,
    liked: ['Michael Jordon', 'Elon Musk'],
  ),
  Post(
    id: 0,
    text: 'I ended up in the back of a flashing car With the city shining on my face The lights are blinding me again',
    author: 'Michael Jackson',
    timestamp: 1728370518,
    liked: ['Michael Jordon', 'Elon Musk'],
  ),
  Post(
    id: 0,
    text: 'I ended up in the back of a flashing car With the city shining on my face The lights are blinding me again',
    author: 'Michael Jackson',
    timestamp: 1728456918,
    liked: ['Michael Jordon', 'Elon Musk'],
  )
];
