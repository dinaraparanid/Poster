import 'package:poster/core/domain/profile/entity/profile.dart';

mixin ProfileApi {
  Future<Profile> createProfile({
    required String username,
    required String email,
  });

  Future<Profile?> getProfileByEmail({required String email});
}
