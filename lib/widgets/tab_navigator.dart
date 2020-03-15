import 'package:flutter/material.dart';
import 'package:saka_live_guide/model/saka_group.dart';
import 'package:saka_live_guide/screens/select_menu_screen.dart';

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
  final SakaGroup tabItem;

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
    return {
      TabNavigatorRoutes.nogi: (context) => SelectMenuScreen(SakaGroup.nogi),
      TabNavigatorRoutes.keyaki: (context) =>
          SelectMenuScreen(SakaGroup.keyaki),
      TabNavigatorRoutes.hinata: (context) =>
          SelectMenuScreen(SakaGroup.hinata),
    };
  }

  final Map<SakaGroup, String> _tabItemRoutes = {
    SakaGroup.nogi: TabNavigatorRoutes.nogi,
    SakaGroup.keyaki: TabNavigatorRoutes.keyaki,
    SakaGroup.hinata: TabNavigatorRoutes.hinata,
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
