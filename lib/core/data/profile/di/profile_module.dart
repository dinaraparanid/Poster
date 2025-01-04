import 'package:get_it/get_it.dart';
import 'package:poster/core/data/profile/data_source/follower_api_impl.dart';
import 'package:poster/core/data/profile/data_source/profile_api_impl.dart';
import 'package:poster/core/data/profile/data_source/profile_store_impl.dart';
import 'package:poster/core/data/profile/repository/profile_repository_impl.dart';
import 'package:poster/core/di/provide_singleton.dart';
import 'package:poster/core/domain/profile/data_source/follower_api.dart';
import 'package:poster/core/domain/profile/data_source/profile_api.dart';
import 'package:poster/core/domain/profile/data_source/profile_store.dart';
import 'package:poster/core/domain/profile/repository/profile_repository.dart';

extension ProfileModule on GetIt {
  List<Type> registerProfileModule() => [
    provideSingleton<ProfileApi>(() => ProfileApiImpl()),
    provideSingleton<ProfileStore>(() => ProfileStoreImpl()),
    provideSingleton<FollowerApi>(() => FollowerApiImpl()),
    provideSingleton<ProfileRepository>(() => ProfileRepositoryImpl(
      api: this(),
      store: this(),
      followerApi: this(),
    )),
  ];
}
