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
  List<Plant> plants = [];

  @override
  void initState() {
    fetchData();
    super.initState();
  }

  fetchData() async {
    final response = await http.get(Uri.parse(getPathApi('plants')));
    if (response.statusCode == 200) {
      List<Plant> list = [];
      jsonDecode(response.body).forEach((element) {
        list.add(Plant.fromJson(element));
      });
      setState(() {
        plants = list;
      });
    } else {
      throw Exception('Failed to load tip');
    }
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: List.generate(
            plants.length, (index) => ItemPlant(plant: plants[index])),
      ),
    );
  }
}
