import 'package:get_it/get_it.dart';
import 'package:poster/feature/auth/child/sign_in/presentation/bloc/sign_in_bloc.dart';
import 'package:poster/feature/auth/domain/use_case/login_use_case.dart';

extension SignInModule on GetIt {
  void registerSignInModule() {
    registerLazySingleton<LoginUseCase>(() => LoginUseCase(authRepository: this(), profileRepository: this()));
    registerLazySingleton<SignInBloc>(() => SignInBloc(loginUseCase: this()));
  }
}