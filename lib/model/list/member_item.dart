import 'package:flutter/material.dart';
import 'package:saka_live_guide/model/list/list_item.dart';

class MemberItem implements ListItem {
  final String fullName;
  final String nickName;
  final Color color1;
  final String color1Name;
  final Color color2;
  final String color2Name;

  MemberItem(this.fullName, this.nickName, this.color1, this.color1Name,
      this.color2, this.color2Name);
}
