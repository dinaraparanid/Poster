import 'dart:convert';
import 'package:poster/core/domain/profile/entity/profile.dart';
import 'package:poster/core/domain/profile/data_source/profile_store.dart';
import 'package:rx_shared_preferences/rx_shared_preferences.dart';

const _keyProfile = 'profile';

final class ProfileStoreImpl with ProfileStore {
  @override
  Future<Profile?> get profile async =>
    RxSharedPreferences
      .getInstance()
      .getString(_keyProfile)
      .then((jsonStr) => jsonStr?.toProfile());

  @override
  Stream<Profile?> get profileChanges =>
    RxSharedPreferences
      .getInstance()
      .getStringStream(_keyProfile)
      .map((jsonStr) => jsonStr?.toProfile())
      .distinct();

  @override
  Future<void> storeProfile(Profile profile) =>
    RxSharedPreferences
      .getInstance()
      .setString(_keyProfile, jsonEncode(profile.toJson()));
}

extension _ProfileDecoder on String {
  Profile toProfile() => Profile.fromJson(jsonDecode(this));
}
