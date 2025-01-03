import 'package:poster/core/domain/profile/repository/profile_repository.dart';
import 'package:poster/feature/auth/domain/error/auth_error.dart';
import 'package:poster/feature/auth/domain/repository/auth_repository.dart';

final class SignUpUseCase {
  final AuthRepository _authRepository;
  final ProfileRepository _profileRepository;

  SignUpUseCase({
    required AuthRepository authRepository,
    required ProfileRepository profileRepository,
  }) : _authRepository = authRepository, _profileRepository = profileRepository;

  Future<void> execute({
    required String email,
    required String username,
    required String password,
    required void Function() onSuccess,
    required void Function(AuthError) onFailure,
  }) => _authRepository
    .signUp(email: email, username: username, password: password)
    .then((signUpRes) => signUpRes.fold(
      (e) => onFailure(e),
      (_) => _profileRepository
        .createProfile(username: username, email: email)
        .then((createRes) => createRes.fold(
          (_) => AuthError.unknown,
          (_) => onSuccess(),
        )),
    ));
}
