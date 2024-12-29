import 'package:get_it/get_it.dart';
import 'package:poster/core/di/provide_singleton.dart';
import 'package:poster/feature/auth/child/sign_in/presentation/bloc/sign_in_bloc_factory.dart';
import 'package:poster/feature/auth/child/sign_in/domain/use_case/sign_in_use_case.dart';

extension SignInModule on GetIt {
  List<Type> registerSignInModule() => [
    provideSingleton<SignInUseCase>(() => SignInUseCase(authRepository: this())),
    provideSingleton<SignInBlocFactory>(() => SignInBlocFactory(
      loginUseCase: this(),
      validateEmailUseCase: this(),
    )),
  ];
}