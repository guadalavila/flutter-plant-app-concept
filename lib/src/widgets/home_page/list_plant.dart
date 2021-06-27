import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_plant_app/src/models/plant.dart';
import 'package:flutter_plant_app/src/utils/funtions.dart';
import 'package:flutter_plant_app/src/widgets/home_page/item_plant.dart';
import 'package:http/http.dart' as http;

class ListPlant extends StatefulWidget {
  const ListPlant({Key? key}) : super(key: key);

  @override
  _ListPlantState createState() => _ListPlantState();
}

class _ListPlantState extends State<ListPlant> {
  List<Plant> plantsIndoor = [];
  List<Plant> plantsOutdoor = [];

  @override
  void initState() {
    fetchData();
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  fetchData() async {
    final response = await http.get(Uri.parse(getPathApi('plants')));
    if (response.statusCode == 200) {
      List<Plant> listIndoor = [];
      List<Plant> listOutdoor = [];

      jsonDecode(response.body)["indoor"].forEach((element) {
        listIndoor.add(Plant.fromJson(element));
      });
      jsonDecode(response.body)["outdoor"].forEach((element) {
        listOutdoor.add(Plant.fromJson(element));
      });
      setState(() {
        plantsIndoor = listIndoor;
        plantsOutdoor = listOutdoor;
      });
    } else {
      throw Exception('Failed to load plants');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        plantsIndoor.length > 0
            ? _createListPlant("Indoor", plantsIndoor)
            : Container(),
        plantsOutdoor.length > 0
            ? _createListPlant("Outdoor", plantsOutdoor)
            : Container()
      ],
    );
  }

  Widget _createListPlant(String text, List<Plant> list) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 14.0),
          child:
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Text(text,
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 24.0,
                    color: Colors.grey[600])),
            // GestureDetector(
            //     onTap: () {
            //       Navigator.push(
            //           context,
            //           MaterialPageRoute(
            //               builder: (context) => AllPlants(list: list)));
            //     },
            //     child: Text("Ver más", style: TextStyle(color: kPrimaryColor)))
          ]),
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: List.generate(
                list.length, (index) => ItemPlant(plant: list[index])),
          ),
        ),
        SizedBox(height: 30.0),
      ],
    );
  }
}
