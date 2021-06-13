import 'package:flutter/material.dart';

const kPrimaryColor = Color(0xFF0A9929);
const kTextColor = Color(0xFF3C4046);
const kIconColor = Color(0xFF6A6D71);
const kGreyColor = Color(0xFFA1A1A1);
const kBackgroundColor = Color(0xFFEEEEEE);

const String baseURL = "https://app-plant-demo.herokuapp.com/api";

const APIS = <String, String>{
  "tip": '$baseURL/tip',
  "plants": "$baseURL/plants",
};

const double kDefaultPadding = 20.0;
