import 'package:flutter/material.dart';
import 'package:flutter_plant_app/src/widgets/common/search_bar.dart';
import 'package:flutter_plant_app/src/widgets/common/navbar.dart';
import 'package:flutter_plant_app/src/widgets/home_page/categories.dart';
import 'package:flutter_plant_app/src/widgets/home_page/list_plant.dart';
import 'package:flutter_plant_app/src/widgets/home_page/tip_plant.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          children: [
            SizedBox(height: kToolbarHeight),
            SearchBar(),
            TipPlant(),
            Categories(),
            ListPlant(),
            SizedBox(height: 30.0)
          ],
        ),
      ),
      bottomNavigationBar: Navbar(),
    );
  }
}
