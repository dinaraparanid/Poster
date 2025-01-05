import 'package:fpdart/fpdart.dart';
import 'package:poster/core/domain/paging/page_data.dart';
import 'package:poster/core/domain/paging/paging_config.dart';
import 'package:poster/core/domain/profile/entity/following_data.dart';

mixin FollowerApi {
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