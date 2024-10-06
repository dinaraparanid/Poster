// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'effect.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$AuthEffect {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() signedIn,
    required TResult Function() failedToSignIn,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? signedIn,
    TResult? Function()? failedToSignIn,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? signedIn,
    TResult Function()? failedToSignIn,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(SignedIn value) signedIn,
    required TResult Function(FailedToSignIn value) failedToSignIn,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(SignedIn value)? signedIn,
    TResult? Function(FailedToSignIn value)? failedToSignIn,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SignedIn value)? signedIn,
    TResult Function(FailedToSignIn value)? failedToSignIn,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AuthEffectCopyWith<$Res> {
  factory $AuthEffectCopyWith(
          AuthEffect value, $Res Function(AuthEffect) then) =
      _$AuthEffectCopyWithImpl<$Res, AuthEffect>;
}

/// @nodoc
class _$AuthEffectCopyWithImpl<$Res, $Val extends AuthEffect>
    implements $AuthEffectCopyWith<$Res> {
  _$AuthEffectCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AuthEffect
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$SignedInImplCopyWith<$Res> {
  factory _$$SignedInImplCopyWith(
          _$SignedInImpl value, $Res Function(_$SignedInImpl) then) =
      __$$SignedInImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$SignedInImplCopyWithImpl<$Res>
    extends _$AuthEffectCopyWithImpl<$Res, _$SignedInImpl>
    implements _$$SignedInImplCopyWith<$Res> {
  __$$SignedInImplCopyWithImpl(
      _$SignedInImpl _value, $Res Function(_$SignedInImpl) _then)
      : super(_value, _then);

  /// Create a copy of AuthEffect
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$SignedInImpl implements SignedIn {
  const _$SignedInImpl();

  @override
  String toString() {
    return 'AuthEffect.signedIn()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$SignedInImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() signedIn,
    required TResult Function() failedToSignIn,
  }) {
    return signedIn();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? signedIn,
    TResult? Function()? failedToSignIn,
  }) {
    return signedIn?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? signedIn,
    TResult Function()? failedToSignIn,
    required TResult orElse(),
  }) {
    if (signedIn != null) {
      return signedIn();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(SignedIn value) signedIn,
    required TResult Function(FailedToSignIn value) failedToSignIn,
  }) {
    return signedIn(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(SignedIn value)? signedIn,
    TResult? Function(FailedToSignIn value)? failedToSignIn,
  }) {
    return signedIn?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SignedIn value)? signedIn,
    TResult Function(FailedToSignIn value)? failedToSignIn,
    required TResult orElse(),
  }) {
    if (signedIn != null) {
      return signedIn(this);
    }
    return orElse();
  }
}

abstract class SignedIn implements AuthEffect {
  const factory SignedIn() = _$SignedInImpl;
}

/// @nodoc
abstract class _$$FailedToSignInImplCopyWith<$Res> {
  factory _$$FailedToSignInImplCopyWith(_$FailedToSignInImpl value,
          $Res Function(_$FailedToSignInImpl) then) =
      __$$FailedToSignInImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$FailedToSignInImplCopyWithImpl<$Res>
    extends _$AuthEffectCopyWithImpl<$Res, _$FailedToSignInImpl>
    implements _$$FailedToSignInImplCopyWith<$Res> {
  __$$FailedToSignInImplCopyWithImpl(
      _$FailedToSignInImpl _value, $Res Function(_$FailedToSignInImpl) _then)
      : super(_value, _then);

  /// Create a copy of AuthEffect
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$FailedToSignInImpl implements FailedToSignIn {
  const _$FailedToSignInImpl();

  @override
  String toString() {
    return 'AuthEffect.failedToSignIn()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$FailedToSignInImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() signedIn,
    required TResult Function() failedToSignIn,
  }) {
    return failedToSignIn();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? signedIn,
    TResult? Function()? failedToSignIn,
  }) {
    return failedToSignIn?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? signedIn,
    TResult Function()? failedToSignIn,
    required TResult orElse(),
  }) {
    if (failedToSignIn != null) {
      return failedToSignIn();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(SignedIn value) signedIn,
    required TResult Function(FailedToSignIn value) failedToSignIn,
  }) {
    return failedToSignIn(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(SignedIn value)? signedIn,
    TResult? Function(FailedToSignIn value)? failedToSignIn,
  }) {
    return failedToSignIn?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SignedIn value)? signedIn,
    TResult Function(FailedToSignIn value)? failedToSignIn,
    required TResult orElse(),
  }) {
    if (failedToSignIn != null) {
      return failedToSignIn(this);
    }
    return orElse();
  }
}

abstract class FailedToSignIn implements AuthEffect {
  const factory FailedToSignIn() = _$FailedToSignInImpl;
}
