import 'package:fpdart/fpdart.dart';
import 'package:poster/core/domain/profile/entity/profile.dart';

abstract class ProfileRepository {
  Future<Profile?> get profile;

  Future<Either<Exception, void>> createProfile({
    required String username,
    required String email,
  });

  Future<Either<Exception, void>> saveProfile({required String email});
}
