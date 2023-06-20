import 'package:exe201/pages/home_page.dart';
import 'package:exe201/pages/premium_games_page/premium_games_day_page.dart';
import 'package:exe201/pages/premium_sounds_page.dart';
import 'package:exe201/pages/premium_weather_page.dart';
import 'package:flutter/material.dart';
import '../widgets/bottom_navigation_bar.dart';
import '../widgets/light_button.dart';
import '../widgets/top_bar.dart';
import 'chart_page.dart';

class PremiumNewsPage extends StatefulWidget {
  const PremiumNewsPage({super.key});

  @override
  _PremiumNewsPage createState() {
    return _PremiumNewsPage();
  }
}

class _PremiumNewsPage extends State<PremiumNewsPage> {
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
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const ChartPage()),
        );
        break;

      case 2:
      // Navigate to the notifications page
        Navigator.pushReplacement(
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
                              "NEWS",
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
                          height: 35, onPressed: () {
                            Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => PremiumGamesDayPage()), // NewPage là một trang mới bạn muốn chuyển đến
                        );
                            },),
                      ),
                    ]
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(8, 0, 0, 0),
                  child: Container(
                    alignment: Alignment.topLeft, // Căn trái
                    child: Text(
                      "News",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 28,
                        fontFamily: 'Itim-Regular',
                      ),
                    ),
                  ),
                ),
                Container(
                  height: 540,
                  width: 370,
                  child: ListView(
                    children: [
                      SizedBox(
                        height: 120,
                        width: 370,
                        child: Expanded(
                          child: Container(
                            height: 50,
                            child: ElevatedButton(
                              onPressed: () {},
                              style: ElevatedButton.styleFrom(
                                  padding: EdgeInsets.zero,
                                  minimumSize: Size(0, 0),
                                  backgroundColor:
                                  Colors.transparent,
                                  shape: RoundedRectangleBorder(
                                      borderRadius:
                                      BorderRadius.circular(
                                          40.0))
                                // minimumSize: Size(250, 40),
                              ),
                              child:Row(
                                children: [
                                  Container(
                                    width: 120,
                                    height: 120,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(40), // Đặt bán kính bo góc cho container
                                      color: Colors.grey, // Đặt màu nền cho container (nếu muốn)
                                    ),
                                    child: ClipRRect(
                                        borderRadius: BorderRadius.circular(40), // Đặt bán kính bo góc cho hình ảnh
                                        child:Column(
                                          children: [
                                            Image.asset(
                                              'assets/images/goi.jpg',
                                              width: 120,
                                              height: 120,
                                            ),
                                          ],
                                        )
                                    ),
                                  ),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Column(
                                      children: [
                                        Text(
                                          "THE NEW SCIENCE OF...",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 20,
                                              fontFamily:
                                              'Itim-Regular'),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.fromLTRB(
                                              0, 5, 0, 0),
                                          child: Text(
                                            "As modern schedules, stress, and \ntechnology tax our ability to get a \ngood night's rest, researchers...",
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 15.5,
                                                fontFamily:
                                                'Itim-Regular'),
                                          ),
                                        )
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      SizedBox(
                        height: 120,
                        width: 370,
                        child: Expanded(
                          child: Container(
                            height: 50,
                            child: ElevatedButton(
                              onPressed: () {},
                              style: ElevatedButton.styleFrom(
                                  padding: EdgeInsets.zero,
                                  minimumSize: Size(0, 0),
                                  backgroundColor:
                                  Colors.transparent,
                                  shape: RoundedRectangleBorder(
                                      borderRadius:
                                      BorderRadius.circular(
                                          40.0))
                                // minimumSize: Size(250, 40),
                              ),
                              child:Row(
                                children: [
                                  Container(
                                    width: 120,
                                    height: 120,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(40), // Đặt bán kính bo góc cho container
                                      color: Colors.grey, // Đặt màu nền cho container (nếu muốn)
                                    ),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(40), // Đặt bán kính bo góc cho hình ảnh
                                      child: Image.asset(
                                        'assets/images/den_ngu.jpg',
                                        width: 120,
                                        height: 120,
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Column(
                                      children: [
                                        Text(
                                          "GOOD SLEEP FOR GOO...",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 20,
                                              fontFamily:
                                              'Itim-Regular'),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.fromLTRB(
                                              0, 5, 0, 0),
                                          child: Text(
                                            "Sometimes, the pace of modern \nlife barely gives you time to stop \nand rest. It can make getting...",
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 15.5,
                                                fontFamily:
                                                'Itim-Regular'),
                                          ),
                                        )
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      SizedBox(
                        height: 120,
                        width: 370,
                        child: Expanded(
                          child: Container(
                            height: 50,
                            child: ElevatedButton(
                              onPressed: () {},
                              style: ElevatedButton.styleFrom(
                                  padding: EdgeInsets.zero,
                                  minimumSize: Size(0, 0),
                                  backgroundColor:
                                  Colors.transparent,
                                  shape: RoundedRectangleBorder(
                                      borderRadius:
                                      BorderRadius.circular(
                                          40.0))
                                // minimumSize: Size(250, 40),
                              ),
                              child:Row(
                                children: [
                                  Container(
                                    width: 120,
                                    height: 120,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(40), // Đặt bán kính bo góc cho container
                                      color: Colors.grey, // Đặt màu nền cho container (nếu muốn)
                                    ),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(40), // Đặt bán kính bo góc cho hình ảnh
                                      child: Image.asset(
                                        'assets/images/thaothuc.jpg',
                                        width: 120,
                                        height: 120,
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Column(
                                      children: [
                                        Text(
                                          "THE PANDEMIC MESS...",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 20,
                                              fontFamily:
                                              'Itim-Regular'),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.fromLTRB(
                                              0, 5, 0, 0),
                                          child: Text(
                                            "Is your sleep not what it used to \nbe? Does your mind race when \nyour head hits the pillow?...",
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 15.5,
                                                fontFamily:
                                                'Itim-Regular'),
                                          ),
                                        )
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      SizedBox(
                        height: 120,
                        width: 370,
                        child: Expanded(
                          child: Container(
                            height: 50,
                            child: ElevatedButton(
                              onPressed: () {},
                              style: ElevatedButton.styleFrom(
                                  padding: EdgeInsets.zero,
                                  minimumSize: Size(0, 0),
                                  backgroundColor:
                                  Colors.transparent,
                                  shape: RoundedRectangleBorder(
                                      borderRadius:
                                      BorderRadius.circular(
                                          40.0))
                                // minimumSize: Size(250, 40),
                              ),
                              child:Row(
                                children: [
                                  Container(
                                    width: 120,
                                    height: 120,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(40), // Đặt bán kính bo góc cho container
                                      color: Colors.grey, // Đặt màu nền cho container (nếu muốn)
                                    ),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(40), // Đặt bán kính bo góc cho hình ảnh
                                      child: Image.asset(
                                        'assets/images/giandoan.png',
                                        width: 120,
                                        height: 120,
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Column(
                                      children: [
                                        Text(
                                          "GROWING CONCERN ...",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 20,
                                              fontFamily:
                                              'Itim-Regular'),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.fromLTRB(
                                              0, 5, 0, 0),
                                          child: Text(
                                            "Disrupted sleep has been a \nhallmark of the COVID-19 \npandemic. Psychologists expl...",
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 15.5,
                                                fontFamily:
                                                'Itim-Regular'),
                                          ),
                                        )
                                      ],
                                    ),
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

