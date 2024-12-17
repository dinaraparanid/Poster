import 'package:poster/core/domain/profile/entity/profile.dart';
import 'package:poster/feature/auth/domain/repository/auth_repository.dart';

final class LoginUseCase {
  final AuthRepository _repository;

  LoginUseCase({required AuthRepository repository}) : _repository = repository;

  Future<void> login({
    required String username,
    required void Function() onSuccess,
    required void Function() onFailure,
  }) async {
    final res = await _repository.login(username);

    res.fold(
      (_) => onFailure(),
      (_) async {
          final profile = Profile(username: username);
          await _repository.saveProfile(profile);
          onSuccess();
        }
    );
  }
}
