// import 'package:flutter/material.dart';
// import 'package:flutter_plant_app/src/utils/consts.dart';

// enum SnackbarType { sucess, error, warning }

// class Snackbar extends StatelessWidget {
//   const Snackbar({Key? key, required this.text, required this.type})
//       : super(key: key);
//   final String text;
//   final SnackbarType type;

//   @override
//   Widget build(BuildContext context) {
//     Color _getBackgroundColor(SnackbarType type) {
//       switch (type) {
//         case SnackbarType.sucess:
//           return kPrimaryColor.withOpacity(0.6);
//         case SnackbarType.error:
//           return Colors.red.withOpacity(0.6);
//         case SnackbarType.warning:
//           return Colors.yellow.withOpacity(0.6);
//         default:
//           return Colors.white;
//       }
//     }

//     SnackBar(
//       margin: EdgeInsets.only(bottom: 20.0),
//       backgroundColor: _getBackgroundColor(type),
//       duration: Duration(seconds: 1),
//       behavior: SnackBarBehavior.floating,
//       content: Container(
//         padding: EdgeInsets.all(15.0),
//         child: Text(text, style: TextStyle(fontSize: 16.0)),
//       ),
//     );
//   }
// }
