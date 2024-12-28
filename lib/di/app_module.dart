import 'package:get_it/get_it.dart';
import 'package:poster/core/di/core_module.dart';
import 'package:poster/feature/auth/di/auth_module.dart';
import 'package:poster/feature/root/di/root_module.dart';
import 'package:poster/navigation/app_router.dart';

final di = GetIt.instance;

extension AppModule on GetIt {
  void registerAppModule() {
    registerCoreModule();
    registerRootModule();
    registerAuthModule();
    registerLazySingleton(() => AppRouter());
  }
}
