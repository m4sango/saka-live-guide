import 'package:flutter/material.dart';
import 'package:saka_live_guide/model/bottom_tab_item.dart';
import 'package:saka_live_guide/widgets/bottom_navigation.dart';
import 'package:saka_live_guide/widgets/tab_navigator.dart';

class App extends StatefulWidget {
  @override
  State createState() => _AppState();
}

class _AppState extends State<App> {
  TabItem _currentTab = TabItem.nogi;

  Map<TabItem, GlobalKey<NavigatorState>> _navigatorKeys = {
    TabItem.nogi: GlobalKey<NavigatorState>(),
    TabItem.keyaki: GlobalKey<NavigatorState>(),
    TabItem.hinata: GlobalKey<NavigatorState>(),
  };

  /// タブをタップされたときの処理
  void _onSelectTab(TabItem item) {
    if (item == _currentTab) {
      // 選択されたタブのルートの最初の画面まで戻る
      _navigatorKeys[item].currentState.popUntil((route) => route.isFirst);
    } else {
      setState(() => _currentTab = item);
    }
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        // pop不可 == ルートの最初の画面かどうか
        final isFirstRouteInCurrentTab =
            !await _navigatorKeys[_currentTab].currentState.maybePop();
        if (isFirstRouteInCurrentTab) {
          if (_currentTab != TabItem.nogi) {
            _onSelectTab(TabItem.nogi);
            return false;
          }
        }
        return isFirstRouteInCurrentTab;
      },
      child: Scaffold(
        body: Stack(
          children: <Widget>[
            _buildOffstageNavigator(TabItem.nogi),
            _buildOffstageNavigator(TabItem.keyaki),
            _buildOffstageNavigator(TabItem.hinata),
          ],
        ),
        bottomNavigationBar: BottomNavigation(
          _currentTab,
          _onSelectTab,
        ),
      ),
    );
  }

  Widget _buildOffstageNavigator(TabItem tabItem) {
    return Offstage(
      offstage: _currentTab != tabItem,
      child: TabNavigator(
        navigatorKey: _navigatorKeys[tabItem],
        tabItem: tabItem,
      ),
    );
  }
}
