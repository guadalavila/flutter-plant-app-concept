import 'package:flutter/material.dart';
import 'package:flutter_plant_app/src/models/plant.dart';
import 'package:flutter_plant_app/src/utils/consts.dart';
import 'package:flutter_plant_app/src/widgets/common/button_primary.dart';

class DetailPage extends StatelessWidget {
  const DetailPage({Key? key, required this.plant}) : super(key: key);

  final Plant plant;

  @override
  Widget build(BuildContext context) {
    final _size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            _createHeader(context),
            Container(
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
                child: _createDetail(),
              ),
            ),
            ButtonPrimary(
              text: plant.stock ? "Agregar" : "Sin Stock",
              onPressed: () {},
              enabled: plant.stock,
            ),
            SizedBox(height: kDefaultPadding)
          ],
        ),
      ),
    );
  }

  Widget _createHeader(context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
              icon: Icon(Icons.arrow_back),
              color: Colors.black,
              iconSize: 25.0,
              onPressed: () {
                Navigator.of(context).pop();
              }),
          IconButton(
              icon: Icon(Icons.more_vert),
              color: Colors.black,
              iconSize: 30.0,
              onPressed: () {}),
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

  Widget _createDetail() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 30.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _headerPlant(),
          _pricePlant(),
          _descriptionPlant(),
          _footer()
        ],
      ),
    );
  }

  Widget _headerPlant() {
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
              Icons.favorite,
              color: Colors.red,
            ),
            color: Colors.black,
            iconSize: 25.0,
            onPressed: () {}),
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

  Widget _footer() {
    return Container();
  }
}
