import 'package:freezed_annotation/freezed_annotation.dart';

part 'profile.freezed.dart';
part 'profile.g.dart';

@freezed
abstract class Profile with _$Profile {
  const factory Profile({
    required String username,
    String? birthdate,
    int? followers,
    int? following,
    String? location,
  }) = _Profile;

  factory Profile.fromJson(Map<String, dynamic> json) =>
    _$ProfileFromJson(json);
}

extension Properties on Profile {
  int? get age {
    if (birthdate == null) return null;
    final born = DateTime.parse(birthdate!);
    final now = DateTime.now();
    return now.difference(born).inDays ~/ 365;
  }
}
