import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:exe201/helper/helper_function.dart';
import 'package:exe201/service/auth_service.dart';
import 'package:exe201/service/database_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:exe201/widgets/widgets.dart';
import '../home_page.dart';

// void main() => runApp(LoginPage());

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
// _MyAppState createState() => _MyAppState();
}

class _LoginPageState extends State<LoginPage> {
  final formKey = GlobalKey<FormState>();
  var imgBackground = AssetImage("assets/images/login1.png");
  bool _isSecurePassword = true;
  String email = "";
  String password = "";
  bool _obscureText = true;
  bool _isLoading = false;
  AuthService authService = AuthService();

  @override
  Widget build(BuildContext context) {
    precacheImage(imgBackground, context);
    return MaterialApp(
      home: Container(
        decoration: BoxDecoration(
          image: DecorationImage(image: imgBackground, fit: BoxFit.cover),
        ),
        child: SafeArea(
          child: Scaffold(
            backgroundColor: Colors.transparent,
            body: _isLoading
                ? Center(
                    child: CircularProgressIndicator(
                    color: Theme.of(context).primaryColor,
                  ))
                : Container(
                    padding: EdgeInsets.fromLTRB(20, 20, 20, 0),
                    constraints: BoxConstraints.expand(),
                    child: SingleChildScrollView(
                      child: Form(
                        key: formKey,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // Container(
                            //     decoration: BoxDecoration(shape: BoxShape.circle),
                            //     child: Image.asset(
                            //       'assets/images/logo1.1.png',
                            //       height: 70,
                            //       width: 70,
                            //     )),
                            Container(
                              alignment: Alignment.center,
                              child: Text(
                                "LOGIN",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 30,
                                    fontFamily: 'Itim-Regular'),
                              ),
                            ),
                            const SizedBox(height: 20),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(0, 0, 0, 20),
                              // child: TextField(
                              //   style: TextStyle(fontSize: 18, color: Colors.white),
                              //   decoration: InputDecoration(
                              //       labelText: "Username or email",
                              //       labelStyle: TextStyle(
                              //           color: Colors.blue,
                              //           fontSize: 15,
                              //           fontFamily: 'Itim-Regular')),
                              // ),
                              child: TextFormField(
                                decoration: textInputDecoration.copyWith(
                                    labelText: "Email",
                                    labelStyle: TextStyle(
                                        color: Colors.blue,
                                        fontSize: 18,
                                        fontFamily: 'Itim-Regular')
                                    // prefixIcon: Icon(
                                    //   Icons.email,
                                    //   color: Theme.of(context).primaryColor,
                                    // ),
                                    ),
                                style: const TextStyle(
                                    fontSize: 20, color: Colors.white),
                                onChanged: (val) {
                                  setState(() {
                                    email = val;
                                  });
                                },

                                // check tha validation
                                validator: (val) {
                                  return RegExp(
                                              r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                          .hasMatch(val!)
                                      ? null
                                      : "Please enter a valid email";
                                },
                              ),
                            ),
                            // Padding(
                            //   padding: const EdgeInsets.fromLTRB(0, 0, 0, 40),
                            //   child: Stack(
                            //     alignment: AlignmentDirectional.centerEnd,
                            //     children: [
                            //       TextField(
                            //         style: TextStyle(fontSize: 18, color: Colors.white),
                            //         obscureText: true,
                            //         decoration: InputDecoration(
                            //             labelText: "Password",
                            //             labelStyle: TextStyle(
                            //                 color: Colors.blue,
                            //                 fontSize: 15,
                            //                 fontFamily: 'Itim-Regular')),
                            //       ),
                            //       togglePassword(),
                            //     ],
                            //   ),
                            // ),
                            Padding(
                              // width: double.infinity,
                              padding: const EdgeInsets.fromLTRB(0, 0, 0, 20),
                              // child: ElevatedButton(
                              //   onPressed: () {},
                              //   style: ElevatedButton.styleFrom(
                              //     primary: Color.fromRGBO(117, 166, 193, 1),
                              //     minimumSize: Size(250, 40),
                              //   ),
                              //   child: Text(
                              //     "LOG IN",
                              //     style: TextStyle(
                              //         color: Colors.white,
                              //         fontSize: 30,
                              //         fontFamily: 'Itim-Regular'),
                              //   ),
                              // ),
                              // padding: null,
                              child: TextFormField(
                                obscureText: _obscureText,
                                decoration: textInputDecoration.copyWith(
                                    labelText: "Password",
                                    labelStyle: const TextStyle(
                                        color: Colors.blue,
                                        fontSize: 18,
                                        fontFamily: 'Itim-Regular'),
                                    // prefixIcon: Icon(
                                    //   Icons.lock,
                                    //   color: Theme.of(context).primaryColor,
                                    // ),
                                    suffixIcon: GestureDetector(
                                      onTap: () {
                                        setState(() {
                                          _obscureText = !_obscureText;
                                        });
                                      },
                                      child: Icon(_obscureText
                                          ? Icons.visibility
                                          : Icons.visibility_off),
                                    )),
                                style: const TextStyle(
                                    fontSize: 20, color: Colors.white),
                                onChanged: (val) {
                                  setState(() {
                                    password = val;
                                  });
                                },
                                validator: (val) {
                                  if (val!.length < 6) {
                                    return "Password must be at least 6 characters";
                                  } else {
                                    return null;
                                  }
                                },
                              ),
                            ),
                            SizedBox(
                                width: double.infinity,
                                height: 50,
                                child: ElevatedButton(
                                  onPressed: () {
                                    login();
                                  },
                                  style: ElevatedButton.styleFrom(
                                      backgroundColor:
                                          Color.fromRGBO(117, 166, 193, 1),
                                      minimumSize: Size(250, 40),
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(20.0))),
                                  child: Text(
                                    "LOGIN",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 30,
                                        fontFamily: 'Itim-Regular'),
                                  ),
                                )),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
                              child: Container(
                                  alignment: Alignment.centerRight,
                                  child: const Text(
                                    "Forgot Password?",
                                    style: TextStyle(
                                        color: Colors.blue,
                                        fontSize: 15,
                                        fontFamily: 'Itim-Regular'),
                                  )),
                            ),
                            Padding(
                                padding:
                                    const EdgeInsets.fromLTRB(0, 200, 0, 0),
                                child: ElevatedButton(
                                    onPressed: () {},
                                    style: ElevatedButton.styleFrom(
                                        backgroundColor: const Color.fromRGBO(
                                            117, 166, 193, 1),
                                        // minimumSize: Size(250, 40),
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(20.0))),
                                    child: Row(
                                      children: [
                                        Image.asset('assets/images/phone.png',
                                            width: 50, height: 50),
                                        const Text(
                                          "LOGIN WITH NUMBER",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 25,
                                              fontFamily: 'Itim-Regular'),
                                        ),
                                      ],
                                    ))),
                            SizedBox(
                              height: 10,
                            ),
                            SizedBox(
                              height: 60,
                              width: double.infinity,
                              child: Row(
                                children: [
                                  Expanded(
                                    // padding: const EdgeInsets.fromLTRB(0, 10, 10, 0),
                                    child: ElevatedButton(
                                        onPressed: () {},
                                        style: ElevatedButton.styleFrom(
                                            backgroundColor:
                                                Color.fromRGBO(53, 70, 112, 1),
                                            shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(20.0))
                                            // minimumSize: Size(250, 40),
                                            ),
                                        child: Row(
                                          children: [
                                            Image.asset(
                                                'assets/images/google.png',
                                                width: 45,
                                                height: 45),
                                            Text(
                                              "GOOGLE",
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 18.5,
                                                  fontFamily: 'Itim-Regular'),
                                            )
                                          ],
                                        )),
                                  ),
                                  SizedBox(
                                    width: 5, //<-- SEE HERE
                                  ),
                                  Expanded(
                                    // padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                                    child: ElevatedButton(
                                        onPressed: () {},
                                        style: ElevatedButton.styleFrom(
                                            backgroundColor:
                                                Color.fromRGBO(53, 70, 112, 1),
                                            shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(20.0))
                                            // minimumSize: Size(250, 40),
                                            ),
                                        child: Row(
                                          children: [
                                            Image.asset('assets/images/fb.png',
                                                width: 45, height: 45),
                                            Text(
                                              "FACEBOOK",
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 18.5,
                                                  fontFamily: 'Itim-Regular'),
                                            )
                                          ],
                                        )),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
          ),
        ),
      ),
      debugShowCheckedModeBanner: false,
    );
  }

  Widget togglePassword() {
    return IconButton(
      onPressed: () {
        setState(() {
          _isSecurePassword = !_isSecurePassword;
        });
      },
      icon: _isSecurePassword
          ? Icon(Icons.visibility)
          : Icon(Icons.visibility_off),
      color: Colors.grey,
    );
  }

  login() async {
    if (formKey.currentState!.validate()) {
      setState(() {
        _isLoading = true;
      });
      await authService
          .loginWithUsernameAndPassword(email, password)
          .then((value) async {
        if (value == true) {
          QuerySnapshot snapshot =
              await DatabaseService(uid: FirebaseAuth.instance.currentUser!.uid)
                  .gettingUserData(email);
          // saving values to Shared Preferences
          await HelperFunctions.saveUserLoggedInStatus(true);
          await HelperFunctions.saveUserEmailSF(email);
          await HelperFunctions.saveUsernameSF(snapshot.docs[0]['fullName']);

          nextScreenReplace(context, const HomePage());
        } else {
          showSnackBar(context, Colors.red, value);
          setState(() {
            _isLoading = false;
          });
        }
      });
    }
  }
}
