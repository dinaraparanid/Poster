import 'package:fpdart/fpdart.dart';
import 'package:poster/core/domain/profile/data_source/profile_api.dart';
import 'package:poster/core/domain/profile/data_source/profile_store.dart';
import 'package:poster/core/domain/profile/entity/profile.dart';
import 'package:poster/core/domain/profile/repository/profile_repository.dart';

final class ProfileRepositoryImpl extends ProfileRepository {
  final ProfileApi _api;
  final ProfileStore _store;

  ProfileRepositoryImpl({
    required ProfileApi api,
    required ProfileStore store,
  }) : _api = api, _store = store;

  @override
  Future<Profile?> get profile => _store.profile;

  @override
  Future<void> createProfile({
    required String username,
    required String email,
  }) => _api.createProfile(username: username, email: email)
    .then(_store.storeProfile);

  @override
  Future<Either<Exception, void>> saveProfile({required String email}) async {
    final profile = await _api.getProfileByEmail(email: email);
    if (profile == null) return Either.left(Exception('profile is not found'));
    _store.storeProfile(profile);
    return Either.right(null);
  }
}
