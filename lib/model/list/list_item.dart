import 'package:flutter/material.dart';
import 'package:saka_live_guide/model/saka_group.dart';

abstract class ListItem {
  Widget createListTile(SakaGroup group);
}
