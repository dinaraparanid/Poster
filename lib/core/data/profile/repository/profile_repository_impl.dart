import 'package:poster/core/domain/profile/data_source/profile_local_data_source.dart';
import 'package:poster/core/domain/profile/entity/profile.dart';
import 'package:poster/core/domain/profile/repository/profile_repository.dart';

final class ProfileRepositoryImpl extends ProfileRepository {
  final ProfileLocalDataSource _storage;

  ProfileRepositoryImpl({
    required ProfileLocalDataSource storage,
  }) : _storage = storage;

  @override
  Future<Profile?> get profile => _storage.profile;

  @override
  Future<void> updateProfile(Profile profile) =>
    _storage.updateProfile(profile);
}
