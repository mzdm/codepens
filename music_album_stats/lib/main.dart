import 'package:flutter/material.dart';
import 'package:music_album_stats/data/favorites_provider.dart';
import 'package:music_album_stats/data/theme_provider.dart';
import 'package:music_album_stats/pages/favorites_page.dart';
import 'package:music_album_stats/pages/main_page.dart';
import 'package:music_album_stats/pages/settings_page.dart';
import 'package:music_album_stats/utils/themes.dart';

void main() => runApp(
      FavoritesStateContainer(
        child: ThemeStateContainer(child: MainApp()),
      ),
    );

class MainApp extends StatefulWidget {
  MainApp([this.startingIndex = 1]);

  final int startingIndex;

  @override
  _MainAppState createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> with SingleTickerProviderStateMixin {
  int _activeTabIndex;

  TabController _tabController;

  final _bottomNavPages = <Widget>[
    Container(),
    MainPage(),
    FavoritesPage(),
    SettingsPage(),
  ];

  @override
  void initState() {
    _activeTabIndex = widget.startingIndex;

    _tabController = TabController(
      initialIndex: 1,
      length: 4,
      vsync: this,
    );
    _tabController.addListener(() => setState(() => _activeTabIndex = _tabController.index));
    if (_activeTabIndex != null && _activeTabIndex == 3) {
      _tabController.animateTo(_activeTabIndex);
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final themeProvider = ThemeStateContainer.of(context);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: themeProvider.isDarkMode ? ThemesUtils.darkTheme() : ThemesUtils.lightTheme(),
      home: LayoutBuilder(
        builder: (context, constraints) {
          if (constraints.maxWidth < 800) {
            return Scaffold(
              bottomNavigationBar: bottomNavMenu(),
              body: _bottomNavPages[_activeTabIndex],
            );
          }
          return Scaffold(
            body: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Flexible(
                  flex: 1,
                  child: webSideMenu(),
                ),
                Flexible(
                  flex: 4,
                  child: _bottomNavPages[_activeTabIndex],
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget bottomNavMenu() {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      currentIndex: _activeTabIndex ?? 1,
      items: [
        BottomNavigationBarItem(
          title: Text('Home'),
          icon: Icon(Icons.home),
        ),
        BottomNavigationBarItem(
          title: Text('Discover'),
          icon: Icon(Icons.music_note),
        ),
        BottomNavigationBarItem(
          title: Text('Favorites'),
          icon: Icon(Icons.favorite),
        ),
        BottomNavigationBarItem(
          title: Text('Settings'),
          icon: Icon(Icons.settings),
        ),
      ],
      onTap: (index) {
        if (index != 0) {
          setState(() => _activeTabIndex = index);
        }
      },
    );
  }

  Widget webSideMenu() {
    final themeProvider = ThemeStateContainer.of(context);

    return Container(
      height: double.infinity,
      width: 200.0,
      color:
          themeProvider.isDarkMode ? Colors.black.withOpacity(0.3) : null,
      child: ListView(
        shrinkWrap: true,
        children: <Widget>[
          SizedBox(height: 50.0),
          ListTile(
            leading: Icon(Icons.home),
            title: Text('Home'),
            selected: false,
            onTap: () {},
          ),
          SizedBox(height: 20.0),
          ListTile(
            leading: Icon(Icons.music_note),
            title: Text('Discover'),
            selected: _tabController.index == 1 ? true : false,
            onTap: () {
              setState(() {
                _tabController.animateTo(1);
                _activeTabIndex = 1;
              });
            },
          ),
          SizedBox(height: 5.0),
          ListTile(
            leading: Icon(Icons.favorite),
            title: Text('Favorites'),
            selected: _tabController.index == 2 ? true : false,
            onTap: () {
              setState(() {
                _tabController.animateTo(2);
                _activeTabIndex = 2;
              });
            },
          ),
          SizedBox(height: 5.0),
          ListTile(
            leading: Icon(Icons.settings),
            title: Text('Settings'),
            selected: _tabController.index == 3 ? true : false,
            onTap: () {
              setState(() {
                _tabController.animateTo(3);
                _activeTabIndex = 3;
              });
            },
          ),
        ],
      ),
    );
  }
}
