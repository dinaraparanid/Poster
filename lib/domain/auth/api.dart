import 'package:fpdart/fpdart.dart';

mixin AuthApi {
  Future<Either<Exception, void>> login(String username);
}