// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'post_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PostResponseImpl _$$PostResponseImplFromJson(Map<String, dynamic> json) =>
    _$PostResponseImpl(
      id: (json['messageId'] as num).toInt(),
      text: json['text'] as String,
      username: json['username'] as String,
      usersLiked:
          (json['liked'] as List<dynamic>).map((e) => e as String).toList(),
    );

Map<String, dynamic> _$$PostResponseImplToJson(_$PostResponseImpl instance) =>
    <String, dynamic>{
      'messageId': instance.id,
      'text': instance.text,
      'username': instance.username,
      'liked': instance.usersLiked,
    };
