import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_plant_app/src/models/enum.dart';
import 'package:flutter_plant_app/src/pages/main_app.dart';
import 'package:flutter_plant_app/src/pages/register/register_page.dart';
import 'package:flutter_plant_app/src/providers/user_provider.dart';
import 'package:flutter_plant_app/src/utils/consts.dart';
import 'package:flutter_plant_app/src/utils/fire_auth.dart';
import 'package:flutter_plant_app/src/utils/funtions.dart';
import 'package:flutter_plant_app/src/utils/validator.dart';
import 'package:flutter_plant_app/src/widgets/common/button_primary.dart';
import 'package:flutter_plant_app/src/widgets/common/button_secondary.dart';
import 'package:flutter_plant_app/src/widgets/common/loading.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final _emailTextController = TextEditingController();
  final _passwordTextController = TextEditingController();
  final _focusEmail = FocusNode();
  final _focusPassword = FocusNode();
  bool _isProcessing = false;

  Future<FirebaseApp> _initializeFirebase() async {
    print("firebase initialize...");
    FirebaseApp firebaseApp = await Firebase.initializeApp();
    User? user = FirebaseAuth.instance.currentUser;
    // if (user != null) {
    //   Navigator.of(context).pushReplacement(
    //     MaterialPageRoute(
    //       builder: (context) => OnBoardingPage(),
    //     ),
    //   );
    // }
    return firebaseApp;
  }

  @override
  Widget build(BuildContext context) {
    final _userProvider = Provider.of<UserProvider>(context);
    return GestureDetector(
      onTap: () {
        _focusEmail.unfocus();
        _focusPassword.unfocus();
      },
      child: Scaffold(
        backgroundColor: kOnBoardingColor,
        body: FutureBuilder(
          future: _initializeFirebase(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              return SafeArea(
                child: Padding(
                  padding: EdgeInsets.all(24.0),
                  child: ListView(
                    children: [
                      Text("Buenas tardes!",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 30.0)),
                      SizedBox(height: 30.0),
                      Image(
                          image: AssetImage("assets/images/onboard.png"),
                          height: 240.0),
                      Form(
                        key: _formKey,
                        child: Column(
                          children: [
                            TextFormField(
                              controller: _emailTextController,
                              focusNode: _focusEmail,
                              validator: (value) =>
                                  Validator.validateEmail(email: value),
                              decoration: InputDecoration(
                                hintText: "Email",
                                hintStyle: TextStyle(color: kPrimaryColor),
                                errorBorder: UnderlineInputBorder(
                                  borderRadius: BorderRadius.circular(6.0),
                                  borderSide: BorderSide(color: Colors.red),
                                ),
                              ),
                            ),
                            SizedBox(height: 10.0),
                            TextFormField(
                              controller: _passwordTextController,
                              focusNode: _focusPassword,
                              obscureText: true,
                              validator: (value) => Validator.validatePassword(
                                password: value,
                              ),
                              decoration: InputDecoration(
                                hintText: "Contraseña",
                                hintStyle: TextStyle(color: kPrimaryColor),
                                errorBorder: UnderlineInputBorder(
                                  borderRadius: BorderRadius.circular(6.0),
                                  borderSide: BorderSide(color: Colors.red),
                                ),
                              ),
                            ),
                            SizedBox(height: 24.0),
                            _isProcessing
                                ? Loading()
                                : ButtonPrimary(
                                    onPressed: () async {
                                      _focusEmail.unfocus();
                                      _focusPassword.unfocus();
                                      if (_formKey.currentState!.validate()) {
                                        setState(() {
                                          _isProcessing = true;
                                        });
                                        User? user = await FireAuth
                                            .signInUsingEmailPassword(
                                          email: _emailTextController.text,
                                          password:
                                              _passwordTextController.text,
                                        );
                                        setState(() {
                                          _isProcessing = false;
                                        });
                                        if (user != null) {
                                          _userProvider.setUser(user);
                                          Navigator.of(context).pushReplacement(
                                            MaterialPageRoute(
                                              builder: (context) => MainApp(),
                                            ),
                                          );
                                        } else {
                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(getSnackBar(
                                                  "Algunos datos no son correctos",
                                                  SnackbarType.error,
                                                  time: 4));
                                        }
                                      }
                                    },
                                    text: "Ingresar",
                                  ),
                          ],
                        ),
                      ),
                      SizedBox(height: 50.0),
                      ButtonSecondary(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => RegisterPage()));
                        },
                        text: "Registrarme",
                      ),
                    ],
                  ),
                ),
              );
            }

            return Center(
              child: Loading(),
            );
          },
        ),
      ),
    );
  }
}
