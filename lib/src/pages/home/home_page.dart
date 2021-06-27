import 'package:flutter/material.dart';
import 'package:flutter_plant_app/src/widgets/common/search_bar.dart';
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
            SizedBox(height: 10.0),
            SearchBar(),
            TipPlant(),
            Categories(),
            SizedBox(height: 15.0),
            ListPlant(),
            SizedBox(height: 50.0)
          ],
        ),
      ),
    );
  }
}
