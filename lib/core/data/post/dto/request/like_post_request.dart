import 'package:freezed_annotation/freezed_annotation.dart';

part 'like_post_request.freezed.dart';
part 'like_post_request.g.dart';

@freezed
abstract class LikePostRequest with _$LikePostRequest {
  const factory LikePostRequest({
    @JsonKey(name: 'username')
    required String username,

    @JsonKey(name: 'message_id')
    required int messageId,
  }) = _LikePostRequest;

  factory LikePostRequest.fromJson(Map<String, dynamic> json) =>
    _$LikePostRequestFromJson(json);
}
