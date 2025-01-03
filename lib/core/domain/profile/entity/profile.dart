import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:poster/core/utils/functions/let.dart';

part 'profile.freezed.dart';
part 'profile.g.dart';

@freezed
abstract class Profile with _$Profile {
  static const fieldUsername = 'username';
  static const fieldEmail = 'email';
  static const fieldAvatar = 'avatar';
  static const fieldBirthdayTimestamp = 'birthdate';
  static const fieldLocation = 'location';

  const factory Profile({
    @JsonKey(name: Profile.fieldUsername) required String username,
    @JsonKey(name: Profile.fieldEmail) required String email,
    @JsonKey(name: Profile.fieldAvatar) String? avatar,
    @JsonKey(name: Profile.fieldBirthdayTimestamp) int? birthdayTimestamp,
    @JsonKey(name: Profile.fieldLocation) String? location,
  }) = _Profile;

  factory Profile.fromJson(Map<String, dynamic> json) =>
    _$ProfileFromJson(json);
}

extension Properties on Profile {
  DateTime? get birthdate =>
    birthdayTimestamp?.let(DateTime.fromMillisecondsSinceEpoch);

  int? get age => birthdate?.let((date) {
    final now = DateTime.now();
    return now.difference(date).inDays ~/ 365;
  });
}
