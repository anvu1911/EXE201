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
        child: SingleChildScrollView(
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
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                              fontSize: 30),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(0, 0, 0, 40),
                        child: TextField(
                          style: TextStyle(fontSize: 18, color: Colors.black),
                          decoration: InputDecoration(labelText: "Username or email",
                              labelStyle: TextStyle(color: Colors.blue, fontSize: 15)),),
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
                                  labelStyle: TextStyle(color: Colors.blue, fontSize: 15)),
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
                                fontWeight: FontWeight.bold
                            ),),
                          )
                      ),

                      Padding(
                        padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                        child: Container(alignment: Alignment.center,
                            child: Text("FORGOT PASSWORD",style: TextStyle(
                                color: Colors.blue,
                                fontSize: 13,
                                fontWeight: FontWeight.bold
                            ),)),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                        child: Container(alignment: Alignment.center,
                            child: Text("If, you do not have account, create one",style: TextStyle(
                                color: Colors.blue,
                                fontSize: 15,
                                fontWeight: FontWeight.bold
                            ),)),
                      ),

                      Padding(
                          padding: const EdgeInsets.fromLTRB(0, 150, 0, 0),
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
                                      fontWeight: FontWeight.bold
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
                                  ),)
                                ],
                              )
                              ),
                            ),
                          ],
                        ),

                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
                        child: Container(
                            child: Text("Khi đăng ký trên Shleep, bạn đã đồng ý với \n các điều khoản và chính sách bảo mật của chúng tôi", style: TextStyle(
                              color: Colors.white,
                            ),)),
                      )
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
  Widget togglePassword(){
    return IconButton(onPressed: (){
      setState(() {
        _isSecurePassword = !_isSecurePassword;
      });

    }, icon: _isSecurePassword ? Icon(Icons.visibility) : Icon(Icons.visibility_off),
      color: Colors.grey,);
  }
}


