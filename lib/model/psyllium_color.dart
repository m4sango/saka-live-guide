import 'package:flutter/material.dart';

enum PsylliumColor {
  white,
  orange,
  blue,
  yellow,
  purple,
  green,
  pink,
  red,
  light_blue,
  yellow_green,
  turquoise,
// 公式には存在しない(かなりんのみ)
  black,
// なし・決まっていない
  none,
}

class _ColorInfo {
  final Color color;
  final String colorName;

  _ColorInfo(this.color, this.colorName);
}

class PsylliumColorHelper {
  final PsylliumColor _enumValue;

  static Map<PsylliumColor, PsylliumColorHelper> _instanceMap = {
    PsylliumColor.white: PsylliumColorHelper._internal(PsylliumColor.white),
    PsylliumColor.orange: PsylliumColorHelper._internal(PsylliumColor.orange),
    PsylliumColor.blue: PsylliumColorHelper._internal(PsylliumColor.blue),
    PsylliumColor.yellow: PsylliumColorHelper._internal(PsylliumColor.yellow),
    PsylliumColor.purple: PsylliumColorHelper._internal(PsylliumColor.purple),
    PsylliumColor.green: PsylliumColorHelper._internal(PsylliumColor.green),
    PsylliumColor.pink: PsylliumColorHelper._internal(PsylliumColor.pink),
    PsylliumColor.red: PsylliumColorHelper._internal(PsylliumColor.red),
    PsylliumColor.light_blue:
        PsylliumColorHelper._internal(PsylliumColor.light_blue),
    PsylliumColor.yellow_green:
        PsylliumColorHelper._internal(PsylliumColor.yellow_green),
    PsylliumColor.turquoise:
        PsylliumColorHelper._internal(PsylliumColor.turquoise),
    PsylliumColor.black: PsylliumColorHelper._internal(PsylliumColor.black),
    PsylliumColor.none: PsylliumColorHelper._internal(PsylliumColor.none),
  };

  final Map<PsylliumColor, _ColorInfo> _colorInfos = {
    PsylliumColor.white: new _ColorInfo(Colors.white, "白"),
    PsylliumColor.orange: new _ColorInfo(Colors.orange, "橙"),
    PsylliumColor.yellow: new _ColorInfo(Colors.yellow, "黄"),
    PsylliumColor.purple: new _ColorInfo(Colors.purple, "紫"),
    PsylliumColor.green: new _ColorInfo(Colors.green, "緑"),
    PsylliumColor.pink: new _ColorInfo(Colors.pink, "桃"),
    PsylliumColor.red: new _ColorInfo(Colors.red, "赤"),
    PsylliumColor.light_blue: new _ColorInfo(Colors.lightBlue, "水色"),
    PsylliumColor.yellow_green: new _ColorInfo(Colors.lightGreen, "黄緑"),
    PsylliumColor.turquoise: new _ColorInfo(Colors.cyan[600], "ターコイズ"),
    PsylliumColor.black: new _ColorInfo(Colors.black, "黒"),
    PsylliumColor.none: new _ColorInfo(Colors.grey, "なし"),
  };

  PsylliumColorHelper._internal(this._enumValue);

  factory PsylliumColorHelper(PsylliumColor enumValue) {
    return _instanceMap[enumValue];
  }

  factory PsylliumColorHelper.name(String enumName) {
    PsylliumColor enumValue = PsylliumColor.values.firstWhere((item) {
      return item.toString().split('.').last == enumName;
    }, orElse: () => PsylliumColor.none);
    return _instanceMap[enumValue];
  }

  Color getColor() {
    return _colorInfos[_enumValue].color;
  }

  String getColorName() {
    return _colorInfos[_enumValue].colorName;
  }
}
