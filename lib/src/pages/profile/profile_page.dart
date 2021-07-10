// import 'package:flutter/material.dart';
// import 'package:flutter_plant_app/src/providers/theme_provider.dart';
// import 'package:provider/provider.dart';

// class ProfilePage extends StatelessWidget {
//   const ProfilePage({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     final _themeProvider = Provider.of<ThemeProvider>(context);
//     return Scaffold(
//       body: SafeArea(
//           child: Column(
//         children: [
//           SwitchListTile(
//             title: Text("Dark Mode"),
//             onChanged: (value) {
//               _themeProvider.onChange();
//             },
//             value: _themeProvider.darkTheme,
//           )
//           // Container(
//           //   height: MediaQuery.of(context).size.height * 0.3,
//           //   width: MediaQuery.of(context).size.width * 1,
//           //   child: Stack(alignment: Alignment.center, children: [
//           //     Image(
//           //       image: NetworkImage(
//           //           "https://hips.hearstapps.com/ghk.h-cdn.co/assets/15/33/1439490128-plants.jpg"),
//           //     ),
//           //     Center(
//           //       child: CircleAvatar(
//           //         backgroundColor: Colors.grey[200],
//           //         radius: 60,
//           //         child: Text(
//           //           "GA",
//           //           style: TextStyle(
//           //               fontWeight: FontWeight.bold,
//           //               fontSize: 40.0,
//           //               color: kPrimaryColor),
//           //         ),
//           //       ),
//           //     ),
//           //   ]),
//           //   // child: CircleAvatar(
//           //   //   backgroundImage: NetworkImage(
//           //   //     "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQDH94qP1Hth7yBoc5ldevLA2vRpXw4326z_JcwN1NeWJInqKyixRxPUs0EfXlB_DjTbf8&usqp=CAU",
//           //   //   ),
//           //   // )
//           // ),
//           // Expanded(
//           //     child: Container(
//           //   child: Column(
//           //     children: [
//           //       ListTile(
//           //         trailing: Icon(Icons.keyboard_arrow_right_sharp),
//           //         title: Text("Datos Personales",
//           //             style: TextStyle(
//           //                 fontWeight: FontWeight.w500,
//           //                 color: Colors.grey[500])),
//           //         onTap: () {},
//           //       ),
//           //       Divider(),
//           //       ListTile(
//           //         trailing: Icon(Icons.keyboard_arrow_right_sharp),
//           //         title: Text("Notificaciones",
//           //             style: TextStyle(
//           //                 fontWeight: FontWeight.w500,
//           //                 color: Colors.grey[500])),
//           //         onTap: () {},
//           //       ),
//           //       Divider(),
//           //       ListTile(
//           //         title: Text("Cerrar Sesión",
//           //             style: TextStyle(
//           //                 fontWeight: FontWeight.w500,
//           //                 color: Colors.grey[500])),
//           //         onTap: () {},
//           //       ),
//           //       Divider(),
//           //     ],
//           //   ),
//           // ))
//         ],
//       )),
//     );
//   }
// }
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_plant_app/src/pages/login/login_page.dart';
import 'package:flutter_plant_app/src/utils/fire_auth.dart';

class ProfilePage extends StatefulWidget {
  final User user;

  const ProfilePage({required this.user});

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  bool _isSendingVerification = false;
  bool _isSigningOut = false;

  late User _currentUser;

  @override
  void initState() {
    _currentUser = widget.user;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'NAME: ${_currentUser.displayName}',
              style: Theme.of(context).textTheme.bodyText1,
            ),
            SizedBox(height: 16.0),
            Text(
              'EMAIL: ${_currentUser.email}',
              style: Theme.of(context).textTheme.bodyText1,
            ),
            SizedBox(height: 16.0),
            _currentUser.emailVerified
                ? Text(
                    'Email verified',
                    style: Theme.of(context)
                        .textTheme
                        .bodyText1!
                        .copyWith(color: Colors.green),
                  )
                : Text(
                    'Email not verified',
                    style: Theme.of(context)
                        .textTheme
                        .bodyText1!
                        .copyWith(color: Colors.red),
                  ),
            SizedBox(height: 16.0),
            _isSendingVerification
                ? CircularProgressIndicator()
                : Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      ElevatedButton(
                        onPressed: () async {
                          setState(() {
                            _isSendingVerification = true;
                          });
                          await _currentUser.sendEmailVerification();
                          setState(() {
                            _isSendingVerification = false;
                          });
                        },
                        child: Text('Verify email'),
                      ),
                      SizedBox(width: 8.0),
                      IconButton(
                        icon: Icon(Icons.refresh),
                        onPressed: () async {
                          User? user = await FireAuth.refreshUser(_currentUser);

                          if (user != null) {
                            setState(() {
                              _currentUser = user;
                            });
                          }
                        },
                      ),
                    ],
                  ),
            SizedBox(height: 16.0),
            _isSigningOut
                ? CircularProgressIndicator()
                : ElevatedButton(
                    onPressed: () async {
                      setState(() {
                        _isSigningOut = true;
                      });
                      await FirebaseAuth.instance.signOut();
                      setState(() {
                        _isSigningOut = false;
                      });
                      Navigator.of(context).pushReplacement(
                        MaterialPageRoute(
                          builder: (context) => LoginPage(),
                        ),
                      );
                    },
                    child: Text('Sign out'),
                    style: ElevatedButton.styleFrom(
                      primary: Colors.red,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                  ),
          ],
        ),
      ),
    );
  }
}
