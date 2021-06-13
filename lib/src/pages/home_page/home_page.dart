import 'package:flutter/material.dart';
import 'package:flutter_plant_app/src/utils/consts.dart';
import 'package:flutter_plant_app/src/widgets/common/search_bar.dart';
import 'package:flutter_plant_app/src/widgets/common/navbar.dart';
import 'package:flutter_plant_app/src/widgets/home_page/tip_plant.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text(""),
        backgroundColor: kBackgroundColor,
        elevation: 0,
      ),
      body: Container(
        width: _size.width * 1,
        child: Column(
          children: [SearchBar(), TipPlant()],
        ),
      ),
      bottomNavigationBar: Navbar(),
    );
  }
}
