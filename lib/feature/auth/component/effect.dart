import 'package:freezed_annotation/freezed_annotation.dart';

part 'effect.freezed.dart';

@freezed
sealed class AuthEffect with _$AuthEffect {
  const factory AuthEffect.signedIn() = SignedIn;
  const factory AuthEffect.failedToSignIn() = FailedToSignIn;
}
