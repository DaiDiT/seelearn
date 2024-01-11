import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'screens/home_screen.dart';
import 'screens/download_screen.dart';
import 'screens/search_screen.dart';
import 'screens/bookmark_screen.dart';
import 'screens/profile_screen.dart';

class NavigationMenu extends StatefulWidget {
  const NavigationMenu({Key? key}) : super(key: key);

  @override
  State<NavigationMenu> createState() => _NavigationMenuState();
}

class _NavigationMenuState extends State<NavigationMenu> {
  int currentPageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: NavigationBar(
        onDestinationSelected: (int idx) {
          setState(() {
            currentPageIndex = idx;
          });
        },
        height: 60,
        elevation: 0,
        backgroundColor: Colors.lightBlue,
        indicatorColor: Colors.white,
        selectedIndex: currentPageIndex,
        destinations: const [
          NavigationDestination(
              icon: Icon(Icons.home_rounded), label: 'Beranda'),
          NavigationDestination(
              icon: Icon(Icons.download_rounded), label: 'Unduhan'),
          NavigationDestination(
              icon: Icon(Icons.search_rounded), label: 'Cari'),
          NavigationDestination(
              icon: Icon(Icons.bookmark_rounded), label: 'Markah'),
          NavigationDestination(
            icon: Icon(CupertinoIcons.person_fill, color: Colors.white),
            label: 'Profil',
            selectedIcon: Icon(CupertinoIcons.person),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
        child: const [
          HomeScreen(),
          DownloadScreen(),
          SearchScreen(),
          BookmarkScreen(),
          ProfileScreen()
        ][currentPageIndex],
      ),
    );
  }
}
