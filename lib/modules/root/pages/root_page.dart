import 'package:flutter/material.dart';
import 'package:ontari_app/modules/root/widgets/tab_item.dart';
import 'package:ontari_app/modules/root/widgets/cupertino_home_scaffold.dart';

import '../../activity/pages/activity_page.dart';
import '../../category/pages/category_page.dart';
import '../../home/pages/home_page.dart';
import '../../setting/pages/setting_page.dart';

class RootPage extends StatefulWidget {
  const RootPage({Key? key, this.currentTab = TabItem.home}) : super(key: key);
  final TabItem currentTab;

  @override
  _RootPageState createState() => _RootPageState();
}

class _RootPageState extends State<RootPage> {
  late TabItem _currentTab = widget.currentTab;

  final Map<TabItem, GlobalKey<NavigatorState>> navigatorKeys = {
    TabItem.home: GlobalKey<NavigatorState>(),
    TabItem.activity: GlobalKey<NavigatorState>(),
    TabItem.category: GlobalKey<NavigatorState>(),
    TabItem.setting: GlobalKey<NavigatorState>(),
  };

  Map<TabItem, WidgetBuilder> get widgetBuilders {
    return {
      TabItem.home: (_) => const HomePage(),
      TabItem.activity: (_) => const ActivityPage(),
      TabItem.category: (_) => const CategoryPage(),
      TabItem.setting: (_) => const SettingPage(),
    };
  }

  void _select(TabItem tabItem) {
    if (tabItem == _currentTab) {
      navigatorKeys[tabItem]!.currentState?.popUntil((route) => route.isFirst);
    } else {
      setState(() => _currentTab = tabItem);
    }
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        final isFirstRouteInCurrentTab =
            !await navigatorKeys[_currentTab]!.currentState!.maybePop();
        print('isFirstRouteInCurrentTab: $isFirstRouteInCurrentTab');
        print(_currentTab);

        return isFirstRouteInCurrentTab;
      },
      child: CupertinoHomeScaffold(
        currentTab: _currentTab,
        onSelectTab: _select,
        widgetBuilders: widgetBuilders,
        navigatorKeys: navigatorKeys,
      ),
    );
  }
}
