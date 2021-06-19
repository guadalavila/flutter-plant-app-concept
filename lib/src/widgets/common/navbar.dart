import 'package:flutter/material.dart';
import 'package:flutter_plant_app/src/utils/consts.dart';

class Navbar extends StatefulWidget {
  @override
  _NavbarState createState() => _NavbarState();
}

class _NavbarState extends State<Navbar> {
  @override
  Widget build(BuildContext context) {
    int _selectedIndex = 0;

    void _onItemTapped(int index) {
      setState(() {
        _selectedIndex = index;
      });
    }

    return BottomNavigationBar(
      backgroundColor: Colors.white,
      selectedItemColor: kPrimaryColor,
      currentIndex: _selectedIndex,
      onTap: _onItemTapped,
      elevation: 4,
      type: BottomNavigationBarType.fixed,
      items: [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
        BottomNavigationBarItem(icon: Icon(Icons.favorite), label: 'Favoritos'),
        BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart), label: 'Carrito'),
        BottomNavigationBarItem(
            icon: Icon(Icons.account_circle_outlined), label: 'Perfil')
      ],
    );
  }
}
