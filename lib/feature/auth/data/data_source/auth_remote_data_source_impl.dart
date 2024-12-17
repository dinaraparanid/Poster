import 'package:dio/dio.dart';
import 'package:fpdart/fpdart.dart';
import 'package:poster/data/url.dart';
import 'package:poster/feature/auth/data/dto/login_request.dart';
import 'package:poster/feature/auth/domain/data_source/auth_remote_data_source.dart';

final class AuthRemoteDataSourceImpl with AuthRemoteDataSource {
  final Dio client;
  AuthRemoteDataSourceImpl({required this.client});

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