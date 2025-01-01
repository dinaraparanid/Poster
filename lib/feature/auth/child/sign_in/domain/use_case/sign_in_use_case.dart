import 'package:poster/core/domain/profile/repository/profile_repository.dart';
import 'package:poster/feature/auth/domain/error/auth_error.dart';
import 'package:poster/feature/auth/domain/repository/auth_repository.dart';

final class SignInUseCase {
  final AuthRepository _authRepository;
  final ProfileRepository _profileRepository;

  SignInUseCase({
    required AuthRepository authRepository,
    required ProfileRepository profileRepository,
  }) : _authRepository = authRepository, _profileRepository = profileRepository;

  Future<void> execute({
    required String email,
    required String password,
    required void Function() onSuccess,
    required void Function(AuthError) onFailure,
  }) => _authRepository
    .signIn(email: email, password: password)
    .then((signInRes) => signInRes.fold(
      (e) => onFailure(e),
      (_) => _profileRepository
        .saveProfile(email: email)
        .then((saveRes) => saveRes.fold(
          (_) => onFailure(AuthError.userNotFound),
          (_) => onSuccess(),
        )),
    ));
}
