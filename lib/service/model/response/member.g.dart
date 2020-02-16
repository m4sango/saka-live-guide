// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'member.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Member _$MemberFromJson(Map<String, dynamic> json) {
  return Member(
    json['name'] as String,
    json['color1'] as String,
    json['color2'] as String,
    json['callName'] as String,
  );
}

Map<String, dynamic> _$MemberToJson(Member instance) => <String, dynamic>{
      'name': instance.name,
      'color1': instance.color1,
      'color2': instance.color2,
      'callName': instance.callName,
    };
