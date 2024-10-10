import 'package:fpdart/fpdart.dart';
import 'package:poster/domain/auth/user.dart';

mixin LikeApi {
  Future<Either<Exception, void>> likePost({
    required String username,
    required int messageId,
  });

  Future<Either<Exception, List<User>>> usersLikedPost({
    required int messageId
  });
}
