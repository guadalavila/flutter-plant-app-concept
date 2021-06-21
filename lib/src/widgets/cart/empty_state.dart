import 'package:flutter/material.dart';
import 'package:flutter_plant_app/src/widgets/common/button_primary.dart';

class EmptyState extends StatelessWidget {
  const EmptyState({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image(image: AssetImage("assets/images/cart.png")),
        SizedBox(height: 40.0),
        Center(
          child: Text("Carrito vacío..",
              style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.w600)),
        ),
        SizedBox(height: 40.0),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 14.0, vertical: 10.0),
          child: Text(
            "No tenes productos en tu carrito, volvé al store y agregá tus productos.",
            style: TextStyle(color: Colors.grey, fontWeight: FontWeight.w500),
            textAlign: TextAlign.center,
          ),
        ),
        SizedBox(height: 40.0),
        ButtonPrimary(
            text: "Volver al Store",
            onPressed: () {
              Navigator.pop(context);
            })
      ],
    );
  }
}
