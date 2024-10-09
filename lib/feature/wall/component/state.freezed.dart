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
  UiState<Profile> get profileState => throw _privateConstructorUsedError;
  List<Post> get posts => throw _privateConstructorUsedError;

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
  $Res call({UiState<Profile> profileState, List<Post> posts});

  $UiStateCopyWith<Profile, $Res> get profileState;
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
    Object? posts = null,
  }) {
    return _then(_value.copyWith(
      profileState: null == profileState
          ? _value.profileState
          : profileState // ignore: cast_nullable_to_non_nullable
              as UiState<Profile>,
      posts: null == posts
          ? _value.posts
          : posts // ignore: cast_nullable_to_non_nullable
              as List<Post>,
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
}

/// @nodoc
abstract class _$$WallStateImplCopyWith<$Res>
    implements $WallStateCopyWith<$Res> {
  factory _$$WallStateImplCopyWith(
          _$WallStateImpl value, $Res Function(_$WallStateImpl) then) =
      __$$WallStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({UiState<Profile> profileState, List<Post> posts});

  @override
  $UiStateCopyWith<Profile, $Res> get profileState;
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
    Object? posts = null,
  }) {
    return _then(_$WallStateImpl(
      profileState: null == profileState
          ? _value.profileState
          : profileState // ignore: cast_nullable_to_non_nullable
              as UiState<Profile>,
      posts: null == posts
          ? _value._posts
          : posts // ignore: cast_nullable_to_non_nullable
              as List<Post>,
    ));
  }
}

/// @nodoc

class _$WallStateImpl implements _WallState {
  const _$WallStateImpl(
      {required this.profileState, required final List<Post> posts})
      : _posts = posts;

  @override
  final UiState<Profile> profileState;
  final List<Post> _posts;
  @override
  List<Post> get posts {
    if (_posts is EqualUnmodifiableListView) return _posts;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_posts);
  }

  @override
  String toString() {
    return 'WallState(profileState: $profileState, posts: $posts)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$WallStateImpl &&
            (identical(other.profileState, profileState) ||
                other.profileState == profileState) &&
            const DeepCollectionEquality().equals(other._posts, _posts));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, profileState, const DeepCollectionEquality().hash(_posts));

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
      required final List<Post> posts}) = _$WallStateImpl;

  @override
  UiState<Profile> get profileState;
  @override
  List<Post> get posts;

  /// Create a copy of WallState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$WallStateImplCopyWith<_$WallStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
