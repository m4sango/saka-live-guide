import 'package:flutter/material.dart';
import 'package:saka_live_guide/model/list/list_item.dart';
import 'package:saka_live_guide/model/psyllium_color.dart';
import 'package:saka_live_guide/model/saka_group.dart';
import 'package:saka_live_guide/service/model/response/member.dart';

class MemberItem implements ListItem {
  final String name;
  final String callName;
  final Color color1;
  final String color1Name;
  final Color color2;
  final String color2Name;

  MemberItem._(this.name, this.callName, this.color1, this.color1Name,
      this.color2, this.color2Name);

  factory MemberItem(Member member) {
    PsylliumColorHelper helper1 = PsylliumColorHelper.name(member.color1);
    PsylliumColorHelper helper2 = PsylliumColorHelper.name(member.color2);

    return new MemberItem._(member.name, member.callName, helper1.getColor(),
        helper1.getColorName(), helper2.getColor(), helper2.getColorName());
  }

  @override
  Widget createListTile(SakaGroup group) {
    return ListTile(
      title: Text(name),
    );
  }
}
