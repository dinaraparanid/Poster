import 'package:get_it/get_it.dart';
import 'package:poster/core/di/core_module.dart';
import 'package:poster/feature/auth/di/auth_module.dart';

final di = GetIt.instance;

extension AppModule on GetIt {
  void registerAppModule() {
    registerCoreModule();
    registerAuthModule();
  }
}
