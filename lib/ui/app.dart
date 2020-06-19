import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:music/ui/components/mini_player.dart';
import 'package:music/ui/components/theme.dart';
import 'package:music/ui/screens/settings.dart';
import 'package:music/ui/screens/library.dart';
import 'package:music/ui/screens/explore.dart';
import 'package:music/ui/screens/search.dart';
import 'package:music/ui/screens/trending.dart';

class App extends StatefulWidget {
  @override
  _App createState() => new _App();
}

class _App extends State<App> {

  int currentTab;
  Widget explore;
  Widget trending;
  Widget search;
  Widget library;
  Widget settings;

  @override
  void didChangeDependencies() {
    currentTab = 0;
    explore = Explore(navId: 0);
    trending = Trending(navId: 1);
    search = Search(navId: 2);
    library = Library(navId: 3);
    settings = Settings(navId: 4);

    SystemChrome.setEnabledSystemUIOverlays(
        [SystemUiOverlay.bottom, SystemUiOverlay.top]);
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarBrightness: Brightness.light,
        statusBarIconBrightness: Brightness.dark,
        statusBarColor: Colors.white,
      )
    );
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      child: Scaffold(
        body: Stack(
          children: <Widget>[
            IndexedStack(
              index: currentTab,
              children: _pages(),
            ),
            _buildBottomBar()
          ],
        ),
      ),
    );
  }

  List<Widget> _pages() {
    return <Widget>[
      stackedPage(0, explore),
      stackedPage(1, trending),
      stackedPage(2, search),
      stackedPage(3, library),
      stackedPage(4, settings),
    ];
  }

  Widget stackedPage(int index, child) {
    return MaterialApp(
      theme: mainThemeLight(context),
      debugShowCheckedModeBanner: false,
      navigatorKey: Get.nestedKey(index),
      home: Padding(
        ///Todo: set this padding value according to MiniPlayers height
      padding: const EdgeInsets.only(bottom: 115),
        child: Offstage(
            offstage: currentTab != index,
            child: TickerMode(enabled: currentTab == index, child: child)),
      ),
    );
  }

  _buildBottomBar() {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          AnimatedSwitcher(
            duration: Duration(milliseconds: 100),
            ///Todo: show/hide MiniPlayer in here
            child: MiniPlayer(),
//            child: Container(),
          ),
          BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            backgroundColor: Theme.of(context).bottomAppBarColor,
            currentIndex: currentTab,
            iconSize: 26,
            selectedLabelStyle: TextStyle(fontSize: 10, fontWeight: FontWeight.bold),
            unselectedLabelStyle: TextStyle(fontSize: 9, fontWeight: FontWeight.bold, height: 1.4),
            unselectedItemColor: Theme.of(context).textTheme.bodyText1.color.withOpacity(.4),
            elevation: 4,
            onTap: (int index) {
              setState(() {
                currentTab = index;
              });
            },
            items: [
              BottomNavigationBarItem(
                  icon: Icon(Icons.music_note), title: Text('EXPLORE')),
              BottomNavigationBarItem(
                  icon: Icon(Icons.whatshot), title: Text('TRENDING')),
              BottomNavigationBarItem(
                  icon: Icon(Icons.search), title: Text('SEARCH')),
              BottomNavigationBarItem(
                  icon: Icon(Icons.library_music), title: Text('LIBRARY')),
              BottomNavigationBarItem(
                  icon: Icon(Icons.settings), title: Text('SETTINGS')),
            ],
          ),
        ],
      ),
    );
  }
}
