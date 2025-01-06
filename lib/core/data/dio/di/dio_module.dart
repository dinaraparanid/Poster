import 'package:get_it/get_it.dart';
import 'package:poster/core/data/dio/dio.dart';
import 'package:poster/core/di/provide_singleton.dart';

extension DioModule on GetIt {
  List<Type> registerDio() => [provideSingleton(AppDio)];
}
