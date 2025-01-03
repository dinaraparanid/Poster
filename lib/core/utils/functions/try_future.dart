import 'package:fpdart/fpdart.dart';

Future<Either<Exception, T>> tryFuture<T>(Future<T> Function() action) async {
  try {
    return Either.right(await action());
  } on Exception catch (e) {
    return Either.left(e);
  }
}
