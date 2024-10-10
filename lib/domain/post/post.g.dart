// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'post.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PostImpl _$$PostImplFromJson(Map<String, dynamic> json) => _$PostImpl(
      id: (json['id'] as num).toInt(),
      text: json['text'] as String,
      author: json['author'] as String,
      timestamp: (json['timestamp'] as num).toInt(),
      liked: (json['liked'] as List<dynamic>).map((e) => e as String).toList(),
    );

Map<String, dynamic> _$$PostImplToJson(_$PostImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'text': instance.text,
      'author': instance.author,
      'timestamp': instance.timestamp,
      'liked': instance.liked,
    };
