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
              icon: Icon(Icons.home_rounded, color: Colors.white),
              label: 'Beranda',
              selectedIcon: Icon(Icons.home_rounded)),
          NavigationDestination(
              icon: Icon(Icons.download_rounded, color: Colors.white),
              label: 'Unduhan',
              selectedIcon: Icon(Icons.download_rounded)),
          NavigationDestination(
              icon: Icon(Icons.search_rounded, color: Colors.white),
              label: 'Cari',
              selectedIcon: Icon(Icons.search_rounded)),
          NavigationDestination(
              icon: Icon(Icons.bookmark_rounded, color: Colors.white),
              label: 'Markah',
              selectedIcon: Icon(Icons.bookmark_outline_rounded)),
          NavigationDestination(
            icon: Icon(Icons.person_rounded, color: Colors.white),
            label: 'Profil',
            selectedIcon: Icon(Icons.person_outline_rounded),
          ),
        ],
      ),
      body: const [
        HomeScreen(),
        DownloadScreen(),
        SearchScreen(),
        BookmarkScreen(),
        ProfileScreen()
      ][currentPageIndex],
    );
  }
}
