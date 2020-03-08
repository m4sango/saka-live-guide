import 'package:flutter/material.dart';
import 'package:saka_live_guide/model/bottom_tab_item.dart';

class BottomNavigation extends StatelessWidget {
  final TabItem _currentTab;
  final ValueChanged<TabItem> _onSelectTab;

  /// タブタイトル
  final Map<TabItem, String> _tabName = {
    TabItem.nogi: "乃木坂",
    TabItem.keyaki: "欅坂",
    TabItem.hinata: "日向坂",
  };

  /// タブタイトル
  final Map<TabItem, Color> _tabColor = {
    TabItem.nogi: Colors.purple,
    TabItem.keyaki: Colors.green,
    TabItem.hinata: Colors.lightBlue,
  };

  /// タブアイコン
  Map<TabItem, Widget> _tabIcon;

  BottomNavigation(this._currentTab, this._onSelectTab);

  @override
  Widget build(BuildContext context) {
    // TODO: アイコン作る
    _tabIcon = {
      TabItem.nogi: Icon(
        Icons.store,
        color: _selectTabColor(TabItem.nogi),
      ),
      TabItem.keyaki: Icon(
        Icons.store,
        color: _selectTabColor(TabItem.keyaki),
      ),
      TabItem.hinata: Icon(
        Icons.store,
        color: _selectTabColor(TabItem.hinata),
      ),
    };

    return BottomNavigationBar(
      elevation: 64,
      items: [
        _buildItem(TabItem.nogi),
        _buildItem(TabItem.keyaki),
        _buildItem(TabItem.hinata),
      ],
      type: BottomNavigationBarType.fixed,
      currentIndex: 0,
      onTap: (index) => _onSelectTab(TabItem.values[index]),
    );
  }

  BottomNavigationBarItem _buildItem(TabItem item) {
    return BottomNavigationBarItem(
      icon: _tabIcon[item],
      title: Text(
        _tabName[item],
        style: TextStyle(
          fontWeight: FontWeight.bold,
          color: _selectTabColor(item),
        ),
      ),
      backgroundColor: _selectTabColor(item),
    );
  }

  Color _selectTabColor(TabItem item) {
    return _currentTab == item ? _tabColor[item] : Colors.grey;
  }
}
