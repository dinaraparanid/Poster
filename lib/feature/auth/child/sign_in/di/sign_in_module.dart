import 'package:get_it/get_it.dart';
import 'package:poster/feature/auth/child/sign_in/presentation/bloc/sign_in_bloc_factory.dart';
import 'package:poster/feature/auth/child/sign_in/domain/use_case/sign_in_use_case.dart';

extension SignInModule on GetIt {
  void registerSignInModule() {
    registerLazySingleton<SignInUseCase>(() => SignInUseCase(authRepository: this()));

    registerLazySingleton<SignInBlocFactory>(() => SignInBlocFactory(
      loginUseCase: this(),
      validateEmailUseCase: this(),
    ));
  }
}