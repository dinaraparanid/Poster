import 'package:get_it/get_it.dart';
import 'package:poster/core/data/profile/data_source/profile_storage.dart';
import 'package:poster/core/data/profile/repository/profile_repository_impl.dart';
import 'package:poster/core/domain/profile/data_source/profile_storage.dart';
import 'package:poster/core/domain/profile/repository/profile_repository.dart';

extension ProfileModule on GetIt {
  void registerProfileModule() {
    registerLazySingleton<ProfileStorage>(() => ProfileStorageImpl());
    registerLazySingleton<ProfileRepository>(() => ProfileRepositoryImpl(storage: this()));
  }
}
