import 'package:get_it/get_it.dart';

extension ProvideSingleton on GetIt {
  Type provideSingleton<T extends Object>(T Function() factory) {
    registerLazySingleton(factory);
    return T;
  }
}