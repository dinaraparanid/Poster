import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:poster/core/domain/paging/page_data.dart';
import 'package:poster/core/domain/paging/paging_utils.dart';

extension FirestorePaging on Query<Map<String, dynamic>> {
  Future<PageData<T>> pageAt<T>({
    required int page,
    required int perPage,
    required T Function(QueryDocumentSnapshot<Map<String, dynamic>> doc) transform,
  }) => startAt([PagingUtils.pageOffset(page: page, perPage: perPage)])
    .limit(PagingUtils.pageSizeWithNext(perPage: perPage))
    .get()
    .then((snapshot) => snapshot.toPageData(
      page: page,
      perPage: perPage,
      transform: transform,
  ));
}

extension _PageMapper on QuerySnapshot<Map<String, dynamic>> {
  PageData<T> toPageData<T>({
    required int page,
    required int perPage,
    required T Function(QueryDocumentSnapshot<Map<String, dynamic>> doc) transform,
  }) {
    final entities = docs
        .take(perPage)
        .map(transform)
        .toList(growable: false);

    final prev = PagingUtils.previousPage(page: page);

    final next = PagingUtils.nextPage(
      page: page,
      perPage: perPage,
      entitiesSize: size,
    );

    return PageData(data: entities, prev: prev, next: next);
  }
}
