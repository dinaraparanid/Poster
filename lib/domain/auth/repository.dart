import 'package:poster/domain/auth/profile.dart';

abstract class AuthRepository {
  Future<Profile?> get profile;
  Future<void> updateProfile(Profile profile);
}