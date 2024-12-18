import 'package:poster/core/domain/profile/data_source/profile_storage.dart';
import 'package:poster/core/domain/profile/entity/profile.dart';
import 'package:poster/core/domain/profile/repository/profile_repository.dart';

final class ProfileRepositoryImpl extends ProfileRepository {
  final ProfileStorage _storage;

  ProfileRepositoryImpl({
    required ProfileStorage storage,
  }) : _storage = storage;

  @override
  Future<Profile?> get profile => _storage.profile;

  @override
  Future<void> updateProfile(Profile profile) =>
    _storage.updateProfile(profile);
}
