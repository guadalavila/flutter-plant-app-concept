import 'package:flutter/material.dart';
import 'package:flutter_plant_app/src/providers/favorites_provider.dart';
import 'package:flutter_plant_app/src/utils/theme_styles.dart';
import 'package:provider/provider.dart';
import 'package:flutter_plant_app/src/providers/theme_provider.dart';
import 'package:flutter_plant_app/src/providers/catalog_provider.dart';
import 'package:flutter_plant_app/src/providers/provider.dart';
import 'package:flutter_plant_app/src/pages/main_app.dart';
import 'package:flutter_plant_app/src/pages/notifications/notifications_page.dart';
import 'package:flutter_plant_app/src/pages/onboarding/onboarding_page.dart';

void main() => runApp(MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => MyProvider()),
        ChangeNotifierProvider(create: (_) => CatalogProvider()),
        ChangeNotifierProvider(create: (_) => ThemeProvider()),
        ChangeNotifierProvider(create: (_) => FavoritesProvider()),
      ],
      child: MyApp(),
    ));

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _theme = Provider.of<ThemeProvider>(context);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeStyles.themeData(_theme.darkTheme, context),
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
