// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'posts_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

PostsResponse _$PostsResponseFromJson(Map<String, dynamic> json) {
  return _PostsResponse.fromJson(json);
}

/// @nodoc
mixin _$PostsResponse {
  @JsonKey(name: 'data')
  List<PostResponse> get data => throw _privateConstructorUsedError;

  /// Serializes this PostsResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PostsResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PostsResponseCopyWith<PostsResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PostsResponseCopyWith<$Res> {
  factory $PostsResponseCopyWith(
          PostsResponse value, $Res Function(PostsResponse) then) =
      _$PostsResponseCopyWithImpl<$Res, PostsResponse>;
  @useResult
  $Res call({@JsonKey(name: 'data') List<PostResponse> data});
}

/// @nodoc
class _$PostsResponseCopyWithImpl<$Res, $Val extends PostsResponse>
    implements $PostsResponseCopyWith<$Res> {
  _$PostsResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PostsResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = null,
  }) {
    return _then(_value.copyWith(
      data: null == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as List<PostResponse>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PostsResponseImplCopyWith<$Res>
    implements $PostsResponseCopyWith<$Res> {
  factory _$$PostsResponseImplCopyWith(
          _$PostsResponseImpl value, $Res Function(_$PostsResponseImpl) then) =
      __$$PostsResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({@JsonKey(name: 'data') List<PostResponse> data});
}

/// @nodoc
class __$$PostsResponseImplCopyWithImpl<$Res>
    extends _$PostsResponseCopyWithImpl<$Res, _$PostsResponseImpl>
    implements _$$PostsResponseImplCopyWith<$Res> {
  __$$PostsResponseImplCopyWithImpl(
      _$PostsResponseImpl _value, $Res Function(_$PostsResponseImpl) _then)
      : super(_value, _then);

  /// Create a copy of PostsResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = null,
  }) {
    return _then(_$PostsResponseImpl(
      data: null == data
          ? _value._data
          : data // ignore: cast_nullable_to_non_nullable
              as List<PostResponse>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PostsResponseImpl implements _PostsResponse {
  const _$PostsResponseImpl(
      {@JsonKey(name: 'data') required final List<PostResponse> data})
      : _data = data;

  factory _$PostsResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$PostsResponseImplFromJson(json);

  final List<PostResponse> _data;
  @override
  @JsonKey(name: 'data')
  List<PostResponse> get data {
    if (_data is EqualUnmodifiableListView) return _data;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_data);
  }

  @override
  String toString() {
    return 'PostsResponse(data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PostsResponseImpl &&
            const DeepCollectionEquality().equals(other._data, _data));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_data));

  /// Create a copy of PostsResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PostsResponseImplCopyWith<_$PostsResponseImpl> get copyWith =>
      __$$PostsResponseImplCopyWithImpl<_$PostsResponseImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PostsResponseImplToJson(
      this,
    );
  }
}

abstract class _PostsResponse implements PostsResponse {
  const factory _PostsResponse(
          {@JsonKey(name: 'data') required final List<PostResponse> data}) =
      _$PostsResponseImpl;

  factory _PostsResponse.fromJson(Map<String, dynamic> json) =
      _$PostsResponseImpl.fromJson;

  @override
  @JsonKey(name: 'data')
  List<PostResponse> get data;

  /// Create a copy of PostsResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PostsResponseImplCopyWith<_$PostsResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
