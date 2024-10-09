import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:intl/intl.dart';

part 'post.freezed.dart';
part 'post.g.dart';

final _postDateFormat = DateFormat('d MMM y HH:mm');

@freezed
abstract class Post with _$Post {
  const factory Post({
    required String text,
    required String author,
    required int timestamp,
    required List<String> liked,
  }) = _Post;

  factory Post.fromJson(Map<String, dynamic> json) =>
    _$PostFromJson(json);
}

extension Properties on Post {
  String get formattedCreateTime =>
    _postDateFormat.format(DateTime.fromMillisecondsSinceEpoch(timestamp));

  // TODO: format
  String get formattedLikeCount => liked.length.toString();
}
