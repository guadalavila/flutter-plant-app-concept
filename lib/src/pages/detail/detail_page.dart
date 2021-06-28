import 'package:flutter/material.dart';
import 'package:flutter_plant_app/src/models/plant.dart';
import 'package:flutter_plant_app/src/providers/catalog_provider.dart';
import 'package:flutter_plant_app/src/providers/favorites_provider.dart';
import 'package:flutter_plant_app/src/utils/consts.dart';
import 'package:flutter_plant_app/src/widgets/common/button_primary.dart';
import 'package:provider/provider.dart';

class DetailPage extends StatelessWidget {
  const DetailPage({Key? key, required this.plant}) : super(key: key);

  final Plant plant;

  @override
  Widget build(BuildContext context) {
    final _catalogProvider = Provider.of<CatalogProvider>(context);
    final _size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: kBackgroundColor,
        actions: [
          IconButton(icon: Icon(Icons.more_vert), onPressed: () {}),
        ],
      ),
      body: Column(
        children: [
          Container(
            color: kBackgroundColor,
            height: _size.height * 0.4,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      child: Column(
                        children: [
                          Text(
                            "Categoria",
                            style: TextStyle(
                                color: Colors.grey,
                                fontWeight: FontWeight.w500),
                          ),
                          Text(
                            plant.houseplant ? "Indoor" : "Outdoor",
                            style: TextStyle(
                                fontSize: 16.0,
                                color: kPrimaryColorDark,
                                fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                    ),
                    Container(
                      child: Column(
                        children: [
                          Text(
                            "Tamaño",
                            style: TextStyle(
                                color: Colors.grey,
                                fontWeight: FontWeight.w500),
                          ),
                          Text(
                            "Chico",
                            style: TextStyle(
                                fontSize: 16.0,
                                color: kPrimaryColorDark,
                                fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                    )
                  ],
                ),
                _imagePlant(context)
              ],
            ),
          ),
          Expanded(
            child: Container(
              width: MediaQuery.of(context).size.width * 1,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(25.0),
                      topLeft: Radius.circular(25.0))),
              child: _createDetail(context),
            ),
          ),
          Container(
            color: Colors.white,
            child: ButtonPrimary(
              text: plant.stock ? "Agregar" : "Sin Stock",
              onPressed: () {
                final snackBar = SnackBar(
                  backgroundColor: kPrimaryColor,
                  duration: Duration(seconds: 1),
                  content: Container(
                    height: 60.0,
                    child: Text("Producto Agregado!",
                        style: TextStyle(fontSize: 16.0)),
                  ),
                );
                ScaffoldMessenger.of(context).showSnackBar(snackBar);
                _catalogProvider.addToCatalog(plant);
              },
              enabled: plant.stock,
            ),
          ),
          Container(
            color: Colors.white,
            height: kDefaultPadding * 2,
          )
        ],
      ),
    );
  }

  Widget _imagePlant(context) {
    return Hero(
      tag: plant.code,
      child: Image(
        width: MediaQuery.of(context).size.width * 0.45,
        image: NetworkImage(plant.imageUrl),
        fit: BoxFit.contain,
      ),
    );
  }

  Widget _createDetail(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 30.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _headerPlant(context),
          _pricePlant(),
          _descriptionPlant(),
        ],
      ),
    );
  }

  Widget _headerPlant(BuildContext context) {
    final _favoritesProvider = Provider.of<FavoritesProvider>(context);
    return Row(
      children: [
        Expanded(
          child: Text(
            plant.name,
            overflow: TextOverflow.ellipsis,
            maxLines: 1,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
          ),
        ),
        IconButton(
            icon: Icon(
              _favoritesProvider.isFav(plant)
                  ? Icons.favorite
                  : Icons.favorite_outline_rounded,
              color: Colors.red,
            ),
            color: Colors.black,
            iconSize: 25.0,
            onPressed: () {
              _favoritesProvider.isFav(plant)
                  ? _favoritesProvider.removeFav(plant)
                  : _favoritesProvider.addToFav(plant);
            }),
      ],
    );
  }

  Widget _pricePlant() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: Text(
        "\$ ${plant.price.toString()}",
        style: TextStyle(
            color: kPrimaryColorLight,
            fontSize: 20.0,
            fontWeight: FontWeight.bold),
      ),
    );
  }

  Widget _descriptionPlant() {
    return Expanded(
        child: Text(
      plant.description,
      overflow: TextOverflow.fade,
      style: TextStyle(color: Colors.grey[700]),
    ));
  }
}
