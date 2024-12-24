import 'package:freezed_annotation/freezed_annotation.dart';

part 'auth_child.freezed.dart';

@freezed
sealed class AuthChild with _$AuthChild {
  const factory AuthChild.signIn() = SignIn;
  const factory AuthChild.signUp() = SignUp;
}
