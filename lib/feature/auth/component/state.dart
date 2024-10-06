import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:poster/feature/auth/component/effect.dart';

part 'state.freezed.dart';

@freezed
abstract class AuthState with _$AuthState {
  const factory AuthState({
    required String username,
    AuthEffect? effect,
  }) = _AuthState;
}
