import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fpdart/fpdart.dart';
import 'package:poster/core/data/firebase/firestore/utils/firestore_ext.dart';
import 'package:poster/core/data/paging/firestore_paging.dart';
import 'package:poster/core/domain/paging/page_data.dart';
import 'package:poster/core/domain/paging/paging_config.dart';
import 'package:poster/core/domain/profile/data_source/follower_api.dart';
import 'package:poster/core/domain/profile/entity/following_data.dart';
import 'package:poster/core/utils/functions/try_future.dart';

const _collectionFollowers = 'followers';

final class FollowerApiImpl with FollowerApi {
  @override
  Future<Either<Exception, FollowingData>> subscribe({
    required String profileEmail,
    required String followerEmail,
  }) => tryFuture(() async {
    final data = FollowingData(followerEmail: followerEmail, profileEmail: profileEmail);

    await FirebaseFirestore.instance
      .collection(_collectionFollowers)
      .add(data.toJson());

    return data;
  });

  @override
  Future<Either<Exception, void>> unsubscribe({
    required String profileEmail,
    required String followerEmail,
  }) => tryFuture(() async {
    final subscribeDoc = await FirebaseFirestore.instance
      .collection(_collectionFollowers)
      .where(FollowingData.fieldProfileEmail, isEqualTo: profileEmail)
      .where(FollowingData.fieldFollowerEmail, isEqualTo: followerEmail)
      .firstDocOrNull;

    await subscribeDoc?.reference.delete();
  });

  @override
  Future<Either<Exception, PageData<String, FollowingData>>> subscribersPage({
    required String profileEmail,
    String? prevFollowerEmail,
    int perPage = PagingConfig.defaultPageSize,
  }) => tryFuture(() => FirebaseFirestore.instance
    .collection(_collectionFollowers)
    .where(FollowingData.fieldProfileEmail, isEqualTo: profileEmail)
    .orderBy(FollowingData.fieldFollowerEmail)
    .pageAt(
      lastElementKey: prevFollowerEmail,
      perPage: perPage,
      extractKey: (f) => f.followerEmail,
      transform: (q) => q.toFollowingData(),
    )
  );
}

extension _FollowingMapper on QueryDocumentSnapshot<Map<String, dynamic>> {
  FollowingData toFollowingData() => FollowingData.fromJson(data());
}
