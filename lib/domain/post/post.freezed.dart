// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'post.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Post _$PostFromJson(Map<String, dynamic> json) {
  return _Post.fromJson(json);
}

/// @nodoc
mixin _$Post {
  String get text => throw _privateConstructorUsedError;
  String get author => throw _privateConstructorUsedError;
  int get timestamp => throw _privateConstructorUsedError;
  List<String> get liked => throw _privateConstructorUsedError;

  /// Serializes this Post to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Post
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PostCopyWith<Post> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PostCopyWith<$Res> {
  factory $PostCopyWith(Post value, $Res Function(Post) then) =
      _$PostCopyWithImpl<$Res, Post>;
  @useResult
  $Res call({String text, String author, int timestamp, List<String> liked});
}

/// @nodoc
class _$PostCopyWithImpl<$Res, $Val extends Post>
    implements $PostCopyWith<$Res> {
  _$PostCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Post
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? text = null,
    Object? author = null,
    Object? timestamp = null,
    Object? liked = null,
  }) {
    return _then(_value.copyWith(
      text: null == text
          ? _value.text
          : text // ignore: cast_nullable_to_non_nullable
              as String,
      author: null == author
          ? _value.author
          : author // ignore: cast_nullable_to_non_nullable
              as String,
      timestamp: null == timestamp
          ? _value.timestamp
          : timestamp // ignore: cast_nullable_to_non_nullable
              as int,
      liked: null == liked
          ? _value.liked
          : liked // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PostImplCopyWith<$Res> implements $PostCopyWith<$Res> {
  factory _$$PostImplCopyWith(
          _$PostImpl value, $Res Function(_$PostImpl) then) =
      __$$PostImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String text, String author, int timestamp, List<String> liked});
}

/// @nodoc
class __$$PostImplCopyWithImpl<$Res>
    extends _$PostCopyWithImpl<$Res, _$PostImpl>
    implements _$$PostImplCopyWith<$Res> {
  __$$PostImplCopyWithImpl(_$PostImpl _value, $Res Function(_$PostImpl) _then)
      : super(_value, _then);

  /// Create a copy of Post
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? text = null,
    Object? author = null,
    Object? timestamp = null,
    Object? liked = null,
  }) {
    return _then(_$PostImpl(
      text: null == text
          ? _value.text
          : text // ignore: cast_nullable_to_non_nullable
              as String,
      author: null == author
          ? _value.author
          : author // ignore: cast_nullable_to_non_nullable
              as String,
      timestamp: null == timestamp
          ? _value.timestamp
          : timestamp // ignore: cast_nullable_to_non_nullable
              as int,
      liked: null == liked
          ? _value._liked
          : liked // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PostImpl implements _Post {
  const _$PostImpl(
      {required this.text,
      required this.author,
      required this.timestamp,
      required final List<String> liked})
      : _liked = liked;

  factory _$PostImpl.fromJson(Map<String, dynamic> json) =>
      _$$PostImplFromJson(json);

  @override
  final String text;
  @override
  final String author;
  @override
  final int timestamp;
  final List<String> _liked;
  @override
  List<String> get liked {
    if (_liked is EqualUnmodifiableListView) return _liked;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_liked);
  }

  @override
  String toString() {
    return 'Post(text: $text, author: $author, timestamp: $timestamp, liked: $liked)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PostImpl &&
            (identical(other.text, text) || other.text == text) &&
            (identical(other.author, author) || other.author == author) &&
            (identical(other.timestamp, timestamp) ||
                other.timestamp == timestamp) &&
            const DeepCollectionEquality().equals(other._liked, _liked));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, text, author, timestamp,
      const DeepCollectionEquality().hash(_liked));

  /// Create a copy of Post
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PostImplCopyWith<_$PostImpl> get copyWith =>
      __$$PostImplCopyWithImpl<_$PostImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PostImplToJson(
      this,
    );
  }
}

abstract class _Post implements Post {
  const factory _Post(
      {required final String text,
      required final String author,
      required final int timestamp,
      required final List<String> liked}) = _$PostImpl;

  factory _Post.fromJson(Map<String, dynamic> json) = _$PostImpl.fromJson;

  @override
  String get text;
  @override
  String get author;
  @override
  int get timestamp;
  @override
  List<String> get liked;

  /// Create a copy of Post
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PostImplCopyWith<_$PostImpl> get copyWith =>
      throw _privateConstructorUsedError;
}