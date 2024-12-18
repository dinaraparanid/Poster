import 'package:get_it/get_it.dart';
import 'package:poster/core/data/dio/dio.dart';

extension DioModule on GetIt {
  void registerDio() => registerLazySingleton(AppDio);
}
