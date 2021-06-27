import 'package:flutter/material.dart';
import 'package:flutter_plant_app/src/providers/catalog_provider.dart';
import 'package:flutter_plant_app/src/utils/consts.dart';
import 'package:flutter_plant_app/src/widgets/common/button_primary.dart';
import 'package:flutter_plant_app/src/widgets/common/item_plant_default.dart';
import 'package:provider/provider.dart';

class ListProducts extends StatelessWidget {
  const ListProducts({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _catalogProvider = Provider.of<CatalogProvider>(context);
    final _size = MediaQuery.of(context).size;
    return Stack(
      children: [
        Positioned(
          bottom: _size.height * 0.25,
          top: 0,
          left: 0,
          right: 0,
          child: ListView(
              children: List.generate(
            _catalogProvider.catalog.length,
            (i) => ItemPlantDefault(plant: _catalogProvider.catalog[i]),
          )),
        ),
        Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              height: _size.height * 0.25,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20.0),
                      topRight: Radius.circular(20.0)),
                  color: Colors.white),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 16.0, vertical: 14.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Row(
                      children: [
                        Text(
                          "SubTotal",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 14.0,
                              color: Colors.grey),
                        ),
                        Spacer(),
                        Text(
                          "\$${_catalogProvider.getTotal().toString()}.00",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 14.0,
                              color: Colors.grey),
                        )
                      ],
                    ),
                    Divider(height: 1, thickness: 1, indent: 0, endIndent: 0),
                    Row(
                      children: [
                        Text(
                          "Total",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20.0,
                              color: Colors.grey),
                        ),
                        Spacer(),
                        Text(
                          "\$${_catalogProvider.getTotal().toString()}.00",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 22.0,
                              color: kPrimaryColor),
                        )
                      ],
                    ),
                    ButtonPrimary(
                      text: "Terminar",
                      onPressed: () {},
                    ),
                  ],
                ),
              ),
            )),
      ],
    );
  }
}
