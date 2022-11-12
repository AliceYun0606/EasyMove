import 'package:flutter/material.dart';
import 'package:testingproject/home.dart';
import 'package:testingproject/order.dart';
import 'package:testingproject/chat.dart';
import 'package:testingproject/account.dart';

enum PageItem {
  Home("Home"),
  Order("Order"),
  Chat("Chat"),
  Account("Account");

  const PageItem(this.title);
  final String title;
}

void main() {
  runApp(const EasyMove());
}

class EasyMove extends StatelessWidget {
  const EasyMove({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'EasyMove',
      theme: ThemeData(
        primarySwatch: Colors.orange,
        primaryColor: const Color(0xFFFB8C00),
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: const NavBar(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class NavBar extends StatefulWidget {
  const NavBar({super.key});

  @override
  State<StatefulWidget> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  var _currentTab = PageItem.Home;
  final _navigatorKeys = {
    PageItem.Home: GlobalKey<NavigatorState>(),
    PageItem.Order: GlobalKey<NavigatorState>(),
    PageItem.Chat: GlobalKey<NavigatorState>(),
    PageItem.Account: GlobalKey<NavigatorState>(),
  };

  void _selectTab(PageItem pageItem) {
    if (pageItem == _currentTab) {
      // pop to first route
      _navigatorKeys[PageItem]!.currentState!.popUntil((route) => route.isFirst);
    } else {
      setState(() => _currentTab = pageItem);
    }
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        final isFirstRouteInCurrentTab =
        !await _navigatorKeys[_currentTab]!.currentState!.maybePop();
        if (isFirstRouteInCurrentTab) {
          // if not on the 'main' tab
          if (_currentTab != PageItem.Home) {
            // select 'main' tab
            _selectTab(PageItem.Home);
            // back button handled by app
            return false;
          }
        }
        // let system handle back button if we're on the first route
        return isFirstRouteInCurrentTab;
      },
      child: Scaffold(
        body: Stack(children: <Widget>[
          _buildOffstageNavigator(PageItem.Home),
          _buildOffstageNavigator(PageItem.Order),
          _buildOffstageNavigator(PageItem.Chat),
          _buildOffstageNavigator(PageItem.Account),
        ]),
        bottomNavigationBar: BottomNavigation(
          currentTab: _currentTab,
          onSelectTab: _selectTab,
        ),
      ),
    );
  }

  Widget _buildOffstageNavigator(PageItem pageItem) {
    return Offstage(
      offstage: _currentTab != pageItem,
      child: TabNavigator(
        navigatorKey: _navigatorKeys[pageItem],
        pageItem: pageItem,
      ),
    );
  }
}

class BottomNavigation extends StatelessWidget {
  const BottomNavigation({super.key, required this.currentTab, required this.onSelectTab});
  final PageItem currentTab;
  final ValueChanged<PageItem> onSelectTab;
  final int _selectedIndex = 0;
  
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      items: [
        BottomNavigationBarItem(
            icon: Icon(
              Icons.home_filled,
              color: _onCurrentPage(PageItem.Home),
            ),
            label: ('Home'),
        ),
        BottomNavigationBarItem(
          icon: Icon(
            Icons.list_alt,
            color: _onCurrentPage(PageItem.Order),
          ),
          label: ('Order'),
        ),
        BottomNavigationBarItem(
          icon: Icon(
            Icons.chat,
            color: _onCurrentPage(PageItem.Chat),
          ),
          label: ('Chat'),
        ),
        BottomNavigationBarItem(
          icon: Icon(
            Icons.person,
            color: _onCurrentPage(PageItem.Account),
          ),
          label: ('Account'),
        ),
      ],
      onTap: (index) => onSelectTab(
        PageItem.values[index],
      ),
      currentIndex: currentTab.index,
      selectedItemColor: Colors.orange.shade400,
    );
  }

  Color _onCurrentPage(PageItem item) {
    return currentTab == item ? Colors.orange : Colors.grey;
  }
}

class TabNavigatorRoutes {
  static const String root = '/';
}

class TabNavigator extends StatelessWidget {
  const TabNavigator({super.key, required this.navigatorKey, required this.pageItem});
  final GlobalKey<NavigatorState>? navigatorKey;
  final PageItem pageItem;

  void _push(BuildContext context) {
    var routeBuilders = _routeBuilders(context);

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) =>
            routeBuilders[TabNavigatorRoutes.root]!(context),
      ),
    );
  }

  Map<String, WidgetBuilder> _routeBuilders(BuildContext context) {
    return {
      TabNavigatorRoutes.root: (context) => HomePage(
        title: pageItem.name,
        onPush: (materialIndex) => _push(context),
      ),
      TabNavigatorRoutes.root: (context) => OrderPage(
        title: pageItem.name,
        onPush: (materialIndex) => _push(context),
      ),
      TabNavigatorRoutes.root: (context) => ChatPage(
        title: pageItem.name,
        onPush: (materialIndex) => _push(context),
      ),
      TabNavigatorRoutes.root: (context) => AccountPage(
        title: pageItem.name,
        onPush: (materialIndex) => _push(context),
      ),
    };
  }

  @override
  Widget build(BuildContext context) {
    final routeBuilders = _routeBuilders(context);
    return Navigator(
      key: navigatorKey,
      initialRoute: TabNavigatorRoutes.root,
      onGenerateRoute: (routeSettings) {
        return MaterialPageRoute(
          builder: (context) => routeBuilders[routeSettings.name!]!(context),
        );
      },
    );
  }
}
