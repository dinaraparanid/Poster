import 'package:freezed_annotation/freezed_annotation.dart';

part 'auth_result.freezed.dart';

@freezed
sealed class AuthResult {
  const factory AuthResult.navigateToMain() = NavigateToMain;
}
