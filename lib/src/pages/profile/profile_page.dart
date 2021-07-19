import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_plant_app/src/pages/login/login_page.dart';
import 'package:flutter_plant_app/src/providers/theme_provider.dart';
import 'package:flutter_plant_app/src/providers/user_provider.dart';
import 'package:flutter_plant_app/src/utils/consts.dart';
import 'package:flutter_plant_app/src/utils/funtions.dart';
import 'package:provider/provider.dart';

// class ProfilePage extends StatefulWidget {
//   // final User user;

//   // const ProfilePage({required this.user});

//   @override
//   _ProfilePageState createState() => _ProfilePageState();
// }

// class _ProfilePageState extends State<ProfilePage> {
//   bool _isSendingVerification = false;
//   bool _isSigningOut = false;

//   late User _currentUser;

//   @override
//   void initState() {
//     _currentUser = widget.user;
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Profile'),
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Text(
//               'NAME: ${_currentUser.displayName}',
//               style: Theme.of(context).textTheme.bodyText1,
//             ),
//             SizedBox(height: 16.0),
//             Text(
//               'EMAIL: ${_currentUser.email}',
//               style: Theme.of(context).textTheme.bodyText1,
//             ),
//             SizedBox(height: 16.0),
//             _currentUser.emailVerified
//                 ? Text(
//                     'Email verified',
//                     style: Theme.of(context)
//                         .textTheme
//                         .bodyText1!
//                         .copyWith(color: Colors.green),
//                   )
//                 : Text(
//                     'Email not verified',
//                     style: Theme.of(context)
//                         .textTheme
//                         .bodyText1!
//                         .copyWith(color: Colors.red),
//                   ),
//             SizedBox(height: 16.0),
//             _isSendingVerification
//                 ? CircularProgressIndicator()
//                 : Row(
//                     mainAxisSize: MainAxisSize.min,
//                     children: [
//                       ElevatedButton(
//                         onPressed: () async {
//                           setState(() {
//                             _isSendingVerification = true;
//                           });
//                           await _currentUser.sendEmailVerification();
//                           setState(() {
//                             _isSendingVerification = false;
//                           });
//                         },
//                         child: Text('Verify email'),
//                       ),
//                       SizedBox(width: 8.0),
//                       IconButton(
//                         icon: Icon(Icons.refresh),
//                         onPressed: () async {
//                           User? user = await FireAuth.refreshUser(_currentUser);

//                           if (user != null) {
//                             setState(() {
//                               _currentUser = user;
//                             });
//                           }
//                         },
//                       ),
//                     ],
//                   ),
//             SizedBox(height: 16.0),
//             _isSigningOut
//                 ? CircularProgressIndicator()
//                 : ElevatedButton(
//                     onPressed: () async {
//                       setState(() {
//                         _isSigningOut = true;
//                       });
//                       await FirebaseAuth.instance.signOut();
//                       setState(() {
//                         _isSigningOut = false;
//                       });
//                       Navigator.of(context).pushReplacement(
//                         MaterialPageRoute(
//                           builder: (context) => LoginPage(),
//                         ),
//                       );
//                     },
//                     child: Text('Sign out'),
//                     style: ElevatedButton.styleFrom(
//                       primary: Colors.red,
//                       shape: RoundedRectangleBorder(
//                         borderRadius: BorderRadius.circular(30),
//                       ),
//                     ),
//                   ),
//           ],
//         ),
//       ),
//     );
//   }
// }

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    final _themeProvider = Provider.of<ThemeProvider>(context);
    final _userProvider = Provider.of<UserProvider>(context);
    final _currentUser = _userProvider.user;
    String _initialName = getInitialsName(_currentUser.displayName!);

    bool _isSigningOut = false;
    print(_userProvider.user);

    Widget _createContentPage() {
      return Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Column(
            // mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 20.0),
              Center(
                  child: CircleAvatar(
                backgroundColor: kPrimaryColor.withOpacity(0.2),
                radius: 60,
                child: Text(
                  _initialName,
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 40.0,
                      color: kPrimaryColor),
                ),
              )),
              SizedBox(height: 20.0),
              ListTile(
                title: Text("Nombre: ${_currentUser.displayName}",
                    style: TextStyle(
                        fontWeight: FontWeight.w500, color: Colors.grey[500])),
              ),
              Divider(height: 0.2),
              ListTile(
                title: Text("Email: ${_currentUser.email}",
                    style: TextStyle(
                        fontWeight: FontWeight.w500, color: Colors.grey[500])),
              ),
              Divider(height: 0.2),
              SwitchListTile(
                title: Text("Notificaciones",
                    style: TextStyle(
                        fontWeight: FontWeight.w500, color: Colors.grey[500])),
                onChanged: (value) {},
                value: true,
              ),
              Divider(height: 0.2),
              SwitchListTile(
                title: Text("Modo Oscuro",
                    style: TextStyle(
                        fontWeight: FontWeight.w500, color: Colors.grey[500])),
                onChanged: (value) {
                  _themeProvider.onChange();
                },
                value: _themeProvider.darkTheme,
              ),
              Divider(height: 0.2),
              ListTile(
                trailing: Icon(Icons.login_outlined),
                title: Text("Cerrar Sesión",
                    style: TextStyle(
                        fontWeight: FontWeight.w500, color: Colors.grey[500])),
                onTap: () async {
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
              ),
            ],
          ),
          Positioned(
            bottom: 10.0,
            child: Text(
              "Versión: 1.0.0",
            ),
          )
        ],
      );
    }

    return Scaffold(
        appBar: AppBar(backgroundColor: kBackgroundColor),
        body: _createContentPage());
  }
}

// Text(
//   'Nombre: ${_currentUser.displayName}',
//   style: Theme.of(context).textTheme.bodyText1,
// ),
// SizedBox(height: 16.0),
// Text(
//   'Email: ${_currentUser.email}',
//   style: Theme.of(context).textTheme.bodyText1,
// ),
// SizedBox(height: 16.0),
// _currentUser.emailVerified
//     ? Text(
//         'Email verified',
//         style: Theme.of(context)
//             .textTheme
//             .bodyText1!
//             .copyWith(color: Colors.green),
//       )
//     : Text(
//         'Email not verified',
//         style: Theme.of(context)
//             .textTheme
//             .bodyText1!
//             .copyWith(color: Colors.red),
//       ),
// SizedBox(height: 16.0),

// _isSendingVerification
//     ? CircularProgressIndicator()
//     : Row(
//         mainAxisSize: MainAxisSize.min,
//         children: [
//           ElevatedButton(
//             onPressed: () async {
//               setState(() {
//                 _isSendingVerification = true;
//               });
//               await _currentUser.sendEmailVerification();
//               setState(() {
//                 _isSendingVerification = false;
//               });
//             },
//             child: Text('Verify email'),
//           ),
//           SizedBox(width: 8.0),
//           IconButton(
//             icon: Icon(Icons.refresh),
//             onPressed: () async {
//               User? user = await FireAuth.refreshUser(_currentUser);

//               if (user != null) {
//                 setState(() {
//                   _currentUser = user;
//                 });
//               }
//             },
//           ),
//         ],
//       ),
//   SizedBox(height: 16.0),
//   _isSigningOut
//       ? Loading()
//       : ElevatedButton(
//           onPressed: () async {
//             setState(() {
//               _isSigningOut = true;
//             });
//             await FirebaseAuth.instance.signOut();
//             setState(() {
//               _isSigningOut = false;
//             });
//             Navigator.of(context).pushReplacement(
//               MaterialPageRoute(
//                 builder: (context) => LoginPage(),
//               ),
//             );
//           },
//           child: Text('Sign out'),
//           style: ElevatedButton.styleFrom(
//             primary: Colors.red,
//             shape: RoundedRectangleBorder(
//               borderRadius: BorderRadius.circular(30),
//             ),
//           ),
//         ),
