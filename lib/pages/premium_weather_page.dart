import 'package:exe201/pages/home_page.dart';
import 'package:exe201/pages/premium_sounds_page.dart';
import 'package:flutter/material.dart';
import '../widgets/bottom_navigation_bar.dart';
import '../widgets/light_button.dart';
import '../widgets/top_bar.dart';
import 'chart_page.dart';

class PremiumWeatherPage extends StatefulWidget {
  const PremiumWeatherPage({super.key});

  @override
  _PremiumWeatherPage createState() {
    return _PremiumWeatherPage();
  }
}

class _PremiumWeatherPage extends State<PremiumWeatherPage> {
  int _selectedIndex = 2;
  List<String> daysOfWeek = [
    'Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday', 'Sunday'
  ];
  int expandedIndex = -1; // Chỉ một thẻ được mở cùng một lúc


  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    switch (index) {
      case 0:
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const HomePage()),
        );
        break;
      case 1:
      // Navigate to the chart page
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const ChartPage()),
        );
        break;

      case 2:
      // Navigate to the notifications page
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const PremiumWeatherPage()),
        );
        break;
    }
  }
  //List<Item> _data = generateItems();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Sleeping app',
      home: Scaffold(
        extendBodyBehindAppBar: true,

        body: LayoutBuilder(
          builder: (context, constraints) => Container(
            width: constraints.maxWidth,
            height: constraints.maxHeight,
            decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/images/background-2.png'),
                  fit: BoxFit.cover,
                  colorFilter: ColorFilter.mode(
                      Color.fromRGBO(35, 56, 99, 0.6), BlendMode.darken)),

            ),
            child: Column(
              children: [
                TopBar(
                  showArrow: true,
                  title: 'Premium Features',
                  onBackButtonPressed: () {
                    Navigator.pop(context);
                  },
                ),
                Row(
                    children: [
                      Padding(
                        padding:
                        const EdgeInsets.fromLTRB(3, 0, 0, 0),
                        child: LightButton(
                          text: 'NEWS',
                          width: 80,
                          height: 35, onPressed: () {

                        },),
                      ),
                      Padding(
                        padding:
                        const EdgeInsets.fromLTRB(4, 0, 0, 0),
                        child: LightButton(
                          text: 'SOUNDS',
                          width: 100,
                          height: 35, onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => PremiumSoundsPage()), // NewPage là một trang mới bạn muốn chuyển đến
                          );
                        },),
                      ),
                      Padding(
                        padding:
                        const EdgeInsets.fromLTRB(4, 0, 0, 0),
                        child: ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                                backgroundColor:
                                Color.fromRGBO(
                                    53, 70, 112, 1),
                                shape: RoundedRectangleBorder(
                                    borderRadius:
                                    BorderRadius.circular(
                                        20.0))
                              // minimumSize: Size(250, 40),
                            ),
                            child:

                            Text(
                              "WEATHER",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 17.5,
                                  fontFamily:
                                  'Itim-Regular'),
                            )


                        ),
                      ),
                      Padding(
                        padding:
                        const EdgeInsets.fromLTRB(4, 0, 0, 0),
                        child: LightButton(
                          text: 'GAMES',
                          width: 85,
                          height: 35, onPressed: () {  },),
                      ),
                    ]
                ),
          Container(
            height: 560,
            width: 350,
            child: ListView(
            children: List.generate(daysOfWeek.length, (index) {

              return Card(
                color: Color.fromRGBO(30,90,137,1),
                child: ExpansionTile(
        title: _nameTab(index),
        children: [
          _buildContentForDay(index)
        ],
        ),
              );
        }),
      ),
          )
              ],
            ),
          ),
        ),
        bottomNavigationBar: MyBottomNavigationBar(
          currentIndex: _selectedIndex,
          onTap: _onItemTapped,
        ),
      ),
    );
  }
}

Widget _nameTab(int day) {
  // Return different content based on the day
  switch (day) {
    case 0:
      return Container(
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 0, 8, 0),
              child: Text(
                "Monday",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 25,
                  fontFamily: 'Itim-Regular',
                ),
              ),
            ),
SizedBox(width: 35,),
            Text(
              "19 JUN",
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontFamily: 'Itim-Regular',
              ),
            ),
            Image.asset(
              'assets/images/nhieumay.png',
              width: 45,
              height: 45,
            ),
            Text(
              "32°",
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontFamily: 'Itim-Regular',
              ),
            ),
          ],
        ),
      );
    case 1:
      return Container(
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 0, 8, 0),
              child: Text(
                "Tuesday",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 25,
                  fontFamily: 'Itim-Regular',
                ),
              ),
            ),
            SizedBox(width: 30,),
            Text(
              "20 JUN",
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontFamily: 'Itim-Regular',
              ),
            ),
            Image.asset(
              'assets/images/nhieumay.png',
              width: 45,
              height: 45,
            ),
            Text(
              "28°",
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontFamily: 'Itim-Regular',
              ),
            ),
          ],
        ),
      );
    case 2:
      return Container(
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 0, 8, 0),
              child: Text(
                "Wednesday",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 25,
                  fontFamily: 'Itim-Regular',
                ),
              ),
            ),

            Text(
              "21 JUN",
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontFamily: 'Itim-Regular',
              ),
            ),
            Image.asset(
              'assets/images/mua.png',
              width: 45,
              height: 45,
            ),
            Text(
              "28°",
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontFamily: 'Itim-Regular',
              ),
            ),
          ],
        ),
      );
    case 3:
      return Container(
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 0, 8, 0),
              child: Text(
                "Thursday",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 25,
                  fontFamily: 'Itim-Regular',
                ),
              ),
            ),
            SizedBox(width: 25,),
            Text(
              "22 JUN",
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontFamily: 'Itim-Regular',
              ),
            ),
            Image.asset(
              'assets/images/mua.png',
              width: 45,
              height: 45,
            ),
            Text(
              "31°",
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontFamily: 'Itim-Regular',
              ),
            ),
          ],
        ),
      );
    case 4:
      return Container(
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 0, 8, 0),
              child: Text(
                "Friday",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 25,
                  fontFamily: 'Itim-Regular',
                ),
              ),
            ),
            SizedBox(width: 55,),
            Text(
              "23 JUN",
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontFamily: 'Itim-Regular',
              ),
            ),
            Image.asset(
              'assets/images/muaset.png',
              width: 45,
              height: 45,
            ),
            Text(
              "30°",
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontFamily: 'Itim-Regular',
              ),
            ),
          ],
        ),
      );
    case 5:
      return Container(
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 0, 8, 0),
              child: Text(
                "Saturday",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 25,
                  fontFamily: 'Itim-Regular',
                ),
              ),
            ),
            SizedBox(width: 28,),
            Text(
              "24 JUN",
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontFamily: 'Itim-Regular',
              ),
            ),
            Image.asset(
              'assets/images/nhieumay.png',
              width: 45,
              height: 45,
            ),
            Text(
              "31°",
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontFamily: 'Itim-Regular',
              ),
            ),
          ],
        ),
      );
    case 6:
      return Container(
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 0, 8, 0),
              child: Text(
                "Sunday",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 25,
                  fontFamily: 'Itim-Regular',
                ),
              ),
            ),
            SizedBox(width: 47,),
            Text(
              "25 JUN",
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontFamily: 'Itim-Regular',
              ),
            ),
            Image.asset(
              'assets/images/nhieumay.png',
              width: 45,
              height: 45,
            ),
            Text(
              "29°",
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontFamily: 'Itim-Regular',
              ),
            ),
          ],
        ),
      );
  // Add cases for other days
    default:
      return Container();
  }
}
Widget _buildContentForDay(int day) {
  // Return different content based on the day
  switch (day) {
    case 0:
      return Container(
        color: Color.fromRGBO(29,66,119,100),
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(30, 0, 0, 0),
              child: Column(
                children: [
                  Text(
                    'HoChiMinh city',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 28,
                      fontFamily: 'Itim-Regular',
                    ),
                  ),
                  Text(
                    'Humidity 20%',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontFamily: 'Itim-Regular',
                    ),
                  ),
                  Text(
                    'v29° ^32°',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 25,
                      fontFamily: 'Itim-Regular',
                    ),
                  ),
                  Text(
                    "32°",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 75,
                      fontFamily: 'Itim-Regular',
                    ),
                  ),
                ],
              ),
            ),
            Column(
              children: [
                Image.asset(
                  'assets/images/nhieumay.png',
                  width: 110,
                  height: 110,
                ),
                Text("Cloudy",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontFamily: 'Itim-Regular',
                  ),
                ),
                SizedBox(height: 10,)
              ],
            ),
          ],
        ),
      );
    case 1:
      return Container(
        color: Color.fromRGBO(29,66,119,100),
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(30, 0, 0, 0),
              child: Column(
                children: [
                  Text(
                    'HoChiMinh city',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 28,
                      fontFamily: 'Itim-Regular',
                    ),
                  ),
                  Text(
                    'Humidity 27%',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontFamily: 'Itim-Regular',
                    ),
                  ),
                  Text(
                    'v28° ^32°',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 25,
                      fontFamily: 'Itim-Regular',
                    ),
                  ),
                  Text(
                    "28°",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 75,
                      fontFamily: 'Itim-Regular',
                    ),
                  ),
                ],
              ),
            ),
            Column(
              children: [
                Image.asset(
                  'assets/images/nhieumay.png',
                  width: 110,
                  height: 110,
                ),
                Text("Cloudy",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontFamily: 'Itim-Regular',
                  ),
                ),
                SizedBox(height: 10,)
              ],
            ),
          ],
        ),
      );
    case 2:
      return Container(
        color: Color.fromRGBO(29,66,119,100),
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(30, 0, 0, 0),
              child: Column(
                children: [
                  Text(
                    'HoChiMinh city',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 28,
                      fontFamily: 'Itim-Regular',
                    ),
                  ),
                  Text(
                    'Humidity 30%',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontFamily: 'Itim-Regular',
                    ),
                  ),
                  Text(
                    'v28° ^33°',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 25,
                      fontFamily: 'Itim-Regular',
                    ),
                  ),
                  Text(
                    "28°",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 75,
                      fontFamily: 'Itim-Regular',
                    ),
                  ),
                ],
              ),
            ),
            Column(
              children: [
                Image.asset(
                  'assets/images/mua.png',
                  width: 110,
                  height: 110,
                ),
                Text("Rainny",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontFamily: 'Itim-Regular',
                  ),
                ),
                SizedBox(height: 10,)
              ],
            ),
          ],
        ),
      );
    case 3:
      return Container(
        color: Color.fromRGBO(29,66,119,100),
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(30, 0, 0, 0),
              child: Column(
                children: [
                  Text(
                    'HoChiMinh city',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 28,
                      fontFamily: 'Itim-Regular',
                    ),
                  ),
                  Text(
                    'Humidity 33%',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontFamily: 'Itim-Regular',
                    ),
                  ),
                  Text(
                    'v30° ^32°',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 25,
                      fontFamily: 'Itim-Regular',
                    ),
                  ),
                  Text(
                    "31°",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 75,
                      fontFamily: 'Itim-Regular',
                    ),
                  ),
                ],
              ),
            ),
            Column(
              children: [
                Image.asset(
                  'assets/images/mua.png',
                  width: 110,
                  height: 110,
                ),
                Text("Rainny",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontFamily: 'Itim-Regular',
                  ),
                ),
                SizedBox(height: 10,)
              ],
            ),
          ],
        ),
      );
    case 4:
      return Container(
        color: Color.fromRGBO(29,66,119,100),
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(30, 0, 0, 0),
              child: Column(
                children: [
                  Text(
                    'HoChiMinh city',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 28,
                      fontFamily: 'Itim-Regular',
                    ),
                  ),
                  Text(
                    'Humidity 35%',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontFamily: 'Itim-Regular',
                    ),
                  ),
                  Text(
                    'v29° ^32°',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 25,
                      fontFamily: 'Itim-Regular',
                    ),
                  ),
                  Text(
                    "30°",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 75,
                      fontFamily: 'Itim-Regular',
                    ),
                  ),
                ],
              ),
            ),
            Column(
              children: [
                Image.asset(
                  'assets/images/muaset.png',
                  width: 110,
                  height: 110,
                ),
                Text("Rain with\nLightning",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontFamily: 'Itim-Regular',
                  ),
                ),
                SizedBox(height: 10,)
              ],
            ),
          ],
        ),
      );
    case 5:
      return Container(
        color: Color.fromRGBO(29,66,119,100),
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(30, 0, 0, 0),
              child: Column(
                children: [
                  Text(
                    'HoChiMinh city',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 28,
                      fontFamily: 'Itim-Regular',
                    ),
                  ),
                  Text(
                    'Humidity 21%',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontFamily: 'Itim-Regular',
                    ),
                  ),
                  Text(
                    'v29° ^31°',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 25,
                      fontFamily: 'Itim-Regular',
                    ),
                  ),
                  Text(
                    "31°",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 75,
                      fontFamily: 'Itim-Regular',
                    ),
                  ),
                ],
              ),
            ),
            Column(
              children: [
                Image.asset(
                  'assets/images/nhieumay.png',
                  width: 110,
                  height: 110,
                ),
                Text("Cloudy",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontFamily: 'Itim-Regular',
                  ),
                ),
                SizedBox(height: 10,)
              ],
            ),
          ],
        ),
      );
    case 6:
      return Container(
        color: Color.fromRGBO(29,66,119,100),
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(30, 0, 0, 0),
              child: Column(
                children: [
                  Text(
                    'HoChiMinh city',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 28,
                      fontFamily: 'Itim-Regular',
                    ),
                  ),
                  Text(
                    'Humidity 23%',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontFamily: 'Itim-Regular',
                    ),
                  ),
                  Text(
                    'v28° ^32°',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 25,
                      fontFamily: 'Itim-Regular',
                    ),
                  ),
                  Text(
                    "29°",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 75,
                      fontFamily: 'Itim-Regular',
                    ),
                  ),
                ],
              ),
            ),
            Column(
              children: [
                Image.asset(
                  'assets/images/nhieumay.png',
                  width: 110,
                  height: 110,
                ),
                Text("Cloudy",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontFamily: 'Itim-Regular',
                  ),
                ),
                SizedBox(height: 10,)
              ],
            ),
          ],
        ),
      );
  // Add cases for other days
    default:
      return Container();
  }
}




