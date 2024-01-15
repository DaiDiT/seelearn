import 'package:flutter/material.dart';
import 'screens/home_screen.dart';
import 'screens/download_screen.dart';
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
        backgroundColor: Colors.white,
        indicatorColor: const Color(0xffe1e1e1),
        selectedIndex: currentPageIndex,
        destinations: const [
          NavigationDestination(
            icon: Icon(Icons.home_rounded),
            label: 'Beranda',
          ),
          NavigationDestination(
            icon: Icon(Icons.download_rounded),
            label: 'Unduhan',
          ),
          NavigationDestination(
            icon: Icon(Icons.person_rounded),
            label: 'Profil',
          ),
        ],
      ),
      body: const [
        HomeScreen(),
        DownloadScreen(),
        ProfileScreen()
      ][currentPageIndex],
    );
  }
}
