import 'package:get_it/get_it.dart';
import 'package:poster/feature/main/domain/use_case/create_post_use_case.dart';
import 'package:poster/feature/main/presentation/bloc/main_bloc_factory.dart';

extension MainModule on GetIt {
  void registerMainModule() {
    registerLazySingleton<CreatePostUseCase>(() => CreatePostUseCase(postRepository: this()));
    registerLazySingleton<MainBlocFactory>(() => MainBlocFactory());
  }
}
