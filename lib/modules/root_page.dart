import 'package:flutter/material.dart';
import 'package:ontari_app/modules/root/widgets/tab_item.dart';
import 'package:ontari_app/themes/app_color.dart';
import 'package:ontari_app/modules/activity/pages/activity_page.dart';
import 'package:ontari_app/modules/category/pages/category_page.dart';
import 'package:ontari_app/modules/setting/pages/setting_page.dart';

import 'home/pages/home_page.dart';

class RootPage extends StatefulWidget {
  const RootPage({Key? key, this.currentTab = TabItem.home}) : super(key: key);
  final TabItem currentTab;

  @override
  _RootPageState createState() => _RootPageState();
}

class _RootPageState extends State<RootPage> {
  //----------------------------------------------------------------------------
  late TabItem _currentTab;

  @override
  void initState() {
    super.initState();
    _currentTab = widget.currentTab;
  }

  final Map<TabItem, GlobalKey<NavigatorState>> navigatorKeys = {
    TabItem.home: GlobalKey<NavigatorState>(),
    TabItem.activity: GlobalKey<NavigatorState>(),
    TabItem.category: GlobalKey<NavigatorState>(),
    TabItem.setting: GlobalKey<NavigatorState>(),
  };

  Map<TabItem, WidgetBuilder> get widgetBuilders {
    return {
      TabItem.home: (_) => HomePage(),
      TabItem.activity: (_) => ActivityPage(),
      TabItem.category: (_) => CategoryPage(),
      TabItem.setting: (_) => SettingPage(),
    };
  }

  void _select(TabItem tabItem) {
    if (tabItem == _currentTab) {
      navigatorKeys[tabItem]!.currentState?.popUntil((route) => route.isFirst);
    } else {
      setState(() => _currentTab = tabItem);
    }
  }

  Widget _builderNavigator(int index) {
    final item = TabItem.values[index];
    return Builder(
      key: navigatorKeys[index],
      builder: (context) => widgetBuilders[item]!(context),
    );
  }
  //----------------------------------------------------------------------------

  @override
  Widget build(BuildContext context) {
    //print(widget.currentTab);
    return WillPopScope(
      onWillPop: () async {
        // final isFirstRouteInCurrentTab =
        //     !await _navigatorKeys[_selectedIndex].currentState!.maybePop();
        final isFirstRouteInCurrentTab =
            !await navigatorKeys[widget.currentTab]!.currentState!.maybePop();
        print('isFirstRouteInCurrentTab: $isFirstRouteInCurrentTab');
        print(widget.currentTab);

        return isFirstRouteInCurrentTab;
      },
      child: Scaffold(
        body: _builderNavigator(_currentTab.index),
        extendBody: true,
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          selectedFontSize: 12,
          unselectedFontSize: 12,
          backgroundColor: DarkTheme.greyScale800,
          unselectedItemColor: DarkTheme.greyScale400,
          selectedItemColor: DarkTheme.primaryBlue600,
          currentIndex: _currentTab.index,
          onTap: (index) => _select(TabItem.values[index]),
          items: [
            _buildItem(TabItem.home),
            _buildItem(TabItem.activity),
            _buildItem(TabItem.category),
            _buildItem(TabItem.setting),
          ],
        ),
      ),
    );
  }

  BottomNavigationBarItem _buildItem(TabItem tabItem) {
    final itemData = TabItemData.allTabs[tabItem]!;
    return BottomNavigationBarItem(
      icon: itemData.icon,
      label: itemData.label,
      activeIcon: itemData.activeIcon,
    );
  }

  // Map<String, WidgetBuilder> _routeBuilders(BuildContext context, int index) {
  //   return {
  //     '/': (context) {
  //       return _tabs.elementAt(index);
  //     },
  //   };
  // }

  // Widget _buildOffstageNavigator(int index) {
  //   var routeBuilders = _routeBuilders(context, index);

  //   return Offstage(
  //     offstage: _selectedIndex != index,
  //     child: Navigator(
  //       key: _navigatorKeys[index],
  //       onGenerateRoute: (routeSettings) {
  //         return MaterialPageRoute(
  //           builder: (context) => routeBuilders[routeSettings.name]!(context),
  //         );
  //       },
  //     ),
  //   );
  // }
}
