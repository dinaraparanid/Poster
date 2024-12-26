import 'package:get_it/get_it.dart';
import 'package:poster/core/data/dio/di/dio_module.dart';
import 'package:poster/core/data/post/di/post_module.dart';
import 'package:poster/core/data/profile/di/profile_module.dart';
import 'package:poster/core/presentation/theme/app.dart';

extension CoreModule on GetIt {
  void registerCoreModule() {
    registerProfileModule();
    registerPostModule();
    registerDio();
  }
}
