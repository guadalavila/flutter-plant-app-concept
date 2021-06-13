import 'package:flutter/material.dart';
import 'package:flutter_plant_app/src/utils/consts.dart';

class Navbar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      backgroundColor: Colors.white,
      selectedItemColor: kPrimaryColor,
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
