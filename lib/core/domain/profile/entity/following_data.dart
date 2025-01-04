import 'package:freezed_annotation/freezed_annotation.dart';

part 'following_data.freezed.dart';
part 'following_data.g.dart';

@freezed
abstract class FollowingData with _$FollowingData {
  static const fieldFollowerEmail = 'follower_email';
  static const fieldProfileEmail = 'profile_email';

  const factory FollowingData({
    @JsonKey(name: FollowingData.fieldFollowerEmail) required String followerEmail,
    @JsonKey(name: FollowingData.fieldProfileEmail) required String profileEmail,
  }) = _FollowingData;

  factory FollowingData.fromJson(Map<String, dynamic> json) =>
    _$FollowingDataFromJson(json);
}
