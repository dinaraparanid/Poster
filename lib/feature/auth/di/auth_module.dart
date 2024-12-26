import 'package:get_it/get_it.dart';
import 'package:poster/feature/auth/child/sign_in/di/sign_in_module.dart';
import 'package:poster/feature/auth/child/sign_up/di/sign_up_module.dart';
import 'package:poster/feature/auth/data/data_source/auth_api.dart';
import 'package:poster/feature/auth/data/repository/auth_repository.dart';
import 'package:poster/feature/auth/domain/data_source/auth_api.dart';
import 'package:poster/feature/auth/domain/repository/auth_repository.dart';
import 'package:poster/feature/auth/presentation/bloc/auth_bloc_factory.dart';

extension AuthModule on GetIt {
  void registerAuthModule() {
    registerSignInModule();
    registerSignUpModule();

    registerLazySingleton<AuthApi>(() => AuthApiImpl(client: this()));
    registerLazySingleton<AuthRepository>(() => AuthRepositoryImpl(api: this()));

    registerLazySingleton<AuthBlocFactory>(() => AuthBlocFactory(
      signInBlocFactory: this(),
      signUpBlocFactory: this(),
      router: this(),
    ));
  }
}
