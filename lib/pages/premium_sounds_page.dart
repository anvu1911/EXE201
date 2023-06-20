import 'package:exe201/pages/home_page.dart';
import 'package:exe201/pages/premium_games_page.dart';
import 'package:exe201/pages/premium_news_page.dart';
import 'package:exe201/pages/premium_weather_page.dart';
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
                            "SOUNDS",
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
                        height: 35, onPressed: () { Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => PremiumGamesPage()), // NewPage là một trang mới bạn muốn chuyển đến
                      );  },),
                    ),
                  ]
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(8, 0, 0, 0),
                  child: Container(
                    alignment: Alignment.topLeft, // Căn trái
                    child: Text(
                      "Shleep's Collection",
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
                                                     'assets/images/piano.png',
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
                                                 "Julio Iglesias’s Collection",
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
                                                   "The most popular Latin singer of\n the late 20th century and beyond,\n a smooth crooner with roma...",
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
                                               'assets/images/bedti_melody.jfif',
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
                                                 "Bedtime Melodies",
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
                                                   "Soothing Bedtime Melody - Slient \n Stream The often monotonous \n repetition of melody can aid ...",
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
                                               'assets/images/bloom.png',
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
                                                 "Blooms Music",
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
                                                   "Music For Plants & Gardens Full \n Spectrum Frequencies",
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

