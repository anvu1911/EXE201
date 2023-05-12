import 'package:flutter/material.dart';

import '../../widgets/widgets.dart';

void main() => runApp(RegisterPage());

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage
> {
  var imgBackground = AssetImage("assets/images/login1.png");
  bool _isSecurePassword = true;
  bool _isLoading = false;
  final formKey = GlobalKey<FormState>();
  String email = "";
  String password = "";
  String fullName = "";
  bool _obscureText = true;
  bool _obscureConfirmText = true;

  // AuthService authService = AuthService();

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
            body: Container(
              padding: EdgeInsets.fromLTRB(20, 20, 20, 0),
              constraints: BoxConstraints.expand(),
              //color: Colors.white,
              child: SingleChildScrollView(
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
                        "REGISTRY",
                        style: TextStyle(
                            fontFamily: 'Itim-Regular',
                            color: Colors.white,
                            fontSize: 30),
                      ),
                    ),
                    const SizedBox(height: 20),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 0, 0, 20),
                      // child: TextField(
                      //   style: TextStyle(fontSize: 18, color: Colors.black),
                      //   decoration: InputDecoration(
                      //       labelText: "Username",
                      //       labelStyle: TextStyle(
                      //           color: Colors.blue,
                      //           fontSize: 15,
                      //           fontFamily: 'Itim-Regular')),
                      // ),
                      child: TextFormField(
                        decoration: textInputDecoration.copyWith(
                            labelText: "Username",
                            labelStyle: TextStyle(
                                color: Colors.blue,
                                fontSize: 18,
                                fontFamily: 'Itim-Regular')
                            // prefixIcon: Icon(
                            //   Icons.email,
                            //   color: Theme.of(context).primaryColor,
                            // ),
                            ),
                        style:
                            const TextStyle(fontSize: 20, color: Colors.white),
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
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 0, 0, 20),
                      // child: TextField(
                      //   style: TextStyle(fontSize: 18, color: Colors.black),
                      //   decoration: InputDecoration(
                      //       labelText: "Email",
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
                        style:
                            const TextStyle(fontSize: 20, color: Colors.white),
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
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 0, 0, 20),
                      // child: Stack(
                      //   alignment: AlignmentDirectional.centerEnd,
                      //   children: [
                      //     TextField(
                      //       style: TextStyle(fontSize: 18, color: Colors.black),
                      //       obscureText: _isSecurePassword,
                      //       decoration: InputDecoration(
                      //           labelText: "Paword",
                      //           labelStyle: TextStyle(
                      //               color: Colors.blue,
                      //               fontSize: 15,
                      //               fontFamily: 'Itim-Regular')),
                      //     ),
                      //     togglePassword(),
                      //   ],
                      // ),
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
                        style:
                            const TextStyle(fontSize: 20, color: Colors.white),
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
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 0, 0, 20),
                      // child: Stack(
                      //   alignment: AlignmentDirectional.centerEnd,
                      //   children: [
                      //     TextField(
                      //       style: TextStyle(fontSize: 18, color: Colors.black),
                      //       obscureText: _isSecurePassword,
                      //       decoration: InputDecoration(
                      //           labelText: "Re-enter Password",
                      //           labelStyle: TextStyle(
                      //               color: Colors.blue,
                      //               fontSize: 15,
                      //               fontFamily: 'Itim-Regular')),
                      //     ),
                      //     togglePassword(),
                      //   ],
                      // ),
                      child: TextFormField(
                        obscureText: _obscureConfirmText,
                        decoration: textInputDecoration.copyWith(
                            labelText: "Re-enter Password",
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
                                  _obscureConfirmText = !_obscureConfirmText;
                                });
                              },
                              child: Icon(_obscureConfirmText
                                  ? Icons.visibility
                                  : Icons.visibility_off),
                            )),
                        style:
                            const TextStyle(fontSize: 20, color: Colors.white),
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
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Color.fromRGBO(117, 166, 193, 1),
                              minimumSize: Size(250, 40),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20.0))),
                          child: Text(
                            "SIGN UP",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 30,
                                fontFamily: 'Itim-Regular'),
                          ),
                        )),
                    Padding(
                        padding: const EdgeInsets.fromLTRB(0, 80, 0, 0),
                        child: ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                                backgroundColor: Color.fromRGBO(117, 166, 193, 1),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20.0))
                                // minimumSize: Size(250, 40),
                                ),
                            child: Row(
                              children: [
                                Image.asset('assets/images/phone.png',
                                    width: 50, height: 50),
                                Text(
                                  "SIGN UP WITH NUMBER",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 22,
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
                                    Image.asset('assets/images/google.png',
                                        width: 45, height: 45),
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
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
                      child: Container(
                          alignment: Alignment.center,
                          child: Text(
                            "Khi đăng ký trên Shleep, bạn đã đồng ý với các \nđiều khoản và chính sách bảo mật của chúng tôi.",
                            style: TextStyle(
                                color: Colors.white,
                                fontFamily: 'Itim-Regular'),
                          )),
                    )
                  ],
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
}
