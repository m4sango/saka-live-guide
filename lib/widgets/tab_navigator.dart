import 'package:flutter/material.dart';
import 'package:saka_live_guide/model/bottom_tab_item.dart';

class TabNavigatorRoutes {
  static const String nogi = '/nogi';
  static const String keyaki = '/keyaki';
  static const String hinata = '/hinata';
  static const String root = '/';
}

/// タブ操作クラス
class TabNavigator extends StatelessWidget {
  TabNavigator({this.navigatorKey, this.tabItem});

  final GlobalKey<NavigatorState> navigatorKey;
  final TabItem tabItem;

  /// 次の画面に遷移する。
  void push(BuildContext context, Widget next) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => next,
      ),
    );
  }

  /// 各タブのルート
  Map<String, WidgetBuilder> _routeBuilders() {
    // TODO: 各ページ
    return {
      TabNavigatorRoutes.nogi: (context) => Text("nogi"),
      TabNavigatorRoutes.keyaki: (context) => Text("keyaki"),
      TabNavigatorRoutes.hinata: (context) => Text("hinata"),
    };
  }

  final Map<TabItem, String> _tabItemRoutes = {
    TabItem.nogi: TabNavigatorRoutes.nogi,
    TabItem.keyaki: TabNavigatorRoutes.keyaki,
    TabItem.hinata: TabNavigatorRoutes.hinata,
  };

  @override
  Widget build(BuildContext context) {
    return Navigator(
      key: navigatorKey,
      initialRoute: TabNavigatorRoutes.root,
      onGenerateRoute: (routeSettings) {
        if (routeSettings.name == TabNavigatorRoutes.root) {
          return MaterialPageRoute(
            builder: (context) =>
                _routeBuilders()[_tabItemRoutes[tabItem]](context),
          );
        }
        return MaterialPageRoute(
          builder: (context) => _routeBuilders()[routeSettings.name](context),
        );
      },
    );
  }
}
