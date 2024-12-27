import 'package:get_it/get_it.dart';
import 'package:poster/feature/auth/child/sign_up/domain/use_case/sign_up_use_case.dart';
import 'package:poster/feature/auth/child/sign_up/presentation/bloc/mod.dart';

extension SignUpModule on GetIt {
  void registerSignUpModule() {
    registerLazySingleton<SignUpUseCase>(() => SignUpUseCase(authRepository: this()));

    registerLazySingleton<SignUpBlocFactory>(() => SignUpBlocFactory(
      signUpUseCase: this(),
      validateEmailUseCase: this(),
    ));
  }
}
