import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_plant_app/src/pages/cart/cart_page.dart';
import 'package:flutter_plant_app/src/providers/catalog_provider.dart';
import 'package:flutter_plant_app/src/utils/consts.dart';

class SearchBar extends StatefulWidget {
  @override
  _SearchBarState createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar> {
  String _keySearch = "";
  @override
  Widget build(BuildContext context) {
    final _catalogProvider = Provider.of<CatalogProvider>(context);

    final _size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Expanded(
            child: Container(
              margin: EdgeInsets.only(right: 30.0, left: 10.0),
              padding: EdgeInsets.only(left: 10.0),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(14.0)),
              child: _createInputSearch(),
            ),
          ),
          _createButtons(_size, _catalogProvider.catalog.length),
        ],
      ),
    );
  }

  Widget _createButtons(_size, catalogSize) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Stack(
            alignment: Alignment.topRight,
            children: [
              IconButton(
                  icon: Icon(Icons.shopping_cart_outlined),
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => CartPage()));
                  }),
              CircleAvatar(
                radius: 10,
                child: Text(catalogSize.toString()),
              )
            ],
          ),
          IconButton(
              icon: Icon(Icons.notifications_none_rounded),
              onPressed: () {
                Navigator.pushNamed(context, "notifications");
              }),
        ],
      ),
    );
  }

  Widget _createInputSearch() {
    return TextField(
      keyboardType: TextInputType.text,
      decoration: InputDecoration(
          icon: Icon(Icons.search),
          labelStyle: TextStyle(fontSize: 12, color: kGreyColor),
          // labelText: "Buscar...",
          border: InputBorder.none),
      onChanged: (value) {
        setState(() {
          _keySearch = value;
        });
      },
    );
  }
}
