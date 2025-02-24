import 'package:exe201/pages/home_page.dart';
import 'package:exe201/pages/premium_news_page.dart';
import 'package:exe201/pages/premium_sounds_page.dart';
import 'package:exe201/pages/premium_weather_page.dart';
import 'package:exe201/pages/snakegame.dart';
import 'package:flutter/material.dart';
import '../widgets/bottom_navigation_bar.dart';
import '../widgets/light_button.dart';
import '../widgets/top_bar.dart';
import 'chart_page.dart';

class PremiumGamesPage extends StatefulWidget {
  const PremiumGamesPage({super.key});

  @override
  _PremiumGamesPage createState() {
    return _PremiumGamesPage();
  }
}

class _PremiumGamesPage extends State<PremiumGamesPage> {
  int _selectedIndex = 2;
  double progress = 0.5;

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
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const ChartPage()),
        );
        break;

      case 2:
      // Navigate to the notifications page
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const PremiumNewsPage()),
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
        appBar: TopBar(
          showArrow: true,
          title: 'Statistics',
          onBackButtonPressed: () {
            Navigator.pop(context);
          },
        ),
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
                Padding(
                  padding: const EdgeInsets.only(top: 90),
                  child: Row(
                      children: [
                        Padding(
                          padding:
                          const EdgeInsets.fromLTRB(3, 0, 0, 0),
                          child: LightButton(
                            text: 'NEWS',
                            width: 80,
                            height: 35, onPressed: () { Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => PremiumNewsPage()), // NewPage là một trang mới bạn muốn chuyển đến
                          ); },),
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
                          const EdgeInsets.fromLTRB(3, 0, 0, 0),
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
                          const EdgeInsets.fromLTRB(3, 0, 0, 0),
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
                                "GAMES",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 17.5,
                                    fontFamily:
                                    'Itim-Regular'),
                              )


                          ),
                        ),
                      ]
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.fromLTRB(30, 0, 0, 0),
                        child: GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const SnakeGame()));
                          },
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(20),
                            child: Image.asset(
                              'assets/images/meo_cam_trai.png',
                              width: 90,
                              height: 90,
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(30, 0, 0, 0),
                        child: GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const SnakeGame()));
                          },
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(20),
                            child: Image.asset(
                              'assets/images/cat_hero.png',
                              width: 90,
                              height: 90,
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(30, 0, 0, 0),
                        child: GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const SnakeGame()));
                          },
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(20),
                            child: Image.asset(
                              'assets/images/cat_war.png',
                              width: 90,
                              height: 90,
                            ),
                          ),
                        ),
                      ),
                    ],
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

