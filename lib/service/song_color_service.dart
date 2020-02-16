import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:saka_live_guide/service/model/request/register_like_request.dart';
import 'package:saka_live_guide/service/model/response/likes.dart';

class SongColorService {
  static final SongColorService _instance = new SongColorService._internal();
  static final String _hostUrl =
      "http://ec2-18-182-41-70.ap-northeast-1.compute.amazonaws.com:8080";
  static final String _path = "song/colors";

  factory SongColorService() => _instance;

  SongColorService._internal();

  Future<Likes> getLikes(int songColorId) async {
    final response = await http.get("$_hostUrl/$_path/$songColorId/likes");

    if (response.statusCode == HttpStatus.ok) {
      return Likes.fromJson(json.decode(response.body));
    } else {
      throw Exception("failed http request");
    }
  }

  Future<void> registerLike(int songColorId, String userId) async {
    final request = RegisterLikeRequest(userId);

    final response = await http.post("$_hostUrl/$_path/$songColorId/likes",
        headers: {HttpHeaders.contentTypeHeader: ContentType.json.value},
        body: json.encode(request.toJson()));

    if (response.statusCode == HttpStatus.created) {
      return;
    } else {
      throw Exception("http request failed");
    }
  }
}
