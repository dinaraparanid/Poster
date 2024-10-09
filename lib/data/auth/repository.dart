import 'package:fpdart/fpdart.dart';
import 'package:poster/domain/auth/mod.dart';

final class AuthRepositoryImpl extends AuthRepository {
  final AuthStorage storage;
  final AuthApi api;

  AuthRepositoryImpl({required this.storage, required this.api});

  @override
  Future<Either<Exception, void>> login(String username) => api.login(username);

  @override
  Future<Profile?> get profile => storage.profile;

  @override
  Future<void> updateProfile(Profile profile) => storage.updateProfile(profile);
}
