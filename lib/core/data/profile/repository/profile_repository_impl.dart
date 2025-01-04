import 'package:fpdart/fpdart.dart';
import 'package:poster/core/domain/paging/page_data.dart';
import 'package:poster/core/domain/paging/paging_config.dart';
import 'package:poster/core/domain/profile/data_source/follower_api.dart';
import 'package:poster/core/domain/profile/data_source/profile_api.dart';
import 'package:poster/core/domain/profile/data_source/profile_store.dart';
import 'package:poster/core/domain/profile/entity/following_data.dart';
import 'package:poster/core/domain/profile/entity/profile.dart';
import 'package:poster/core/domain/profile/repository/profile_repository.dart';

final class ProfileRepositoryImpl extends ProfileRepository {
  final ProfileApi _api;
  final ProfileStore _store;
  final FollowerApi _followerApi;

  ProfileRepositoryImpl({
    required ProfileApi api,
    required ProfileStore store,
    required FollowerApi followerApi,
  }) : _api = api, _store = store, _followerApi = followerApi;

  @override
  Future<Profile?> get profile => _store.profile;

  @override
  Future<Either<Exception, void>> createProfile({
    required String username,
    required String email,
  }) => _api.createProfile(username: username, email: email)
    .then((res) => res.map(_store.storeProfile));

  @override
  Future<Either<Exception, void>> saveProfile({required String email}) async {
    final profile = await _api.getProfileByEmail(email: email);
    if (profile == null) return Either.left(Exception('profile is not found'));
    _store.storeProfile(profile);
    return Either.right(null);
  }

  @override
  Future<Either<Exception, FollowingData>> subscribe({
    required String profileEmail,
    required String followerEmail,
  }) => _followerApi.subscribe(profileEmail: profileEmail, followerEmail: followerEmail);

  @override
  Future<Either<Exception, void>> unsubscribe({
    required String profileEmail,
    required String followerEmail,
  }) => _followerApi.unsubscribe(profileEmail: profileEmail, followerEmail: followerEmail);

  @override
  Future<Either<Exception, PageData<FollowingData>>> subscribersPage({
    required String profileEmail,
    int page = PagingConfig.initialPage,
    int perPage = PagingConfig.defaultPageSize,
  }) => _followerApi.subscribersPage(
    profileEmail: profileEmail,
    page: page,
    perPage: perPage,
  );
}
