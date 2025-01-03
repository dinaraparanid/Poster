import 'package:freezed_annotation/freezed_annotation.dart';

part 'like.freezed.dart';
part 'like.g.dart';

@freezed
abstract class Like with _$Like {
  static const fieldUserEmail = 'user_email';
  static const fieldPostId = 'post_id';

  const factory Like({
    @JsonKey(name: Like.fieldUserEmail) required String email,
    @JsonKey(name: Like.fieldPostId) required String postId,
  }) = _Like;

  factory Like.fromJson(Map<String, dynamic> json) => _$LikeFromJson(json);
}
