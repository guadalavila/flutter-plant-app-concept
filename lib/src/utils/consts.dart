import 'package:flutter/material.dart';

const kPrimaryColor = Color(0xFF0A9929);
const kPrimaryColorLight = Color(0xFF5DB871);
const kPrimaryColorDark = Color(0xFF4E895B);

const kTextColor = Color(0xFF3C4046);
const kIconColor = Color(0xFF6A6D71);
const kGreyColor = Color(0xFFA1A1A1);
const kBackgroundColor = Color(0xFFEEEEEE);
const kBackgroundColorDark = Color(0xFF3C4046);

const kOnBoardingColor = Color(0xFFF5F9EF);

const String baseURL = "https://app-plant-demo.herokuapp.com/api";

const APIS = <String, String>{
  "tip": '$baseURL/tip',
  "plants": "$baseURL/plants",
};

const double kDefaultPadding = 15.0;

const KEY_DARK_THEME = "darkTheme";

const DEFAULT_LENGTH = 4;
