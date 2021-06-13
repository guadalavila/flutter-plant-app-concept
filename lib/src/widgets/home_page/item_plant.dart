import 'package:flutter/material.dart';
import 'package:flutter_plant_app/src/models/plant.dart';
import 'package:flutter_plant_app/src/utils/consts.dart';

class ItemPlant extends StatelessWidget {
  const ItemPlant({Key? key, required this.plant}) : super(key: key);
  final Plant plant;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 20.0),
      child: Stack(
        alignment: Alignment.topCenter,
        children: [
          Container(
            margin: EdgeInsets.only(top: 100.0),
            padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(26.0), color: Colors.white),
            height: 180.0,
            width: 200.0,
            child: Column(
              children: [
                SizedBox(height: 30.0),
                Text(plant.name,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(fontWeight: FontWeight.bold)),
                SizedBox(height: 15.0),
                Expanded(
                    child: Text(
                  plant.description,
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                )),
                SizedBox(height: 15.0),
                Text("\$ ${plant.price.toString()}",
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: kPrimaryColor)),
                SizedBox(height: 10.0)
              ],
            ),
          ),
          Container(
            height: 130.0,
            child: FadeInImage(
              fit: BoxFit.cover,
              placeholder: AssetImage("assets/gif/progression.gif"),
              image: NetworkImage(plant.imageUrl),
            ),
          ),
        ],
      ),
    );
  }
}
