import 'package:exe201/pages/home_page.dart';
import 'package:exe201/pages/start_sleeping_page.dart';
import 'package:exe201/widgets/dark_button.dart';
import 'package:flutter/material.dart';
import '../widgets/light_button.dart';
import '../widgets/bottom_navigation_bar.dart';
import '../widgets/top_bar.dart';
import '../widgets/swipe_up_button.dart';
import '../widgets/current_datetime_v2.dart';
import 'package:swipeable_button_view/swipeable_button_view.dart';

class WakeUpPage extends StatefulWidget {
  const WakeUpPage({super.key});

  @override
  _WakeUpPageState createState() {
    return _WakeUpPageState();
  }
}

class _WakeUpPageState extends State<WakeUpPage> {
  int _selectedIndex = 0;

  bool _showButton = true;

  void _toggleButton() {
    setState(() {
      _showButton = !_showButton;
    });
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    switch (index) {
      case 0:
        break;
      case 1:
        // Navigate to the settings page
        Navigator.pushReplacementNamed(context, 'clock_view');
        break;
      case 2:
        // Navigate to the notifications page
        Navigator.pushReplacementNamed(context, '#');
        break;
      default:
        // Do nothing
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Sleeping app',
      home: Scaffold(
        extendBodyBehindAppBar: true,
        appBar: TopBar(
          showArrow: true,
          title: 'Wake Up',
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
                  padding: const EdgeInsets.only(top: 111.0),
                  child: Center(
                    child: Text(
                      'Good Morning\n and have a nice day',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 25,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 41.0),
                  child: Container(
                    alignment: Alignment.center,
                    child: Image.asset(
                      'assets/images/wake-up.png',
                      width: 250,
                      height: 250,
                    ),
                  ),

                  //icon
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 40.0),
                  child: Text(
                    'You have slept',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 24,
                      color: Colors.white,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10.0),
                  child: Text(
                    'XX:XX:XX',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 36,
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 80.0),
                  child: DarkButton(
                      text: 'Exit',
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const HomePage()),
                        );
                      },
                      width: 380,
                      height: 40),
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
