import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_plant_app/src/models/Tip.dart';
import 'package:flutter_plant_app/src/repository/tip_Repository.dart';
import 'package:flutter_plant_app/src/services/ApiHelper.dart';
import 'package:flutter_plant_app/src/widgets/common/loading.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:carousel_slider/carousel_slider.dart';

class TipPlant extends StatefulWidget {
  const TipPlant({Key? key}) : super(key: key);

  @override
  _TipPlantState createState() => _TipPlantState();
}

class _TipPlantState extends State<TipPlant> {
  TipRepository _tipRepository = TipRepository();
  ApiHelper _apiHelper = ApiHelper();

  Future<List<Tip>> getData() async {
    var response = await _tipRepository.fetchTips();
    if (response.statusCode == 200) {
      List jsonResponse = json.decode(response.body) as List;
      return jsonResponse.map((tip) => Tip.fromJson(tip)).toList();
    } else {
      return _apiHelper.returnResponse(response);
    }
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Tip>>(
      future: getData(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return Container(
            child: CarouselSlider(
                options: CarouselOptions(
                    enlargeCenterPage: true,
                    autoPlay: false,
                    aspectRatio: 2,
                    autoPlayCurve: Curves.fastOutSlowIn,
                    enableInfiniteScroll: true,
                    viewportFraction: 0.8),
                items: _generateList(snapshot.data!)),
          );
        } else if (snapshot.hasError) {
          return Container(
            child: Text("${snapshot.error}"),
          );
        }
        return Loading();
      },
    );
  }

  List<Widget> _generateList(List<Tip> tips) {
    List<Widget> list = [];
    tips.forEach((tip) {
      list.add(ItemTip(tip: tip));
    });
    return list;
  }
}

class ItemTip extends StatelessWidget {
  const ItemTip({Key? key, required this.tip}) : super(key: key);

  final Tip tip;

  @override
  Widget build(BuildContext context) {
    return Container(
        width: MediaQuery.of(context).size.width * 1,
        padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 12),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20.0),
            color: HexColor(tip.hexColor).withOpacity(0.6)),
        child: Stack(
          alignment: Alignment.topRight,
          children: [
            Positioned(
              left: 0,
              right: 80.0,
              child: Container(
                child: Column(
                  children: [
                    Text("Tip del día",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 18.0)),
                    SizedBox(height: 20.0),
                    Text(
                      tip.tip,
                      style: TextStyle(color: Colors.grey[600]),
                      maxLines: 8,
                      overflow: TextOverflow.ellipsis,
                    )
                  ],
                ),
              ),
            ),
            Positioned(
              child: Image(
                image: AssetImage("assets/images/leaf.png"),
                width: 80.0,
              ),
            )
          ],
        ));
  }
}
