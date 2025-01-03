import 'package:freezed_annotation/freezed_annotation.dart';

part 'post_data.freezed.dart';
part 'post_data.g.dart';

@freezed
abstract class PostData with _$PostData {
  static const fieldText = 'text';
  static const fieldAuthorEmail = 'author_email';
  static const fieldTimestamp = 'timestamp';

  const factory PostData({
    @JsonKey(name: PostData.fieldText) required String text,
    @JsonKey(name: PostData.fieldAuthorEmail) required String author,
    @JsonKey(name: PostData.fieldTimestamp) required int timestamp,
  }) = _PostData;

  factory PostData.fromJson(Map<String, dynamic> json) =>
    _$PostDataFromJson(json);
}
