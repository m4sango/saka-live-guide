import 'package:flutter/material.dart';
import 'package:saka_live_guide/model/saka_group.dart';

class BottomNavigation extends StatelessWidget {
  final SakaGroup _selectedGroup;
  final ValueChanged<SakaGroup> _onSelectTab;

  /// タブアイコン
  Map<SakaGroup, Widget> _tabIcon;

  BottomNavigation(this._selectedGroup, this._onSelectTab);

  @override
  Widget build(BuildContext context) {
    // TODO: アイコン作る
    _tabIcon = {
      SakaGroup.nogi: Icon(
        Icons.store,
        color: _selectTabColor(SakaGroup.nogi),
      ),
      SakaGroup.keyaki: Icon(
        Icons.store,
        color: _selectTabColor(SakaGroup.keyaki),
      ),
      SakaGroup.hinata: Icon(
        Icons.store,
        color: _selectTabColor(SakaGroup.hinata),
      ),
    };

    return BottomNavigationBar(
      elevation: 64,
      items: [
        _buildItem(SakaGroup.nogi),
        _buildItem(SakaGroup.keyaki),
        _buildItem(SakaGroup.hinata),
      ],
      type: BottomNavigationBarType.fixed,
      currentIndex: 0,
      onTap: (index) => _onSelectTab(SakaGroup.values[index]),
    );
  }

  BottomNavigationBarItem _buildItem(SakaGroup item) {
    return BottomNavigationBarItem(
      icon: _tabIcon[item],
      title: Text(
        SakaGroupHelper(item).getName(),
        style: TextStyle(
          fontWeight: FontWeight.bold,
          color: _selectTabColor(item),
        ),
      ),
      backgroundColor: _selectTabColor(item),
    );
  }

  Color _selectTabColor(SakaGroup item) {
    return _selectedGroup == item
        ? SakaGroupHelper(item).getColor()
        : Colors.grey;
  }
}
