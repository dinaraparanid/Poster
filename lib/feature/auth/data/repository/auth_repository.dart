import 'package:fpdart/fpdart.dart';
import 'package:poster/feature/auth/domain/data_source/auth_api.dart';
import 'package:poster/feature/auth/domain/repository/auth_repository.dart';

final class AuthRepositoryImpl extends AuthRepository {
  final AuthApi _api;

  AuthRepositoryImpl({required AuthApi api}) : _api = api;

  @override
  Future<Either<Exception, void>> login(String username) =>
      _api.login(username);
}
