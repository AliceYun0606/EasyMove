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
  var _currentPage = PageItem.Home;
  final _navigatorKeys = {
    PageItem.Home: GlobalKey<NavigatorState>(),
    PageItem.Order: GlobalKey<NavigatorState>(),
    PageItem.Chat: GlobalKey<NavigatorState>(),
    PageItem.Account: GlobalKey<NavigatorState>(),
  };

  void _selectPage(PageItem pageItem) {
    if (pageItem == _currentPage) {
      // pop to first route
      _navigatorKeys[PageItem]!.currentState!.popUntil((route) => route.isFirst);
    } else {
      setState(() => _currentPage = pageItem);
    }
  }

  static const List<Widget> _pages = <Widget>[
    HomePage(title: 'Home'),
    OrderPage(title: 'Order'),
    ChatPage(title: 'Chat'),
    AccountPage(title: 'Account'),
  ];

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        final isFirstRouteInCurrentPage =
        !await _navigatorKeys[_currentPage]!.currentState!.maybePop();
        if (isFirstRouteInCurrentPage) {
          // if not on the 'main' Page
          if (_currentPage != PageItem.Home) {
            // select 'main' Page
            _selectPage(PageItem.Home);
            // back button handled by app
            return false;
          }
        }
        // let system handle back button if we're on the first route
        return isFirstRouteInCurrentPage;
      },
      child: Scaffold(
        body: Center(
          child: _pages.elementAt(_currentPage.index),
        ),
        bottomNavigationBar: BottomNavigation(
          currentPage: _currentPage,
          onSelectPage: _selectPage,
        ),
      ),
    );
  }

class BottomNavigation extends StatelessWidget {
  const BottomNavigation({super.key, required this.currentPage, required this.onSelectPage});
  final PageItem currentPage;
  final ValueChanged<PageItem> onSelectPage;
  final int _selectedIndex = 0;
  
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      iconSize: 30,
      showSelectedLabels: false,
      showUnselectedLabels: false,
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
      onTap: (index) => onSelectPage(
        PageItem.values[index],
      ),
      currentIndex: currentPage.index,
      selectedItemColor: Colors.orange.shade400,
    );
  }

  Color _onCurrentPage(PageItem item) {
    return currentPage == item ? Colors.orange : Colors.grey;
  }
}
