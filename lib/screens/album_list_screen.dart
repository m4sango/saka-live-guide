import 'package:flutter/material.dart';
import 'package:saka_live_guide/model/saka_group.dart';

class AlbumListScreen extends StatelessWidget {
  final SakaGroup _selectedGroup;
  final SakaGroupHelper _selectedGroupHelper;

  AlbumListScreen(this._selectedGroup)
      : _selectedGroupHelper = SakaGroupHelper(_selectedGroup);

  @override
  Widget build(BuildContext context) {}
}
