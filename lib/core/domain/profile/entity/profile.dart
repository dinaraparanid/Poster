import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:poster/core/utils/functions/let.dart';

part 'profile.freezed.dart';
part 'profile.g.dart';

@freezed
abstract class Profile with _$Profile {
  const factory Profile({
    @JsonKey(name: 'username') required String username,
    @JsonKey(name: 'email') required String email,
    @JsonKey(name: 'avatar') String? avatar,
    @JsonKey(name: 'birthdate') int? birthdayTimestamp,
    @JsonKey(name: 'location') String? location,
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
