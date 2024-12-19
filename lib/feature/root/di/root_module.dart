import 'package:get_it/get_it.dart';
import 'package:poster/feature/root/domain/use_case/create_post_use_case.dart';
import 'package:poster/feature/root/presentation/bloc/mod.dart';

extension RootModule on GetIt {
  void registerRootModule() {
    registerLazySingleton(() => CreatePostUseCase(postRepository: this()));
    registerLazySingleton(() => RootBloc(createPostUseCase: this(), profileRepository: this(), postsRepository: this()));
  }
}
