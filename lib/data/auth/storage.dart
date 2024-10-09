import 'dart:convert';
import 'package:poster/domain/auth/profile.dart';
import 'package:poster/domain/auth/storage.dart';
import 'package:shared_preferences/shared_preferences.dart';

const _profileKey = 'profile';

final class AuthStorageImpl with AuthStorage {
  @override
  Future<Profile?> get profile async {
    final prefs = await SharedPreferences.getInstance();
    final json = prefs.getString(_profileKey);
    return json == null ? null : Profile.fromJson(jsonDecode(json));
  }

  @override
  Future<void> updateProfile(Profile profile) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_profileKey, jsonEncode(profile.toJson()));
  }
}
