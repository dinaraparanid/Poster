import 'package:freezed_annotation/freezed_annotation.dart';

part 'profile.freezed.dart';
part 'profile.g.dart';

@freezed
abstract class Profile with _$Profile {
  const factory Profile({
    required String username,
  }) = _Profile;

  factory Profile.fromJson(Map<String, dynamic> json) =>
    _$ProfileFromJson(json);
}
