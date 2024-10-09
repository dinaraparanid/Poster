import 'package:poster/domain/auth/profile.dart';

mixin AuthStorage {
  Future<Profile?> get profile;
  Future<void> updateProfile(Profile profile);
}
