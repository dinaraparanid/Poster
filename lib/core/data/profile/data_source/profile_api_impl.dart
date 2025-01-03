import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fpdart/fpdart.dart';
import 'package:poster/core/domain/profile/data_source/profile_api.dart';
import 'package:poster/core/domain/profile/entity/profile.dart';
import 'package:poster/core/utils/functions/let.dart';
import 'package:poster/core/utils/functions/try_future.dart';

const _collectionProfile = 'profiles';

final class ProfileApiImpl with ProfileApi {
  @override
  Future<Either<Exception, Profile>> createProfile({
    required String username,
    required String email,
  }) => tryFuture(() async {
    final profile = Profile(username: username, email: email);

    await FirebaseFirestore.instance
      .collection(_collectionProfile)
      .add(profile.toJson());

    return profile;
  });

  @override
  Future<Profile?> getProfileByEmail({required String email}) =>
    FirebaseFirestore.instance
      .collection(_collectionProfile)
      .where(Profile.fieldEmail, isEqualTo: email)
      .get()
      .then((snapshot) =>
        snapshot.docs.firstOrNull?.data().let(Profile.fromJson)
      );
}
