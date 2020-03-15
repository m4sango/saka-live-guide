import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:saka_live_guide/service/model/response/all_member.dart';

class MemberService {
  static final MemberService _instance = new MemberService._internal();

  factory MemberService() => _instance;

  MemberService._internal();

  Future<AllMember> getAllMember(String filePath) async {
//    String loadData = await rootBundle
//        .loadString('resources/static/nogizaka_member_call.json');
    String loadData = await rootBundle.loadString(filePath);
    Map json = jsonDecode(loadData);

    return AllMember.fromJson(json["allMember"]);
  }
}
