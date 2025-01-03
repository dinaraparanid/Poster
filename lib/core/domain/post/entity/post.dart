import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:intl/intl.dart';
import 'package:poster/core/domain/post/entity/post_data.dart';

part 'post.freezed.dart';

final _postDateFormat = DateFormat('d MMM y HH:mm');

@freezed
abstract class Post with _$Post {
  const factory Post({
    required String id,
    required PostData data,
    @Default([]) List<String> liked,
  }) = _Post;
}

extension Properties on Post {
  String get formattedCreateTime =>
    _postDateFormat.format(DateTime.fromMillisecondsSinceEpoch(data.timestamp));

  // TODO: format
  String get formattedLikeCount => liked.length.toString();
}
