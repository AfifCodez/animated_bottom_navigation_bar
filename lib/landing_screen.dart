import 'package:flutter/material.dart';
import 'package:bottom_navy_bar/bottom_navy_bar.dart';

import './pages/cartpage.dart';
import './pages/favoritepage.dart';
import './pages/homepage.dart';
import './pages/searchpage.dart';
import './widget/app_drawer.dart';

class LandingScreen extends StatefulWidget {
  @override
  _LandingScreenState createState() => _LandingScreenState();
}

class _LandingScreenState extends State<LandingScreen> {
  int previousValue = 0;
  int index = 0;
  PageController _controller;
  GlobalKey<ScaffoldState> _drawerKey = GlobalKey();

  @override
  void initState() {
    super.initState();
    _controller = PageController(initialPage: 0);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        key: _drawerKey,
        endDrawer: AppDrawer(),
        body: PageView(
          physics: BouncingScrollPhysics(),
          controller: _controller,
          children: [
            HomePage(),
            SearchPage(),
            FavoritePage(),
            CartPage(),
          ],
          onPageChanged: (page) {
            setState(() {
              index = page;
            });
          },
        ),
        bottomNavigationBar: buildBottomNavigation(),
      ),
    );
  }

  Widget buildBottomNavigation() {
    return BottomNavyBar(
      backgroundColor: Theme.of(context).accentColor,
      containerHeight: 60,
      selectedIndex: index <= 3 ? index : previousValue,
      onItemSelected: (index) => setState(() {
        this.index = index;
        if (index <= 3) {
          previousValue = index;
          _controller.jumpToPage(index);
        } else {
          _drawerKey.currentState.openEndDrawer();
        }
      }),
      items: <BottomNavyBarItem>[
        BottomNavyBarItem(
          icon: Icon(Icons.home_outlined),
          title: Text('Home'),
          textAlign: TextAlign.center,
          activeColor: Theme.of(context).primaryColor,
          inactiveColor: Colors.grey,
        ),
        BottomNavyBarItem(
          icon: Icon(Icons.search_outlined),
          title: Text('Search'),
          textAlign: TextAlign.center,
          activeColor: Theme.of(context).primaryColor,
          inactiveColor: Colors.grey,
        ),
        BottomNavyBarItem(
          icon: Icon(Icons.favorite_border_outlined),
          title: Text('Favorites'),
          textAlign: TextAlign.center,
          activeColor: Theme.of(context).primaryColor,
          inactiveColor: Colors.grey,
        ),
        BottomNavyBarItem(
          icon: Icon(Icons.shopping_bag_outlined),
          title: Text('Cart'),
          textAlign: TextAlign.center,
          activeColor: Theme.of(context).primaryColor,
          inactiveColor: Colors.grey,
        ),
        BottomNavyBarItem(
          icon: Icon(Icons.menu_rounded),
          title: Text('Menu'),
          textAlign: TextAlign.center,
          activeColor: Theme.of(context).primaryColor,
          inactiveColor: Colors.grey,
        ),
      ],
    );
  }
}
