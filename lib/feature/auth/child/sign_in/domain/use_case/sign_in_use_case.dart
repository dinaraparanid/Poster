import 'package:poster/feature/auth/domain/error/auth_error.dart';
import 'package:poster/feature/auth/domain/repository/auth_repository.dart';

final class SignInUseCase {
  final AuthRepository _authRepository;

  SignInUseCase({required AuthRepository authRepository}) :
    _authRepository = authRepository;

  Future<void> execute({
    required String email,
    required String password,
    required void Function() onSuccess,
    required void Function(AuthError) onFailure,
  }) => _authRepository
    .signIn(email: email, password: password)
    .then((res) => res.fold(
      (e) => onFailure(e),
      (_) => onSuccess(),
    ));
}
