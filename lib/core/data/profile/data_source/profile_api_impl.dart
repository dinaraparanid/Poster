import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:poster/core/domain/profile/data_source/profile_api.dart';
import 'package:poster/core/domain/profile/entity/profile.dart';
import 'package:poster/core/utils/functions/let.dart';

const _collectionProfile = 'profiles';
const _fieldEmail = 'email';

final class ProfileApiImpl with ProfileApi {
  @override
  Future<Profile> createProfile({
    required String username,
    required String email,
  }) async {
    final profile = Profile(username: username, email: email);

    await FirebaseFirestore.instance
      .collection(_collectionProfile)
      .add(profile.toJson());

    return profile;
  }

  @override
  Future<Profile?> getProfileByEmail({required String email}) =>
    FirebaseFirestore.instance
      .collection(_collectionProfile)
      .where(_fieldEmail, isEqualTo: email)
      .get()
      .then((snapshot) =>
        snapshot.docs.firstOrNull?.data().let(Profile.fromJson)
      );
}
