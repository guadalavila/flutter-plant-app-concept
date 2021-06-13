import 'package:flutter/material.dart';
import 'package:flutter_plant_app/src/models/category.dart';
import 'package:hexcolor/hexcolor.dart';

class Categories extends StatelessWidget {
  final List<Category> categories = Category.listCategories;
  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.symmetric(vertical: 15.0),
        child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: List.generate(categories.length,
                (int index) => _createCategory(categories[index]))));
  }

  Widget _createCategory(Category category) {
    return Container(
        child: Column(
      children: [
        Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(18.0),
                color: HexColor(category.color).withOpacity(0.3)),
            width: 70.0,
            height: 70.0,
            padding: EdgeInsets.all(10.0),
            child: Image(image: AssetImage(category.image))),
        Container(
          width: 70.0,
          margin: EdgeInsets.only(top: 20.0),
          child: Center(
            child: Text(category.name,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 12.0,
                    color: Colors.grey[500])),
          ),
        )
      ],
    ));
  }
}
