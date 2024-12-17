import 'package:freezed_annotation/freezed_annotation.dart';

part 'auth_effect.freezed.dart';

@freezed
sealed class AuthEffect with _$AuthEffect {
  const factory AuthEffect.signedIn() = SignedIn;
  const factory AuthEffect.failedToSignIn() = FailedToSignIn;
  const factory AuthEffect.none() = None;
}
