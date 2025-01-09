import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fpdart/fpdart.dart';
import 'package:poster/core/data/paging/firestore_paging.dart';
import 'package:poster/core/domain/paging/page_data.dart';
import 'package:poster/core/domain/paging/paging_config.dart';
import 'package:poster/core/domain/post/data_source/like_api.dart';
import 'package:poster/core/domain/post/entity/like.dart';
import 'package:poster/core/domain/post/entity/user.dart';
import 'package:poster/core/utils/functions/try_future.dart';

const _collectionPostsLikes = 'posts_likes';

final class LikeApiImpl with LikeApi {
  @override
  Future<Either<Exception, Like>> likePost({
    required String email,
    required String postId,
  }) => tryFuture(() async {
    final like = Like(email: email, postId: postId);

    await FirebaseFirestore.instance
      .collection(_collectionPostsLikes)
      .add(like.toJson());

    return like;
  });

  @override
  Future<Either<Exception, int>> usersLikedPostCount({required String postId}) =>
    tryFuture(() => FirebaseFirestore.instance
      .collection(_collectionPostsLikes)
      .where(Like.fieldPostId, isEqualTo: postId)
      .count()
      .get()
      .then((res) => res.count ?? 0)
    );

  @override
  Future<Either<Exception, PageData<String, User>>> usersLikedPostPage({
    required String postId,
    String? lastEmail,
    int perPage = PagingConfig.defaultPageSize,
  }) => tryFuture(() => FirebaseFirestore.instance
    .collection(_collectionPostsLikes)
    .where(Like.fieldPostId, isEqualTo: postId)
    .pageAt(
      lastElementKey: lastEmail,
      perPage: perPage,
      extractKey: (u) => u.email,
      transform: (q) => q.toUser(),
    )
  );
}

extension _UserMapper on QueryDocumentSnapshot<Map<String, dynamic>> {
  User toUser() => User(email: Like.fromJson(data()).email);
}
