import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_plant_app/src/providers/favorites_provider.dart';
import 'package:flutter_plant_app/src/widgets/common/sliver_app.dart';
import 'package:provider/provider.dart';

class FavoritePage extends StatelessWidget {
  const FavoritePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _favoritesProvider = Provider.of<FavoritesProvider>(context);
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverApp(title: "Favoritos", backButton: false),
          SliverList(
              delegate: SliverChildListDelegate(List.generate(
                  _favoritesProvider.favorites.length,
                  (i) => Container(
                      margin: EdgeInsets.symmetric(
                          vertical: 10.0, horizontal: 20.0),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15.0),
                          color: Colors.white),
                      child: Row(children: [
                        Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15.0),
                              color: Colors.orange[50]),
                          width: 100.0,
                          child: Image(
                            height: 80.0,
                            image: NetworkImage(
                                _favoritesProvider.favorites[i].imageUrl),
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
                                _favoritesProvider.favorites[i].name,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              Text(_favoritesProvider.favorites[i].description,
                                  maxLines: 2, overflow: TextOverflow.ellipsis),
                            ],
                          ),
                        )),
                        Container(
                          child: IconButton(
                            color: Colors.red,
                            icon: Icon(Icons.favorite),
                            onPressed: () {
                              _favoritesProvider
                                  .removeFav(_favoritesProvider.favorites[i]);
                            },
                          ),
                        )
                      ])))))
        ],
      ),
    );
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
