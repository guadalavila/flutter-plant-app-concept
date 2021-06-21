import 'package:flutter/material.dart';
import 'package:flutter_plant_app/src/models/plant.dart';
import 'package:flutter_plant_app/src/utils/consts.dart';

class ItemPlantDefault extends StatelessWidget {
  const ItemPlantDefault({Key? key, required this.plant}) : super(key: key);

  final Plant plant;
  @override
  Widget build(BuildContext context) {
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
              height: 120.0,
              image: NetworkImage(plant.imageUrl),
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
                  plant.name,
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Text(plant.description,
                    maxLines: 2, overflow: TextOverflow.ellipsis),
                SizedBox(height: 10.0),
                Text("\$ ${plant.price.toString()}",
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: kPrimaryColorLight))
              ],
            ),
          )),
          Container(
            child: IconButton(
              icon: Icon(
                Icons.delete_sweep_outlined,
              ),
              onPressed: () {},
            ),
          )
        ]));
  }
}
