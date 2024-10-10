import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:poster/data/post/post_response.dart';

part 'posts_response.freezed.dart';
part 'posts_response.g.dart';

@freezed
abstract class PostsResponse with _$PostsResponse {
  const factory PostsResponse({
    @JsonKey(name: 'data')
    required List<PostResponse> data,
  }) = _PostsResponse;

  factory PostsResponse.fromJson(Map<String, dynamic> json) =>
    _$PostsResponseFromJson(json);
}
