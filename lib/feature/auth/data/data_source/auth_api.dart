import 'package:dio/dio.dart';
import 'package:fpdart/fpdart.dart';
import 'package:poster/data/url.dart';
import 'package:poster/feature/auth/data/dto/login_request.dart';
import 'package:poster/feature/auth/domain/data_source/auth_api.dart';

final class AuthApiImpl with AuthApi {
  final Dio client;
  AuthApiImpl({required this.client});

  @override
  Future<Either<Exception, void>> login(String username) async {
    try {
      await client.post('$BaseUrl/login', data: LoginRequest(username: username));
      return Either.right(null);
    } on Exception catch (e) {
      return Either.left(e);
    }
  }
}