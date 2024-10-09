import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

Dio AppDio() => Dio()..interceptors.add(PrettyDioLogger());
