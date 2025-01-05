import 'package:poster/core/domain/profile/entity/profile.dart';

mixin ProfileStore {
  Future<Profile?> get profile;
  Stream<Profile?> get profileChanges;
  Future<void> storeProfile(Profile profile);
}
