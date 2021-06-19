import 'package:flutter/material.dart';
import 'package:flutter_plant_app/src/utils/consts.dart';
import 'package:flutter_plant_app/src/widgets/common/button_primary.dart';

class OnBoardingPage extends StatelessWidget {
  const OnBoardingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: SafeArea(
        child: Container(
          child: Column(
            children: [
              SizedBox(height: kToolbarHeight),
              Center(
                  child: Text(
                "PlantApp",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 30.0,
                    color: kPrimaryColorDark),
              )),
              Expanded(
                child: Image(
                  image: AssetImage("assets/images/onboard.png"),
                ),
              ),
              ButtonPrimary(
                  text: "Empezar",
                  onPressed: () {
                    Navigator.pushNamed(context, "mainApp");
                  }),
              SizedBox(height: kToolbarHeight),
            ],
          ),
        ),
      ),
    );
  }
}
