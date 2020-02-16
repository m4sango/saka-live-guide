import 'package:json_annotation/json_annotation.dart';

part 'register_like_request.g.dart';

@JsonSerializable()
class RegisterLikeRequest {
  final String userId;

  RegisterLikeRequest(this.userId);

  Map<String, dynamic> toJson() => _$RegisterLikeRequestToJson(this);
}
