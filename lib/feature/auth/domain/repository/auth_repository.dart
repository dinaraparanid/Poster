import 'package:poster/feature/auth/domain/data_source/auth_remote_data_source.dart';

import 'package:poster/core/domain/profile/entity/profile.dart';

abstract class AuthRepository with AuthRemoteDataSource {
  Future<void> saveProfile(Profile profile);
}
