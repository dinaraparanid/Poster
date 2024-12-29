import 'package:poster/feature/auth/domain/repository/auth_repository.dart';

final class CheckSignedInUseCase {
  final AuthRepository _authRepository;

  const CheckSignedInUseCase({required AuthRepository authRepository}) :
    _authRepository = authRepository;

  Stream<bool> get signedInChanges => _authRepository.signedInChanges;
}
