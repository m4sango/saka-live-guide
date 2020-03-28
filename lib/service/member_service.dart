import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:saka_live_guide/model/saka_group.dart';
import 'package:saka_live_guide/service/model/response/all_member.dart';

class MemberService {
  static final MemberService _instance = new MemberService._internal();

  factory MemberService() => _instance;

  final Map<SakaGroup, String> filePathMap = {
    SakaGroup.nogi: "resources/static/nogizaka_member_call.json"
  };

  MemberService._internal();

  Future<AllMember> getAllMember(SakaGroup group) async {
    String loadData = await rootBundle.loadString(filePathMap[group]);
    Map map = json.decode(loadData);
    return AllMember.fromJson(map["allMember"]);
  }
}
