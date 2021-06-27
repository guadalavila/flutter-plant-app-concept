import 'package:flutter/material.dart';
import 'package:flutter_plant_app/src/utils/consts.dart';

class SliverApp extends StatelessWidget {
  const SliverApp({Key? key, required this.title, required this.backButton})
      : super(key: key);

  final String title;

  final bool backButton;

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      backgroundColor: kBackgroundColor,
      expandedHeight: 140.0,
      elevation: 1,
      automaticallyImplyLeading: backButton ? true : false,
      // actions: [],
      floating: true,
      pinned: true,
      snap: true,
      flexibleSpace: FlexibleSpaceBar(
          centerTitle: true,
          title: Text(title,
              textAlign: TextAlign.start,
              style: TextStyle(
                  fontSize: 22.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.black)),
          background:
              Container(decoration: BoxDecoration(color: Colors.transparent))),
    );
  }
}
