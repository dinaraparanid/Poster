import 'dart:convert';
import 'package:poster/core/domain/profile/entity/profile.dart';
import 'package:poster/core/domain/profile/data_source/profile_store.dart';
import 'package:shared_preferences/shared_preferences.dart';

const _profileKey = 'profile';

final class ProfileStoreImpl with ProfileStore {
  @override
  Future<Profile?> get profile async {
    final prefs = await SharedPreferences.getInstance();
    final json = prefs.getString(_profileKey);
    return json == null ? null : Profile.fromJson(jsonDecode(json));
  }

  @override
  Future<void> storeProfile(Profile profile) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_profileKey, jsonEncode(profile.toJson()));
  }
}
