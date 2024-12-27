import 'package:poster/feature/auth/domain/error/auth_error.dart';
import 'package:poster/feature/auth/domain/repository/auth_repository.dart';

final class SignUpUseCase {
  final AuthRepository _authRepository;

  SignUpUseCase({required AuthRepository authRepository}) :
    _authRepository = authRepository;

  Future<void> execute({
    required String email,
    required String username,
    required String password,
    required void Function() onSuccess,
    required void Function(AuthError) onFailure,
  }) => _authRepository
    .signUp(email: email, username: username, password: password)
    .then((res) => res.fold(
      (e) => onFailure(e),
      (_) => onSuccess(),
    ));
}
