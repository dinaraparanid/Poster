import 'package:get_it/get_it.dart';
import 'package:poster/feature/auth/child/sign_up/presentation/bloc/mod.dart';

extension SignUpModule on GetIt {
  void registerSignUpModule() {
    registerLazySingleton<SignUpBlocFactory>(() => SignUpBlocFactory());
  }
}
