import 'package:poster/core/domain/profile/entity/profile.dart';

mixin ProfileStore {
  Future<Profile?> get profile;
  Future<void> storeProfile(Profile profile);
}
