import 'package:fpdart/fpdart.dart';
import 'package:poster/core/domain/profile/repository/profile_repository.dart';
import 'package:poster/domain/auth/mod.dart';

final class AuthRepositoryImpl extends AuthRepository {
  final ProfileRepository _profileRepository;
  final AuthRemoteDataSource _api;

  AuthRepositoryImpl({
    required ProfileRepository profileRepository,
    required AuthRemoteDataSource api,
  }) : _profileRepository = profileRepository, _api = api;

  @override
  Future<Either<Exception, void>> login(String username) =>
      _api.login(username);

  @override
  Future<void> saveProfile(Profile profile) =>
      _profileRepository.updateProfile(profile);
}
