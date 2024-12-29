import 'package:firebase_auth/firebase_auth.dart';
import 'package:fpdart/fpdart.dart';
import 'package:poster/feature/auth/domain/error/auth_error.dart';
import 'package:poster/feature/auth/domain/repository/auth_repository.dart';

final class AuthRepositoryImpl extends AuthRepository {
  AuthRepositoryImpl();

  @override
  Stream<bool> get signedInChanges =>
    FirebaseAuth.instance.authStateChanges().map((x) => x != null).distinct();

  @override
  Future<Either<AuthError, void>> signIn({
    required String email,
    required String password,
  }) async {
    try {
      await FirebaseAuth
        .instance
        .signInWithEmailAndPassword(email: email, password: password);
      return Either.right(null);
    } on FirebaseAuthException catch (e) {
      return Either.left(e.toAuthError());
    }
  }

  @override
  Future<Either<AuthError, void>> signUp({
    required String email,
    required String username,
    required String password,
  }) async {
    try {
      final cred = await FirebaseAuth
        .instance
        .createUserWithEmailAndPassword(email: email, password: password);

      await cred.user?.updateDisplayName(username);
      return Either.right(null);
    } on FirebaseAuthException catch (e) {
      return Either.left(e.toAuthError());
    }
  }
}
