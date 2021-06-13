import 'package:flutter/material.dart';
import 'package:flutter_plant_app/src/widgets/common/search_bar.dart';
import 'package:flutter_plant_app/src/widgets/common/navbar.dart';
import 'package:flutter_plant_app/src/widgets/home_page/tip_plant.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        child: Column(
          children: [SizedBox(height: kToolbarHeight), SearchBar(), TipPlant()],
        ),
      ),
      bottomNavigationBar: Navbar(),
    );
  }
}
