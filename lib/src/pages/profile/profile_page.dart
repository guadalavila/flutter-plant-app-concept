import 'package:flutter/material.dart';
import 'package:flutter_plant_app/src/providers/theme_provider.dart';
import 'package:provider/provider.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _themeProvider = Provider.of<ThemeProvider>(context);
    return Scaffold(
      body: SafeArea(
          child: Column(
        children: [
          SwitchListTile(
            title: Text("Dark Mode"),
            onChanged: (value) {
              _themeProvider.onChange();
            },
            value: _themeProvider.darkTheme,
          )
          // Container(
          //   height: MediaQuery.of(context).size.height * 0.3,
          //   width: MediaQuery.of(context).size.width * 1,
          //   child: Stack(alignment: Alignment.center, children: [
          //     Image(
          //       image: NetworkImage(
          //           "https://hips.hearstapps.com/ghk.h-cdn.co/assets/15/33/1439490128-plants.jpg"),
          //     ),
          //     Center(
          //       child: CircleAvatar(
          //         backgroundColor: Colors.grey[200],
          //         radius: 60,
          //         child: Text(
          //           "GA",
          //           style: TextStyle(
          //               fontWeight: FontWeight.bold,
          //               fontSize: 40.0,
          //               color: kPrimaryColor),
          //         ),
          //       ),
          //     ),
          //   ]),
          //   // child: CircleAvatar(
          //   //   backgroundImage: NetworkImage(
          //   //     "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQDH94qP1Hth7yBoc5ldevLA2vRpXw4326z_JcwN1NeWJInqKyixRxPUs0EfXlB_DjTbf8&usqp=CAU",
          //   //   ),
          //   // )
          // ),
          // Expanded(
          //     child: Container(
          //   child: Column(
          //     children: [
          //       ListTile(
          //         trailing: Icon(Icons.keyboard_arrow_right_sharp),
          //         title: Text("Datos Personales",
          //             style: TextStyle(
          //                 fontWeight: FontWeight.w500,
          //                 color: Colors.grey[500])),
          //         onTap: () {},
          //       ),
          //       Divider(),
          //       ListTile(
          //         trailing: Icon(Icons.keyboard_arrow_right_sharp),
          //         title: Text("Notificaciones",
          //             style: TextStyle(
          //                 fontWeight: FontWeight.w500,
          //                 color: Colors.grey[500])),
          //         onTap: () {},
          //       ),
          //       Divider(),
          //       ListTile(
          //         title: Text("Cerrar Sesión",
          //             style: TextStyle(
          //                 fontWeight: FontWeight.w500,
          //                 color: Colors.grey[500])),
          //         onTap: () {},
          //       ),
          //       Divider(),
          //     ],
          //   ),
          // ))
        ],
      )),
    );
  }
}
