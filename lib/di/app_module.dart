import 'package:get_it/get_it.dart';
import 'package:poster/core/di/core_module.dart';
import 'package:poster/core/di/provide_singleton.dart';
import 'package:poster/feature/auth/di/auth_module.dart';
import 'package:poster/feature/feed/di/feed_module.dart';
import 'package:poster/feature/main/di/main_module.dart';
import 'package:poster/feature/root/di/root_module.dart';
import 'package:poster/feature/wall/di/wall_module.dart';
import 'package:poster/navigation/app_router.dart';

final di = GetIt.instance;

extension AppModule on GetIt {
  List<Type> registerAppModule() => [
    ...registerCoreModule(),
    ...registerRootModule(),
    ...registerAuthModule(),
    ...registerMainModule(),
    ...registerFeedModule(),
    ...registerWallModule(),
    provideSingleton<AppRouter>(() => AppRouter()),
  ];
}
