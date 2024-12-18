// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$WallState {
  UiState<Profile> get profileState =>
      throw _privateConstructorUsedError; // TODO: Paging
  UiState<List<Post>> get postsState => throw _privateConstructorUsedError;

  /// Create a copy of WallState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $WallStateCopyWith<WallState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WallStateCopyWith<$Res> {
  factory $WallStateCopyWith(WallState value, $Res Function(WallState) then) =
      _$WallStateCopyWithImpl<$Res, WallState>;
  @useResult
  $Res call({UiState<Profile> profileState, UiState<List<Post>> postsState});

  $UiStateCopyWith<Profile, $Res> get profileState;
  $UiStateCopyWith<List<InvalidType>, $Res> get postsState;
}

/// @nodoc
class _$WallStateCopyWithImpl<$Res, $Val extends WallState>
    implements $WallStateCopyWith<$Res> {
  _$WallStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of WallState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? profileState = null,
    Object? postsState = null,
  }) {
    return _then(_value.copyWith(
      profileState: null == profileState
          ? _value.profileState
          : profileState // ignore: cast_nullable_to_non_nullable
              as UiState<Profile>,
      postsState: null == postsState
          ? _value.postsState
          : postsState // ignore: cast_nullable_to_non_nullable
              as UiState<List<Post>>,
    ) as $Val);
  }

  /// Create a copy of WallState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $UiStateCopyWith<Profile, $Res> get profileState {
    return $UiStateCopyWith<Profile, $Res>(_value.profileState, (value) {
      return _then(_value.copyWith(profileState: value) as $Val);
    });
  }

  /// Create a copy of WallState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $UiStateCopyWith<List<InvalidType>, $Res> get postsState {
    return $UiStateCopyWith<List<InvalidType>, $Res>(_value.postsState,
        (value) {
      return _then(_value.copyWith(postsState: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$WallStateImplCopyWith<$Res>
    implements $WallStateCopyWith<$Res> {
  factory _$$WallStateImplCopyWith(
          _$WallStateImpl value, $Res Function(_$WallStateImpl) then) =
      __$$WallStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({UiState<Profile> profileState, UiState<List<Post>> postsState});

  @override
  $UiStateCopyWith<Profile, $Res> get profileState;
  @override
  $UiStateCopyWith<List<InvalidType>, $Res> get postsState;
}

/// @nodoc
class __$$WallStateImplCopyWithImpl<$Res>
    extends _$WallStateCopyWithImpl<$Res, _$WallStateImpl>
    implements _$$WallStateImplCopyWith<$Res> {
  __$$WallStateImplCopyWithImpl(
      _$WallStateImpl _value, $Res Function(_$WallStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of WallState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? profileState = null,
    Object? postsState = null,
  }) {
    return _then(_$WallStateImpl(
      profileState: null == profileState
          ? _value.profileState
          : profileState // ignore: cast_nullable_to_non_nullable
              as UiState<Profile>,
      postsState: null == postsState
          ? _value.postsState
          : postsState // ignore: cast_nullable_to_non_nullable
              as UiState<List<Post>>,
    ));
  }
}

/// @nodoc

class _$WallStateImpl implements _WallState {
  const _$WallStateImpl({required this.profileState, required this.postsState});

  @override
  final UiState<Profile> profileState;
// TODO: Paging
  @override
  final UiState<List<Post>> postsState;

  @override
  String toString() {
    return 'WallState(profileState: $profileState, postsState: $postsState)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$WallStateImpl &&
            (identical(other.profileState, profileState) ||
                other.profileState == profileState) &&
            (identical(other.postsState, postsState) ||
                other.postsState == postsState));
  }

  @override
  int get hashCode => Object.hash(runtimeType, profileState, postsState);

  /// Create a copy of WallState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$WallStateImplCopyWith<_$WallStateImpl> get copyWith =>
      __$$WallStateImplCopyWithImpl<_$WallStateImpl>(this, _$identity);
}

abstract class _WallState implements WallState {
  const factory _WallState(
      {required final UiState<Profile> profileState,
      required final UiState<List<Post>> postsState}) = _$WallStateImpl;

  @override
  UiState<Profile> get profileState; // TODO: Paging
  @override
  UiState<List<Post>> get postsState;

  /// Create a copy of WallState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$WallStateImplCopyWith<_$WallStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
