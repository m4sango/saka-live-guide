import 'package:flutter/material.dart';
import 'package:saka_live_guide/model/saka_group.dart';
import 'package:saka_live_guide/widgets/bottom_navigation.dart';
import 'package:saka_live_guide/widgets/tab_navigator.dart';

class App extends StatefulWidget {
  @override
  State createState() => _AppState();
}

class _AppState extends State<App> {
  SakaGroup _currentTab = SakaGroup.nogi;

  Map<SakaGroup, GlobalKey<NavigatorState>> _navigatorKeys = {
    SakaGroup.nogi: GlobalKey<NavigatorState>(),
    SakaGroup.keyaki: GlobalKey<NavigatorState>(),
    SakaGroup.hinata: GlobalKey<NavigatorState>(),
  };

  /// タブをタップされたときの処理
  void _onSelectTab(SakaGroup item) {
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
          if (_currentTab != SakaGroup.nogi) {
            _onSelectTab(SakaGroup.nogi);
            return false;
          }
        }
        return isFirstRouteInCurrentTab;
      },
      child: Scaffold(
        body: Stack(
          children: <Widget>[
            _buildOffstageNavigator(SakaGroup.nogi),
            _buildOffstageNavigator(SakaGroup.keyaki),
            _buildOffstageNavigator(SakaGroup.hinata),
          ],
        ),
        bottomNavigationBar: BottomNavigation(
          _currentTab,
          _onSelectTab,
        ),
      ),
    );
  }

  Widget _buildOffstageNavigator(SakaGroup tabItem) {
    return Offstage(
      offstage: _currentTab != tabItem,
      child: TabNavigator(
        navigatorKey: _navigatorKeys[tabItem],
        tabItem: tabItem,
      ),
    );
  }
}
