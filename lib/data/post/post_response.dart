import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:poster/domain/post/post.dart';

part 'post_response.freezed.dart';
part 'post_response.g.dart';

@freezed
abstract class PostResponse with _$PostResponse {
  const factory PostResponse({
    @JsonKey(name: 'messageId')
    required int id,
    @JsonKey(name: 'text')
    required String text,
    @JsonKey(name: 'username')
    required String username,
    @JsonKey(name: 'liked')
    required List<String> usersLiked,
  }) = _PostResponse;

  factory PostResponse.fromJson(Map<String, dynamic> json) =>
    _$PostResponseFromJson(json);
}

extension Mapper on PostResponse {
  Post toPost() => Post(
    id: id,
    text: text,
    author: username,
    timestamp: DateTime.now().millisecondsSinceEpoch,
    liked: usersLiked,
  );
}
