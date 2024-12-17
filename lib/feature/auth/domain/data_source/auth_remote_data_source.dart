import 'package:fpdart/fpdart.dart';

mixin AuthRemoteDataSource {
  Future<Either<Exception, void>> login(String username);
}