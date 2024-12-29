import 'package:get_it/get_it.dart';
import 'package:poster/feature/root/domain/use_case/check_signed_in_use_case.dart';
import 'package:poster/feature/root/presentation/bloc/root_bloc_factory.dart';

extension RootModule on GetIt {
  void registerRootModule() {
    registerLazySingleton<CheckSignedInUseCase>(
      () => CheckSignedInUseCase(authRepository: this()),
    );

    registerLazySingleton<RootBlocFactory>(() => RootBlocFactory(
      authBlocFactory: this(),
      mainBlocFactory: this(),
      checkSignedInUseCase: this(),
      router: this(),
    ));
  }
}
