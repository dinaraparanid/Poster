import 'package:fpdart/fpdart.dart';
import 'package:poster/core/domain/profile/entity/profile.dart';

mixin ProfileApi {
  Future<Either<Exception, Profile>> createProfile({
    required String username,
    required String email,
  });

  Future<Profile?> getProfileByEmail({required String email});
}
