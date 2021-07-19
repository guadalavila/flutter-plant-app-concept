import 'package:flutter/material.dart';
import 'package:flutter_plant_app/src/pages/explore/explore_page.dart';
import 'package:flutter_plant_app/src/pages/favorites/favorites_page.dart';
import 'package:flutter_plant_app/src/pages/home/home_page.dart';
import 'package:flutter_plant_app/src/pages/profile/profile_page.dart';
import 'package:flutter_plant_app/src/utils/consts.dart';

class MainApp extends StatefulWidget {
  const MainApp({Key? key}) : super(key: key);

  @override
  _MainAppState createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> _pages = <Widget>[
      HomePage(),
      FavoritePage(),
      ExplorePage(),
      ProfilePage()
    ];
    return Scaffold(
        body: Center(
          child: _pages.elementAt(_selectedIndex),
        ),
        bottomNavigationBar: BottomNavigationBar(
          selectedItemColor: kPrimaryColor,
          currentIndex: _selectedIndex,
          onTap: _onItemTapped,
          elevation: 4,
          type: BottomNavigationBarType.fixed,
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
            BottomNavigationBarItem(
                icon: Icon(Icons.favorite), label: 'Favoritos'),
            BottomNavigationBarItem(
                icon: Icon(Icons.explore_off_sharp), label: 'Novedades'),
            BottomNavigationBarItem(
                icon: Icon(Icons.account_circle_outlined), label: 'Perfil')
          ],
        ));
  }
}
