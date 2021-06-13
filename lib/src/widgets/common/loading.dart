import 'package:flutter/material.dart';
import 'package:flutter_plant_app/src/utils/consts.dart';

class Loading extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CircularProgressIndicator(
      valueColor: AlwaysStoppedAnimation<Color>(kPrimaryColor),
      backgroundColor: kPrimaryColor.withOpacity(0.5),
    );
  }
}
