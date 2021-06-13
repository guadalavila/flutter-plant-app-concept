import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_plant_app/src/models/Tip.dart';
import 'package:flutter_plant_app/src/utils/funtions.dart';
import 'package:flutter_plant_app/src/widgets/common/loading.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:http/http.dart' as http;

class TipPlant extends StatefulWidget {
  const TipPlant({Key? key}) : super(key: key);

  @override
  _TipPlantState createState() => _TipPlantState();
}

class _TipPlantState extends State<TipPlant> {
  late Future<Tip> futureTip;

  Future<Tip> fetchTip() async {
    final response = await http.get(Uri.parse(getPathApi("tip")));
    if (response.statusCode == 200) {
      return Tip.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load tip');
    }
  }

  @override
  void initState() {
    futureTip = fetchTip();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: FutureBuilder<Tip>(
          future: futureTip,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return _createContainer(
                  snapshot.data!.tip, snapshot.data!.hexColor);
            } else {}
            return Loading();
          }),
    );
  }

  Widget _createContainer(String tip, String hexColor) {
    return Stack(
      alignment: Alignment.topRight,
      children: [
        Container(
          margin: EdgeInsets.all(16.0),
          padding: EdgeInsets.all(10.0),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20.0),
              color: HexColor(hexColor).withOpacity(0.6)),
          child: Row(
            children: [
              Container(
                width: MediaQuery.of(context).size.width * 0.6,
                child: Column(children: [
                  Text("Tip del día",
                      style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 18.0)),
                  SizedBox(height: 10.0),
                  Text(tip, style: TextStyle(color: Colors.grey))
                ]),
              ),
              SizedBox(width: MediaQuery.of(context).size.width * 0.2)
            ],
          ),
        ),
        Image(
          image: AssetImage("assets/images/leaf.png"),
          width: 100.0,
        )
      ],
    );
  }
}
