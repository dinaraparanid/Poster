import 'package:get_it/get_it.dart';
import 'package:poster/feature/root/presentation/bloc/root_bloc_factory.dart';

extension RootModule on GetIt {
  void registerRootModule() {
    registerLazySingleton<RootBlocFactory>(() => RootBlocFactory(
      authBlocFactory: this(),
      router: this(),
    ));
  }
}
