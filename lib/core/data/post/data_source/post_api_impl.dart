import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fpdart/fpdart.dart';
import 'package:poster/core/data/paging/firestore_paging.dart';
import 'package:poster/core/domain/paging/page_data.dart';
import 'package:poster/core/domain/paging/paging_config.dart';
import 'package:poster/core/domain/post/data_source/post_api.dart';
import 'package:poster/core/domain/post/entity/post.dart';
import 'package:poster/core/domain/post/entity/post_data.dart';
import 'package:poster/core/utils/functions/try_future.dart';

const _collectionPosts = 'posts';

final class PostApiImpl with PostApi {
  @override
  Future<Either<Exception, Post>> createPost({
    required String email,
    required String text,
  }) => tryFuture(() async {
    final timestamp = DateTime.now().millisecondsSinceEpoch;
    final postData = PostData(text: text, author: email, timestamp: timestamp);

    final res = await FirebaseFirestore.instance
      .collection(_collectionPosts)
      .add(postData.toJson());

    return Post(id: res.id, data: postData);
  });

  @override
  Future<Either<Exception, PageData<int, Post>>> feedPostsPage({
    int? prevTimestamp,
    int perPage = PagingConfig.defaultPageSize,
  }) => tryFuture(() => FirebaseFirestore.instance
    .collection(_collectionPosts)
    .orderBy(PostData.fieldTimestamp, descending: true)
    .pageAt(
      lastElementKey: prevTimestamp,
      perPage: perPage,
      extractKey: (p) => p.data.timestamp,
      transform: (q) => q.toPost(),
    )
  );

  @override
  Future<Either<Exception, PageData<int, Post>>> wallPostsPage({
    required String email,
    int? prevTimestamp,
    int perPage = PagingConfig.defaultPageSize,
  }) => tryFuture(() => FirebaseFirestore.instance
    .collection(_collectionPosts)
    .orderBy(PostData.fieldTimestamp, descending: true)
    .where(PostData.fieldAuthorEmail, isEqualTo: email)
    .pageAt(
      lastElementKey: prevTimestamp,
      perPage: perPage,
      extractKey: (p) => p.data.timestamp,
      transform: (q) => q.toPost(),
    )
  );
}

extension _PostMapper on QueryDocumentSnapshot<Map<String, dynamic>> {
  Post toPost() => Post(id: id, data: PostData.fromJson(data()));
}
