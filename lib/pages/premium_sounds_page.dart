import 'package:exe201/pages/home_page.dart';
import 'package:exe201/pages/premium_weather_page.dart';
import 'package:exe201/widgets/chart.dart';
import 'package:exe201/widgets/percentage_rectangle.dart';
import 'package:exe201/widgets/show_box.dart';
import 'package:exe201/widgets/sleep_quality_linechart.dart';
import 'package:flutter/material.dart';
import '../widgets/bottom_navigation_bar.dart';
import '../widgets/light_button.dart';
import '../widgets/top_bar.dart';
import 'chart_page.dart';

class PremiumSoundsPage extends StatefulWidget {
  const PremiumSoundsPage({super.key});

  @override
  _PremiumSoundsPage createState() {
    return _PremiumSoundsPage();
  }
}

class _PremiumSoundsPage extends State<PremiumSoundsPage> {
  int _selectedIndex = 2;



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

  @override
  Widget build(BuildContext context) {
    // final data = [10.0, 23.0, 43.0, 54.0, 34.0, 76.0, 97.0];
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
                          height: 35, onPressed: () {  },),
                    ),
                    Padding(
                      padding:
                      const EdgeInsets.fromLTRB(4, 0, 0, 0),
                      child: LightButton(
                        text: 'SOUNDS',
                        width: 100,
                        height: 35, onPressed: () {  },),
                    ),
                    Padding(
                      padding:
                      const EdgeInsets.fromLTRB(4, 0, 0, 0),
                      child: LightButton(
                        text: 'WEATHER',
                        width: 110,
                        height: 35, onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => PremiumWeatherPage()), // NewPage là một trang mới bạn muốn chuyển đến
                        );
                      },),
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
                ColoredRectangle(
                    width: 360,
                    height: 40,
                    text: 'Collection',
                    padding: EdgeInsets.only(top: 20)),
                SizedBox(
                  height: 5,
                ),
                SizedBox(
                  height: 100,
                  width: double.infinity,
                  child: Expanded(
                    child: Container(
                      width: 50,
                      height: 50,
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
                        child:Row(
                          children: [
                            Image.asset(
                                'assets/images/piano.png',
                                width: 90,
                                height: 90),
                            Column(
                              children: [
                                Text(
                                  "Julio Iglesias’s Collection",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 20,
                                      fontFamily:
                                      'Itim-Regular'),
                                ),
                                Text(
                                  "The most popular Latin singer of\n the late 20th century and beyond,\n a smooth crooner with roma...",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 18,
                                      fontFamily:
                                      'Itim-Regular'),
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                SizedBox(
                  height: 100,
                  width: double.infinity,
                  child: Expanded(
                    child: Container(
                      width: 50,
                      height: 50,
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
                        child:Row(
                          children: [
                            Image.asset(
                                'assets/images/piano.png',
                                width: 90,
                                height: 90),
                            Column(
                              children: [
                                Text(
                                  "Julio Iglesias’s Collection",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 20,
                                      fontFamily:
                                      'Itim-Regular'),
                                ),
                                Text(
                                  "The most popular Latin singer of\n the late 20th century and beyond,\n a smooth crooner with roma...",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 18,
                                      fontFamily:
                                      'Itim-Regular'),
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                SizedBox(
                  height: 100,
                  width: double.infinity,
                  child: Expanded(
                    child: Container(
                      width: 50,
                      height: 50,
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
                          child:Row(
                            children: [
                              Image.asset(
                                    'assets/images/piano.png',
                                    width: 90,
                                    height: 90),
                                  Column(
                                    children: [
                                      Text(
                                        "Julio Iglesias’s Collection",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 20,
                                            fontFamily:
                                            'Itim-Regular'),
                                      ),
                                      Text(
                                        "The most popular Latin singer of\n the late 20th century and beyond,\n a smooth crooner with roma...",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 18,
                                            fontFamily:
                                            'Itim-Regular'),
                                      )
                                    ],
                                  )
                            ],
                          ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                SizedBox(
                  height: 100,
                  width: double.infinity,
                  child: Expanded(
                    child: Container(
                      width: 50,
                      height: 50,
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
                        child:Row(
                          children: [
                            Image.asset(
                                'assets/images/piano.png',
                                width: 90,
                                height: 90),
                            Column(
                              children: [
                                Text(
                                  "Julio Iglesias’s Collection",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 20,
                                      fontFamily:
                                      'Itim-Regular'),
                                ),
                                Text(
                                  "The most popular Latin singer of\n the late 20th century and beyond,\n a smooth crooner with roma...",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 18,
                                      fontFamily:
                                      'Itim-Regular'),
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
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
