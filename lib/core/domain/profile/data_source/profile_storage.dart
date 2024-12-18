import 'package:poster/core/domain/profile/entity/profile.dart';

mixin ProfileStorage {
  Future<Profile?> get profile;
  Future<void> updateProfile(Profile profile);
}
