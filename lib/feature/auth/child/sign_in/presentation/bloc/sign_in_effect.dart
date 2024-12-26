import 'package:flutter/foundation.dart';

@immutable
sealed class SignInEffect {}

@immutable
final class SignUpClicked extends SignInEffect {
  final int _id;
  SignUpClicked() : _id = DateTime.now().millisecondsSinceEpoch;

  @override
  bool operator ==(Object other) =>
    identical(this, other) ||
      other is SignUpClicked &&
      runtimeType == other.runtimeType &&
      _id == other._id;

  @override
  int get hashCode => _id.hashCode;
}

@immutable
final class SignedIn extends SignInEffect {}
