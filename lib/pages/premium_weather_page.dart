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
  List<Item> _data = generateItems();
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
                Expanded (
                    child:  ListView.builder(
                      itemCount: _data.length,
                      itemBuilder: (context, index) {
                        Item item = _data[index];
                        return ExpansionPanelList(

                          expansionCallback: (int panelIndex, bool isExpanded) {
                            setState(() {
                              _data.forEach((item) {
                                item.isExpanded = false;
                              });
                              item.isExpanded = !isExpanded;
                            });
                          },
                          children: [
                            ExpansionPanel(
                              headerBuilder: (BuildContext context, bool isExpanded) {
                                return ListTile(
                                  tileColor:const Color.fromARGB(
                                      156, 30, 90, 137),
                                  title: Container(
                                    child: Text(
                                      item.headerValue,
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontFamily:
                                        'Itim-Regular',
                                          fontSize: 28,
                                          fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                );
                              },
                              body: Container(
                                child: _buildContentForDay(item.headerValue), // Call a method to build content based on the day
                              color: Colors.cyan,
                              ),
                              isExpanded: item.isExpanded,
                            ),
                          ],
                        );
                      },
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
class Item {
  Item({
    required this.headerValue,
    this.isExpanded = false,
  });

  String headerValue;
  bool isExpanded;
}
List<Item> generateItems() {
  List<String> daysOfWeek = ['Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday', 'Sunday'];
  return daysOfWeek.map((day) {
    return Item(
      headerValue: day,
    );
  }).toList();
}
Widget _buildContentForDay(String day) {
  // Return different content based on the day
  switch (day) {
    case 'Monday':
      return Container(
          color: Color.fromARGB(186, 20, 44, 121),
          child: Row(
            children: [
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
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Ho Chi Minh city",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 25,
                      fontFamily: 'Itim-Regular',
                    ),
                  ),
                  SizedBox(height: 5),
                  Text(
                    "34°C",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 25,
                      fontFamily: 'Itim-Regular',
                    ),
                  ),
                ],
              ),
              SizedBox(
                width: 15,
              ),
              Column(
                children: [
                  Text(
                    '19 Jun',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontFamily: 'Itim-Regular',
                    ),
                  ),
                  SizedBox(height: 10),

                  Text(
                    '2023',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontFamily: 'Itim-Regular',
                    ),
                  )
                ],
              )
            ],
          ),
        );
    case 'Tuesday':
      return Container(
        color: Color.fromARGB(186, 20, 44, 121),
        child: Row(
          children: [
            Column(
              children: [
                Image.asset(
                  'assets/images/muaset.png',
                  width: 110,
                  height: 110,
                ),
                Text("Rain with \n lightning",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontFamily: 'Itim-Regular',
                  ),
                ),
              ],

            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Ho Chi Minh city",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 25,
                    fontFamily: 'Itim-Regular',
                  ),
                ),
                SizedBox(height: 5),
                Text(
                  "34°C",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 25,
                    fontFamily: 'Itim-Regular',
                  ),
                ),
              ],
            ),
            SizedBox(
              width: 15,
            ),
            Column(
              children: [
                Text(
                  '20 Jun',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontFamily: 'Itim-Regular',
                  ),
                ),
                SizedBox(height: 10),

                Text(
                  '2023',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontFamily: 'Itim-Regular',
                  ),
                )
              ],
            )
          ],
        ),
      );
    case 'Wednesday':
      return Container(

        color: Color.fromARGB(186, 20, 44, 121),
        child: Row(
          children: [
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
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Ho Chi Minh city",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 25,
                    fontFamily: 'Itim-Regular',
                  ),
                ),
                SizedBox(height: 5),
                Text(
                  "31°C",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 25,
                    fontFamily: 'Itim-Regular',
                  ),
                ),
              ],
            ),
            SizedBox(
              width: 15,
            ),
            Column(
              children: [
                Text(
                  '21 Jun',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontFamily: 'Itim-Regular',
                  ),
                ),
                SizedBox(height: 10),

                Text(
                  '2023',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontFamily: 'Itim-Regular',
                  ),
                )
              ],
            )
          ],
        ),
      );
    case 'Thursday':
      return Container(

        color: Color.fromARGB(186, 20, 44, 121),
        child: Row(
          children: [
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
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Ho Chi Minh city",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 25,
                    fontFamily: 'Itim-Regular',
                  ),
                ),
                SizedBox(height: 5),
                Text(
                  "30°C",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 25,
                    fontFamily: 'Itim-Regular',
                  ),
                ),
              ],
            ),
            SizedBox(
              width: 15,
            ),
            Column(
              children: [
                Text(
                  '22 Jun',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontFamily: 'Itim-Regular',
                  ),
                ),
                SizedBox(height: 10),

                Text(
                  '2023',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontFamily: 'Itim-Regular',
                  ),
                )
              ],
            )
          ],
        ),
      );
    case 'Friday':
      return Container(

        color: Color.fromARGB(186, 20, 44, 121),
        child: Row(
          children: [
            Column(
              children: [
                Image.asset(
                  'assets/images/muaset.png',
                  width: 110,
                  height: 110,
                ),
                Text("Rain with \n lightning",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontFamily: 'Itim-Regular',
                  ),
                ),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Ho Chi Minh city",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 25,
                    fontFamily: 'Itim-Regular',
                  ),
                ),
                SizedBox(height: 5),
                Text(
                  "33°C",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 25,
                    fontFamily: 'Itim-Regular',
                  ),
                ),
              ],
            ),
            SizedBox(
              width: 15,
            ),
            Column(
              children: [
                Text(
                  '23 Jun',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontFamily: 'Itim-Regular',
                  ),
                ),
                SizedBox(height: 10),

                Text(
                  '2023',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontFamily: 'Itim-Regular',
                  ),
                )
              ],
            )
          ],
        ),
      );
    case 'Saturday':
      return Container(

        color: Color.fromARGB(186, 20, 44, 121),
        child: Row(
          children: [
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
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Ho Chi Minh city",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 25,
                    fontFamily: 'Itim-Regular',
                  ),
                ),
                SizedBox(height: 5),
                Text(
                  "29°C",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 25,
                    fontFamily: 'Itim-Regular',
                  ),
                ),
              ],
            ),
            SizedBox(
              width: 15,
            ),
            Column(
              children: [
                Text(
                  '24 Jun',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontFamily: 'Itim-Regular',
                  ),
                ),
                SizedBox(height: 10),

                Text(
                  '2023',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontFamily: 'Itim-Regular',
                  ),
                )
              ],
            )
          ],
        ),
      );
    case 'Sunday':
      return Container(

        color: Color.fromARGB(186, 20, 44, 121),
        child: Row(
          children: [
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
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Ho Chi Minh city",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 25,
                    fontFamily: 'Itim-Regular',
                  ),
                ),
                SizedBox(height: 5),
                Text(
                  "32°C",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 25,
                    fontFamily: 'Itim-Regular',
                  ),
                ),
              ],
            ),
            SizedBox(
              width: 15,
            ),
            Column(
              children: [
                Text(
                  '25 Jun',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontFamily: 'Itim-Regular',
                  ),
                ),
                SizedBox(height: 10),

                Text(
                  '2023',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontFamily: 'Itim-Regular',
                  ),
                )
              ],
            )
          ],
        ),
      );
  // Add cases for other days
    default:
      return Container();
  }
}
