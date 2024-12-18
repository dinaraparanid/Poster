import 'package:get_it/get_it.dart';
import 'package:poster/feature/feed/domain/use_case/load_posts_use_case.dart';
import 'package:poster/feature/feed/presentation/bloc/feed_bloc.dart';

extension FeedModule on GetIt {
  void registerFeedModule() {
    registerLazySingleton(() => LoadPostsUseCase(postRepository: this()));
    registerLazySingleton(() => FeedBloc(profileRepository: this(), postRepository: this(), loadPostsUseCase: this()));
  }
}
