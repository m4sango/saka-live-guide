import 'package:flutter/material.dart';
import 'package:saka_live_guide/model/list/list_item.dart';
import 'package:saka_live_guide/model/saka_group.dart';

class HeadingItem implements ListItem {
  final String heading;

  HeadingItem(int number) : this.heading = number.toString() + "期生";

  Widget createListTile(SakaGroup group) {
    return ListTile(
      title: Text(
        heading,
        style: TextStyle(
          color: SakaGroupHelper(group).getColor(),
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
