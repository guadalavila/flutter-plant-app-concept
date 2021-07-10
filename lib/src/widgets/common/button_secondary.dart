import 'package:flutter/material.dart';
import 'package:flutter_plant_app/src/utils/consts.dart';

class ButtonSecondary extends StatelessWidget {
  const ButtonSecondary(
      {Key? key,
      required this.text,
      required this.onPressed,
      this.enabled = true})
      : super(key: key);

  final String text;
  final VoidCallback onPressed;
  final bool enabled;

  @override
  Widget build(BuildContext context) {
    final ButtonStyle raisedButtonStyle = ElevatedButton.styleFrom(
      textStyle: TextStyle(fontWeight: FontWeight.w500, fontSize: 18.0),
      primary: Colors.grey[350],
      padding: EdgeInsets.symmetric(vertical: 15.0),
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(8.0))),
    );

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.0),
      width: MediaQuery.of(context).size.width * 1,
      child: ElevatedButton(
        style: raisedButtonStyle,
        onPressed: enabled ? onPressed : null,
        child: Text(
          text,
          style: TextStyle(color: kPrimaryColor),
        ),
      ),
    );
  }
}
