import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fpdart/fpdart.dart';
import 'package:poster/core/data/paging/firestore_paging.dart';
import 'package:poster/core/data/paging/page_mapper.dart';
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
  Future<Either<Exception, PageData<Post>>> feedPostsPage({
    int page = PagingConfig.initialPage,
    int perPage = PagingConfig.defaultPageSize,
  }) => tryFuture(() async {
    final snapshots = await FirebaseFirestore.instance
      .collection(_collectionPosts)
      .orderBy(PostData.fieldTimestamp, descending: true)
      .pageAt(page: page, perPage: perPage);

    return snapshots.toPageData(
      page: page,
      perPage: perPage,
      transform: (q) => q.toPost(),
    );
  });

  @override
  Future<Either<Exception, PageData<Post>>> wallPostsPage({
    required String email,
    int page = PagingConfig.initialPage,
    int perPage = PagingConfig.defaultPageSize,
  }) => tryFuture(() async {
    final snapshots = await FirebaseFirestore.instance
      .collection(_collectionPosts)
      .orderBy(PostData.fieldTimestamp, descending: true)
      .where(PostData.fieldAuthorEmail, isEqualTo: email)
      .pageAt(page: page, perPage: perPage);

    return snapshots.toPageData(
      page: page,
      perPage: perPage,
      transform: (q) => q.toPost(),
    );
  });
}

extension _PostMapper on QueryDocumentSnapshot<Map<String, dynamic>> {
  Post toPost() => Post(id: id, data: PostData.fromJson(data()));
}
