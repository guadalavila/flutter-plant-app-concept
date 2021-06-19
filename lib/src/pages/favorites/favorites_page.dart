import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class FavoritePage extends StatelessWidget {
  const FavoritePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          children: <Widget>[
            Container(
                padding: EdgeInsets.all(10.0),
                child: Text("Mis Favoritos",
                    style: TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 30.0))),
            GridView.count(
                shrinkWrap: true,
                crossAxisCount: 2,
                primary: false,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                scrollDirection: Axis.vertical,
                // physics: ScrollPhysics(),
                children: _generateFavorites()),
          ],
        ),
      ),
    );
  }

  List<Widget> _generateFavorites() {
    return List.generate(50, (index) => _createItem(index));
  }

  Widget _createItem(int index) {
    return Container(
        margin: EdgeInsets.all(10),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20.0), color: Colors.white),
        child: Center(
          child: Image(
            height: 80.0,
            image: index.isOdd
                ? AssetImage("assets/images/plant1.png")
                : AssetImage("assets/images/plant2.png"),
            fit: BoxFit.cover,
          ),
        ));
  }
}
