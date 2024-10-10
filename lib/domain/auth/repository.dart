import 'package:poster/domain/auth/api.dart';
import 'package:poster/domain/auth/storage.dart';

abstract class AuthRepository with AuthApi, AuthStorage {}
