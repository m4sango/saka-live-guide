import 'package:json_annotation/json_annotation.dart';

part 'likes.g.dart';

@JsonSerializable()
class Likes {
  final int likes;

  Likes(this.likes);

  factory Likes.fromJson(Map<String, dynamic> json) => _$LikesFromJson(json);

  Map<String, dynamic> toJson() => _$LikesToJson(this);
}
