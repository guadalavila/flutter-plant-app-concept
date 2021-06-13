import 'package:flutter/material.dart';
import 'package:flutter_plant_app/src/pages/home_page/home_page.dart';
import 'package:flutter_plant_app/src/utils/consts.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          primaryColor: kPrimaryColor,
          textTheme: Theme.of(context).textTheme.apply(bodyColor: kTextColor),
          visualDensity: VisualDensity.adaptivePlatformDensity,
          scaffoldBackgroundColor: kBackgroundColor),
      title: 'Plant App',
      initialRoute: "/home",
      routes: {
        "/home": (context) => HomePage(),
      },
    );
  }
}
