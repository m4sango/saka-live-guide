import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

enum SakaGroup { nogi, keyaki, hinata }

class SakaGroupHelper {
  final SakaGroup _enumValue;

  static Map<SakaGroup, SakaGroupHelper> _instanceMap = {
    SakaGroup.nogi: SakaGroupHelper._internal(SakaGroup.nogi),
    SakaGroup.keyaki: SakaGroupHelper._internal(SakaGroup.keyaki),
    SakaGroup.hinata: SakaGroupHelper._internal(SakaGroup.hinata),
  };

  /// タブタイトル
  final Map<SakaGroup, String> _groupNames = {
    SakaGroup.nogi: "乃木坂",
    SakaGroup.keyaki: "欅坂",
    SakaGroup.hinata: "日向坂",
  };

  /// タブカラー
  final Map<SakaGroup, Color> _groupColors = {
    SakaGroup.nogi: Colors.purple,
    SakaGroup.keyaki: Colors.green,
    SakaGroup.hinata: Colors.lightBlue,
  };

  SakaGroupHelper._internal(this._enumValue);

  factory SakaGroupHelper(SakaGroup enumValue) {
    return _instanceMap[enumValue];
  }

  String getName() {
    return _groupNames[_enumValue];
  }

  Color getColor() {
    return _groupColors[_enumValue];
  }
}
