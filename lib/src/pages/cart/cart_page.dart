import 'package:flutter/material.dart';
import 'package:flutter_plant_app/src/providers/catalog_provider.dart';
import 'package:flutter_plant_app/src/utils/consts.dart';
import 'package:flutter_plant_app/src/widgets/cart/empty_state.dart';
import 'package:flutter_plant_app/src/widgets/cart/list_products.dart';
import 'package:provider/provider.dart';

class CartPage extends StatelessWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _catalogProvider = Provider.of<CatalogProvider>(context);

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: kBackgroundColor,
      ),
      body:
          _catalogProvider.catalog.length != 0 ? ListProducts() : EmptyState(),
    );
  }
}
