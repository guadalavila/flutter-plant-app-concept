import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_plant_app/src/providers/catalog_provider.dart';
import 'package:flutter_plant_app/src/providers/provider.dart';
import 'package:flutter_plant_app/src/pages/main_app.dart';
import 'package:flutter_plant_app/src/pages/notifications/notifications_page.dart';
import 'package:flutter_plant_app/src/pages/onboarding/onboarding_page.dart';
import 'package:flutter_plant_app/src/utils/consts.dart';

void main() => runApp(MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => MyProvider()),
        ChangeNotifierProvider(create: (_) => CatalogProvider())
      ],
      child: MyApp(),
    ));

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          appBarTheme: AppBarTheme(iconTheme: IconThemeData(color: kIconColor)),
          primaryColor: kPrimaryColor,
          iconTheme: Theme.of(context).iconTheme.copyWith(color: kIconColor),
          textTheme: Theme.of(context).textTheme.apply(bodyColor: kTextColor),
          visualDensity: VisualDensity.adaptivePlatformDensity,
          scaffoldBackgroundColor: kBackgroundColor),
      title: 'Plant App',
      initialRoute: "onboarding",
      routes: {
        "mainApp": (context) => MainApp(),
        "onboarding": (context) => OnBoardingPage(),
        "notifications": (context) => NotificationsPage()
      },
    );
  }
}
