import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_plant_app/src/models/plant.dart';
import 'package:flutter_plant_app/src/repository/plant_repository.dart';
import 'package:flutter_plant_app/src/services/ApiHelper.dart';
import 'package:flutter_plant_app/src/widgets/common/loading.dart';
import 'package:flutter_plant_app/src/widgets/home_page/item_plant.dart';

class ListPlant extends StatefulWidget {
  const ListPlant({Key? key}) : super(key: key);

  @override
  _ListPlantState createState() => _ListPlantState();
}

class _ListPlantState extends State<ListPlant> {
  PlantRepository _plantRepository = new PlantRepository();
  ApiHelper _apiHelper = ApiHelper();

  Future<List<List<Plant>>> _getPlants() async {
    var response = await _plantRepository.fetchPlants();
    if (response.statusCode == 200) {
      List jsonResponse = json.decode(response.body)['indoor'];
      List jsonResponseOut = json.decode(response.body)['outdoor'];
      return [
        jsonResponse.map((p) => Plant.fromJson(p)).toList(),
        jsonResponseOut.map((p) => Plant.fromJson(p)).toList()
      ];
    } else {
      return _apiHelper.returnResponse(response);
    }
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<List<Plant>>>(
      future: _getPlants(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return Column(children: [
            _createListPlant("Indoor", snapshot.data![0]),
            _createListPlant("Outdoor", snapshot.data![1])
          ]);
        } else if (snapshot.hasError) {}
        return Loading();
      },
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
