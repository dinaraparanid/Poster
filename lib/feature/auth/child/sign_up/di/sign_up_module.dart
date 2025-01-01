import 'package:get_it/get_it.dart';
import 'package:poster/core/di/provide_singleton.dart';
import 'package:poster/feature/auth/child/sign_up/domain/use_case/sign_up_use_case.dart';
import 'package:poster/feature/auth/child/sign_up/presentation/bloc/mod.dart';

extension SignUpModule on GetIt {
  List<Type> registerSignUpModule() => [
    provideSingleton<SignUpUseCase>(() => SignUpUseCase(
      authRepository: this(),
      profileRepository: this(),
    )),
    provideSingleton<SignUpBlocFactory>(() => SignUpBlocFactory(
      signUpUseCase: this(),
      validateEmailUseCase: this(),
    )),
  ];
}
