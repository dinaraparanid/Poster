import 'package:poster/core/domain/profile/entity/profile.dart';
import 'package:poster/core/domain/profile/repository/profile_repository.dart';
import 'package:poster/feature/auth/domain/repository/auth_repository.dart';

final class LoginUseCase {
  final AuthRepository _authRepository;
  final ProfileRepository _profileRepository;

  LoginUseCase({
    required AuthRepository authRepository,
    required ProfileRepository profileRepository,
  }) :_authRepository = authRepository, _profileRepository = profileRepository;

  Future<void> login({
    required String username,
    required void Function() onSuccess,
    required void Function() onFailure,
  }) async => _authRepository.login(username).then((res) => res.fold(
    (_) => onFailure(),
    (_) async {
      final profile = Profile(username: username);
      await _profileRepository.updateProfile(profile);
      onSuccess();
    }
  ));
}
