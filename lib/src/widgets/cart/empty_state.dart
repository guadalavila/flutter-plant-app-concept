import 'package:flutter/material.dart';
import 'package:flutter_plant_app/src/utils/consts.dart';
import 'package:flutter_plant_app/src/widgets/common/button_primary.dart';

class EmptyState extends StatelessWidget {
  const EmptyState({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Image(
          image: AssetImage("assets/images/empty_cart.png"),
          height: 250.0,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 14.0, vertical: 10.0),
          child: Text(
            "No tenes productos en tu carrito, volvé al store y agregá tus productos.",
            style: TextStyle(
                color: Colors.grey,
                fontWeight: FontWeight.w500,
                fontSize: 18.0),
            textAlign: TextAlign.center,
          ),
        ),
        ButtonPrimary(
            text: "Volver al Store",
            onPressed: () {
              Navigator.pop(context);
            })
      ],
    );
  }
}
