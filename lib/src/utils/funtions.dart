import 'package:flutter/material.dart';
import 'package:flutter_plant_app/src/models/enum.dart';
import 'package:flutter_plant_app/src/utils/consts.dart';

enum PathAPI { tip, plant }

String getPathApi(String name) {
  return APIS[name].toString();
}

Color _getBackgroundColor(SnackbarType type) {
  switch (type) {
    case SnackbarType.sucess:
      return kPrimaryColor;
    case SnackbarType.error:
      return Colors.redAccent;
    case SnackbarType.info:
      return Colors.teal;
    default:
      return Colors.white;
  }
}

SnackBar getSnackBar(String text, SnackbarType type, {int time = 1}) {
  return SnackBar(
    margin: EdgeInsets.only(bottom: 20.0),
    backgroundColor: _getBackgroundColor(type),
    duration: Duration(seconds: time),
    behavior: SnackBarBehavior.floating,
    content: Container(
      padding: EdgeInsets.all(15.0),
      child: Text(text, style: TextStyle(fontSize: 16.0)),
    ),
  );
}

String getInitialsName(String name) {
  var value = name.split(" ");
  return value[0][0].toUpperCase() + value[1][0].toUpperCase();
}
