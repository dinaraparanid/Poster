import 'package:flutter/foundation.dart';

@immutable
sealed class SignUpEffect {}

@immutable
final class BackClicked extends SignUpEffect {
  final int _id;
  BackClicked() : _id = DateTime.now().millisecondsSinceEpoch;

  @override
  bool operator ==(Object other) =>
    identical(this, other) ||
      other is BackClicked &&
      runtimeType == other.runtimeType &&
      _id == other._id;

  @override
  int get hashCode => _id.hashCode;
}

@immutable
final class SignedUp extends SignUpEffect {}
