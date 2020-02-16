import 'package:json_annotation/json_annotation.dart';

part 'member.g.dart';

@JsonSerializable()
class Member {
  final String name;
  final String color1;
  final String color2;
  final String callName;

  Member(this.name, this.color1, this.color2, this.callName);

  factory Member.fromJson(Map<String, dynamic> json) => _$MemberFromJson(json);
}
