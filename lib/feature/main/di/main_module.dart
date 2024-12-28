import 'package:get_it/get_it.dart';
import 'package:poster/feature/main/domain/use_case/create_post_use_case.dart';
import 'package:poster/feature/main/presentation/bloc/mod.dart';

extension MainModule on GetIt {
  void registerMainModule() {
    registerLazySingleton(() => CreatePostUseCase(postRepository: this()));

    registerLazySingleton(() => MainBloc(
      createPostUseCase: this(),
      profileRepository: this(),
      postsRepository: this(),
    ));
  }
}
