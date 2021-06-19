import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_plant_app/src/models/Tip.dart';
import 'package:flutter_plant_app/src/utils/funtions.dart';
import 'package:flutter_plant_app/src/widgets/common/loading.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:http/http.dart' as http;
import 'package:carousel_slider/carousel_slider.dart';

class TipPlant extends StatefulWidget {
  const TipPlant({Key? key}) : super(key: key);

  @override
  _TipPlantState createState() => _TipPlantState();
}

class _TipPlantState extends State<TipPlant> {
  late List<Tip> tips = [];

  fetchTips() async {
    final response = await http.get(Uri.parse(getPathApi("tip")));
    if (response.statusCode == 200) {
      List<Tip> listTips = (json.decode(response.body) as List)
          .map((i) => Tip.fromJson(i))
          .toList();
      setState(() {
        tips = listTips;
      });
    } else {
      throw Exception('Failed to load tip');
    }
  }

  @override
  void initState() {
    fetchTips();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return tips.length != 0
        ? Container(
            child: CarouselSlider(
              options: CarouselOptions(
                  enlargeCenterPage: true,
                  autoPlay: false,
                  aspectRatio: 2,
                  autoPlayCurve: Curves.fastOutSlowIn,
                  enableInfiniteScroll: true,
                  viewportFraction: 0.8),
              items: _generateList(),
            ),
          )
        : Loading();
  }

  List<Widget> _generateList() {
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
