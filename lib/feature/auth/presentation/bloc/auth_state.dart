import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:poster/feature/auth/presentation/bloc/auth_effect.dart';

part 'auth_state.freezed.dart';

@freezed
abstract class AuthState with _$AuthState {
  const factory AuthState({
    @Default('') String username,
    AuthEffect? effect,
  }) = _AuthState;
}
