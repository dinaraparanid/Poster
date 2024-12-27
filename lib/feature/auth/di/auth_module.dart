import 'package:get_it/get_it.dart';
import 'package:poster/feature/auth/child/sign_in/di/sign_in_module.dart';
import 'package:poster/feature/auth/child/sign_up/di/sign_up_module.dart';
import 'package:poster/feature/auth/data/repository/auth_repository_impl.dart';
import 'package:poster/feature/auth/domain/repository/auth_repository.dart';
import 'package:poster/feature/auth/domain/use_case/validate_email_use_case.dart';
import 'package:poster/feature/auth/presentation/bloc/auth_bloc_factory.dart';

extension AuthModule on GetIt {
  void registerAuthModule() {
    registerSignInModule();
    registerSignUpModule();

    registerLazySingleton<ValidateEmailUseCase>(() => ValidateEmailUseCase());
    registerLazySingleton<AuthRepository>(() => AuthRepositoryImpl());
    registerLazySingleton<AuthBlocFactory>(() => AuthBlocFactory(
      signInBlocFactory: this(),
      signUpBlocFactory: this(),
      router: this(),
    ));
  }
}
