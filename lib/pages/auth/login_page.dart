import 'package:flutter/material.dart';
void main() => runApp(Myapp());
var img_bg = AssetImage("assets/login1.png");
class Myapp extends StatefulWidget{
  @override
  _MyAppState createState()=>_MyAppState();
}
class _MyAppState extends State<Myapp>{
  bool _isSecurePassword = true;
  @override
  Widget build(BuildContext context) {
    precacheImage(img_bg, context);
    return MaterialApp(
      home: Container(
        decoration: BoxDecoration(
          image: DecorationImage(image: img_bg,fit: BoxFit.cover),
        ),
          child: SafeArea(
            child: Scaffold(
              backgroundColor: Colors.transparent,
              body: Container(
                padding: EdgeInsets.fromLTRB(30, 0, 30, 0),
                constraints: BoxConstraints.expand(),
                //color: Colors.white,
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                          decoration: BoxDecoration(
                              shape: BoxShape.circle
                          ),
                          child: Image.asset('assets/logo1.1.png', height: 70, width: 70,)
                      ),
                      Container(
                        alignment: Alignment.center,
                        child: Text(
                          "LOGIN",
                          style:
                          TextStyle(

                              color: Colors.white,
                              fontSize: 30,
                              fontFamily: 'Itim-Regular'
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(0, 0, 0, 40),
                        child: TextField(
                          style: TextStyle(fontSize: 18, color: Colors.black),
                          decoration: InputDecoration(labelText: "Username or email",
                              labelStyle: TextStyle(color: Colors.blue, fontSize: 15,
                                  fontFamily: 'Itim-Regular'
    )),),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(0, 0, 0, 40),
                        child: Stack(
                          alignment: AlignmentDirectional.centerEnd,
                          children: [
                            TextField(
                              style: TextStyle(fontSize: 18, color: Colors.black),
                              obscureText: true,
                              decoration: InputDecoration(labelText: "Paword",
                                  labelStyle: TextStyle(color: Colors.blue, fontSize: 15,
                                      fontFamily: 'Itim-Regular'
                                  )),
                            ),
                            togglePassword(),
                          ],
                        ),
                      ),
                      SizedBox(
                          width: double.infinity,
                          height:60,
                          child: ElevatedButton(
                            onPressed: (){},
                            style: ElevatedButton.styleFrom(
                              primary: Color.fromRGBO(117, 166, 193, 1),
                              minimumSize: Size(250, 40),
                            ),
                            child: Text("LOG IN", style: TextStyle(
                                color: Colors.white,
                                fontSize: 30,

                                fontFamily: 'Itim-Regular'
                            ),),
                          )
                      ),

                      Padding(
                        padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
                        child: Container(alignment: Alignment.centerRight,
                            child: Text("Forgot Password?",style: TextStyle(
                                color: Colors.blue,
                                fontSize: 13,
                                fontFamily: 'Itim-Regular'
                            ),)),
                      ),
                      Padding(
                          padding: const EdgeInsets.fromLTRB(0, 200, 0, 0),
                          child: ElevatedButton(
                              onPressed: (){},
                              style: ElevatedButton.styleFrom(
                                primary: Color.fromRGBO(117, 166, 193, 1),
                                // minimumSize: Size(250, 40),
                              ),
                              child: Row(
                                children: [
                                  Image.asset('assets/phone.png',width: 50,height: 50),
                                  Text("LOGIN WITH NUMBER", style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 25,

                                      fontFamily: 'Itim-Regular'
                                  ),
                                  ),
                                ],
                              )
                          )
                      ),



                      Container(
                        height: 60,
                        width: double.infinity,
                        child: Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                              child: ElevatedButton(onPressed: null, child: Row(
                                children: [
                                  Image.asset('assets/google.png',width: 50,height: 50),
                                  Text("GOOGLE", style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 18.5,
                                    fontFamily: 'Itim-Regular'
                                  ),)
                                ],
                              )
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                              child: ElevatedButton(onPressed: null, child: Row(
                                children: [
                                  Image.asset('assets/fb.png',width: 50,height: 50),
                                  Text("FACEBOOK", style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 18.5,
                                    fontFamily: 'Itim-Regular'
                                  ),)
                                ],
                              )
                              ),
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
      debugShowCheckedModeBanner: false,
    );
  }
  Widget togglePassword(){
    return IconButton(onPressed: (){
      setState(() {
        _isSecurePassword = !_isSecurePassword;
      });

    }, icon: _isSecurePassword ? Icon(Icons.visibility) : Icon(Icons.visibility_off),
      color: Colors.grey,);
  }
}


