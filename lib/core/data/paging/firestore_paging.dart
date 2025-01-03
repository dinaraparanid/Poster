import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:poster/core/domain/paging/paging_utils.dart';

extension FirestorePaging on Query<Map<String, dynamic>> {
  Future<QuerySnapshot<Map<String, dynamic>>> pageAt({
    required int page,
    required int perPage,
  }) => startAt([PagingUtils.pageOffset(page: page, perPage: perPage)])
    .limit(PagingUtils.pageSizeWithNext(perPage: perPage))
    .get();
}
