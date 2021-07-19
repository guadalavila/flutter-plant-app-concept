import 'package:flutter/material.dart';
import 'package:flutter_plant_app/src/utils/consts.dart';

class EmptyFavs extends StatelessWidget {
  const EmptyFavs({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _size = MediaQuery.of(context).size;
    return Column(
      children: [
        SizedBox(height: kToolbarHeight * 2),
        Center(
            child: Image(
                image: AssetImage("assets/images/empty_fav.png"),
                height: _size.height * 0.4)),
        SizedBox(height: 40.0),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0),
          child: Text(
            "Todavía no agregaste ningún producto como Favorito.",
            textAlign: TextAlign.center,
            style: TextStyle(
                fontWeight: FontWeight.bold, fontSize: 20.0, color: kGreyColor),
          ),
        )
      ],
    );
  }
}
