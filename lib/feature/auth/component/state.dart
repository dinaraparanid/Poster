import 'package:freezed_annotation/freezed_annotation.dart';

part 'state.freezed.dart';

@freezed
abstract class AuthState with _$AuthState {
  const factory AuthState({
    required String username,
  }) = _AuthState;
}
