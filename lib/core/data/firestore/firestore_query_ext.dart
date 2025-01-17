import 'package:cloud_firestore/cloud_firestore.dart';

extension FirestoreQueryExt on Query<Map<String, dynamic>> {
  Future<QueryDocumentSnapshot<Map<String, dynamic>>?> get firstOrNull async {
    final res = await get();
    return res.docs.firstOrNull;
  }
}
