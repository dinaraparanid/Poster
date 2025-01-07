import 'package:cloud_firestore/cloud_firestore.dart';

extension FirestoreExt on Query<Map<String, dynamic>> {
  Future<QueryDocumentSnapshot<Map<String, dynamic>>?> get firstDocOrNull =>
    get().then((snapshots) => snapshots.docs.firstOrNull);
}
