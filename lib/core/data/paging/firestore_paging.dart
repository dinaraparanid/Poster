import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:poster/core/domain/paging/page_data.dart';
import 'package:poster/core/domain/paging/paging_utils.dart';
import 'package:poster/core/utils/functions/let.dart';

extension FirestorePaging on Query<Map<String, dynamic>> {
  Future<PageData<K, T>> pageAt<K, T>({
    required K? lastElementKey,
    required int perPage,
    required K Function(T) extractKey,
    required T Function(QueryDocumentSnapshot<Map<String, dynamic>> doc) transform,
  }) => (lastElementKey?.let((key) => startAfter([key])) ?? this)
    .limit(PagingUtils.pageSizeWithNext(perPage: perPage))
    .get()
    .then((snapshot) => snapshot.toPageData(
      lastElementKey: lastElementKey,
      perPage: perPage,
      extractKey: extractKey,
      transform: transform,
  ));
}

extension _PageMapper on QuerySnapshot<Map<String, dynamic>> {
  PageData<K, T> toPageData<K, T>({
    required K? lastElementKey,
    required int perPage,
    required K Function(T) extractKey,
    required T Function(QueryDocumentSnapshot<Map<String, dynamic>> doc) transform,
  }) {
    final entities = docs
      .take(perPage)
      .map(transform)
      .toList(growable: false);

    return PageData(
      data: entities,
      prev: lastElementKey,
      next: entities.lastOrNull?.let(extractKey),
    );
  }
}
