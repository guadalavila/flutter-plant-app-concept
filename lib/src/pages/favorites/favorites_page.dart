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
            Column(
              children: _generateFavorites(),
            )
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
        margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15.0), color: Colors.white),
        child: Row(children: [
          Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15.0),
                color: Colors.orange[50]),
            width: 100.0,
            child: Image(
              height: 80.0,
              image: index.isOdd
                  ? AssetImage("assets/images/plant1.png")
                  : AssetImage("assets/images/plant2.png"),
              fit: BoxFit.contain,
            ),
          ),
          Expanded(
              child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Pilea",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Text(
                    "Lorem ipsu, klsad nhi daisdj sdjoasd isaodjisajoasdosaopdjs isada jisadji ",
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis),
              ],
            ),
          ))
        ]));
  }
}

// GridView.count(
//       shrinkWrap: true,
//       crossAxisCount: 2,
//       primary: false,
//       crossAxisSpacing: 10,
//       mainAxisSpacing: 10,
//       scrollDirection: Axis.vertical,
//       // physics: ScrollPhysics(),
//       children: _generateFavorites()),
