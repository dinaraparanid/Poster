import 'package:get_it/get_it.dart';
import 'package:poster/feature/auth/data/data_source/auth_api.dart';
import 'package:poster/feature/auth/data/repository/auth_repository.dart';
import 'package:poster/feature/auth/domain/data_source/auth_api.dart';
import 'package:poster/feature/auth/domain/repository/auth_repository.dart';
import 'package:poster/feature/auth/domain/use_case/login_use_case.dart';
import 'package:poster/feature/auth/presentation/bloc/auth_bloc.dart';

extension AuthModule on GetIt {
  void registerAuthModule() {
    registerLazySingleton<AuthApi>(() => AuthApiImpl(client: this()));
    registerLazySingleton<AuthRepository>(() => AuthRepositoryImpl(api: this()));
    registerLazySingleton<LoginUseCase>(() => LoginUseCase(authRepository: this(), profileRepository: this()));
    registerLazySingleton<AuthBloc>(() => AuthBloc(loginUseCase: this()));
  }
}
