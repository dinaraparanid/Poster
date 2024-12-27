import 'package:fpdart/fpdart.dart';
import 'package:poster/feature/auth/domain/error/auth_error.dart';

abstract class AuthRepository {
  Future<Either<AuthError, void>> signIn({
    required String email,
    required String password,
  });

  Future<Either<AuthError, void>> signUp({
    required String email,
    required String username,
    required String password,
  });
}
