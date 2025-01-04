import 'package:fpdart/fpdart.dart';
import 'package:poster/core/domain/paging/page_data.dart';
import 'package:poster/core/domain/paging/paging_config.dart';
import 'package:poster/core/domain/profile/entity/following_data.dart';
import 'package:poster/core/domain/profile/entity/profile.dart';

abstract class ProfileRepository {
  Future<Profile?> get profile;

  Future<Either<Exception, void>> createProfile({
    required String username,
    required String email,
  });

  Future<Either<Exception, void>> saveProfile({required String email});

  Future<Either<Exception, FollowingData>> subscribe({
    required String profileEmail,
    required String followerEmail,
  });

  Future<Either<Exception, void>> unsubscribe({
    required String profileEmail,
    required String followerEmail,
  });

  Future<Either<Exception, PageData<FollowingData>>> subscribersPage({
    required String profileEmail,
    int page = PagingConfig.initialPage,
    int perPage = PagingConfig.defaultPageSize,
  });
}
