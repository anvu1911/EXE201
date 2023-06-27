import 'package:exe201/pages/home_page.dart';
import 'package:exe201/pages/premium_games_page.dart';
import 'package:exe201/pages/premium_sounds_page.dart';
import 'package:exe201/pages/premium_weather_page.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
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

  Future<void> _launchURL(String url) async {
    final Uri uri = Uri.parse("https://$url");
    try {
      await launch(uri.toString());
    } catch (e) {
      print("Failed to launch URL: $e");
      throw "Can not launch URL";
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
          title: 'Premium Features',
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
                            MaterialPageRoute(builder: (context) => PremiumGamesPage()), // NewPage là một trang mới bạn muốn chuyển đến
                          );
                              },),
                        ),
                      ]
                  ),
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
                    padding: EdgeInsets.only(top: 0),
                    children: [
                      SizedBox(
                        height: 120,
                        width: 370,
                        child: Expanded(
                          child: Container(
                            height: 50,
                            child: ElevatedButton(
                              onPressed: () {
                                // add link here
                                _launchURL(
                                    "www.facebook.com/permalink.php?story_fbid=pfbid02etv4ZKQQnz3vb7mCq9Ng35dSbeeKm7w5P54nd9xMV8zD7ZYgkTK4pb77Hm7N8sz4l&id=100092655316466");
                              },
                              style: ElevatedButton.styleFrom(
                                  padding: EdgeInsets.zero,
                                  minimumSize: Size(0, 0),
                                  backgroundColor: Colors.transparent,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(40.0))
                                  // minimumSize: Size(250, 40),
                                  ),
                              child: Row(
                                children: [
                                  Container(
                                    width: 120,
                                    height: 120,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(
                                          40), // Đặt bán kính bo góc cho container
                                      color: Colors
                                          .grey, // Đặt màu nền cho container (nếu muốn)
                                    ),
                                    child: ClipRRect(
                                        borderRadius: BorderRadius.circular(
                                            40), // Đặt bán kính bo góc cho hình ảnh
                                        child: Column(
                                          children: [
                                            Image.asset(
                                              'assets/images/shleep_ngu_ngon.jpg',
                                              width: 120,
                                              height: 120,
                                            ),
                                          ],
                                        )),
                                  ),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Column(
                                      children: [
                                        Text(
                                          "Shleep 🐑🐑🐑",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 20,
                                              fontFamily: 'Itim-Regular'),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.fromLTRB(
                                              0, 5, 0, 0),
                                          child: Text(
                                            "Shleep chúc các bạn một buổi tối\ncuối tuần thật ấm êm\nvà ngủ ngon nhé :3",
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 15.5,
                                                fontFamily: 'Itim-Regular'),
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
                              onPressed: () {
                                _launchURL(
                                    "www.facebook.com/permalink.php?story_fbid=pfbid0FoEfAQyDv3DQjs5Kukrny7N7pRKdQAQQSKkBu6SRmqcNkMjkssBpdgGV8gwrC3Gsl&id=100092655316466");
                              }, // add link here
                              style: ElevatedButton.styleFrom(
                                  padding: EdgeInsets.zero,
                                  minimumSize: Size(0, 0),
                                  backgroundColor: Colors.transparent,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(40.0))
                                  // minimumSize: Size(250, 40),
                                  ),
                              child: Row(
                                children: [
                                  Container(
                                    width: 120,
                                    height: 120,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(
                                          40), // Đặt bán kính bo góc cho container
                                      color: Colors
                                          .grey, // Đặt màu nền cho container (nếu muốn)
                                    ),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(
                                          40), // Đặt bán kính bo góc cho hình ảnh
                                      child: Image.asset(
                                        'assets/images/sleep_2.jpg',
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
                                          "Shleep 🐑🐑🐑",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 20,
                                              fontFamily: 'Itim-Regular'),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.fromLTRB(
                                              0, 5, 0, 0),
                                          child: Text(
                                            "Giấc ngủlà thứ vô cùng\nquan trọng và không thể\nthiếu với tất cả mọi người.",
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 15.5,
                                                fontFamily: 'Itim-Regular'),
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
                              onPressed: () {
                                _launchURL(
                                    "www.facebook.com/permalink.php?story_fbid=pfbid0wk27R3ZGBkAvuTzw1DfJoySvXtF9KdEs5gfnbWDV9NSeyz7MpioF2F7nnXZdTLhvl&id=100092655316466");
                              }, // add link here
                              style: ElevatedButton.styleFrom(
                                  padding: EdgeInsets.zero,
                                  minimumSize: Size(0, 0),
                                  backgroundColor: Colors.transparent,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(40.0))
                                  // minimumSize: Size(250, 40),
                                  ),
                              child: Row(
                                children: [
                                  Container(
                                    width: 120,
                                    height: 120,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(
                                          40), // Đặt bán kính bo góc cho container
                                      color: Colors
                                          .grey, // Đặt màu nền cho container (nếu muốn)
                                    ),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(
                                          40), // Đặt bán kính bo góc cho hình ảnh
                                      child: Image.asset(
                                        'assets/images/sleep_3.jpg',
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
                                          "Shleep 🐑🐑🐑",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 20,
                                              fontFamily: 'Itim-Regular'),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.fromLTRB(
                                              0, 5, 0, 0),
                                          child: Text(
                                            "Những mẹo cực giản đơn\nđể đưa bạnvào giấc ngủ\ncùng Shleep :3",
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 15.5,
                                                fontFamily: 'Itim-Regular'),
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
                              onPressed: () {
                                _launchURL(
                                    "www.facebook.com/permalink.php?story_fbid=pfbid08yTZswoyWBzzUMTUmGRiCdJCUiJSqQqcVwoWWEpSdDy2Qykog4RveQfAHitQis7Ql&id=100092655316466");
                              }, // add link here
                              style: ElevatedButton.styleFrom(
                                  padding: EdgeInsets.zero,
                                  minimumSize: Size(0, 0),
                                  backgroundColor: Colors.transparent,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(40.0))
                                  // minimumSize: Size(250, 40),
                                  ),
                              child: Row(
                                children: [
                                  Container(
                                    width: 120,
                                    height: 120,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(
                                          40), // Đặt bán kính bo góc cho container
                                      color: Colors
                                          .grey, // Đặt màu nền cho container (nếu muốn)
                                    ),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(
                                          40), // Đặt bán kính bo góc cho hình ảnh
                                      child: Image.asset(
                                        'assets/images/sleep_4.jpg',
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
                                          "Shleep 🐑🐑🐑",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 20,
                                              fontFamily: 'Itim-Regular'),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.fromLTRB(
                                              0, 5, 0, 0),
                                          child: Text(
                                            "Những mẹo cực giản đơn\nđể đưa bạnvào giấc ngủ\ncùng Shleep :3 (p2)",
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 15.5,
                                                fontFamily: 'Itim-Regular'),
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

