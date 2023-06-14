import 'package:exe201/pages/home_page.dart';

import 'package:exe201/pages/premium_weather_page.dart';
import 'package:exe201/widgets/chart.dart';
import 'package:exe201/widgets/percentage_rectangle.dart';
import 'package:exe201/widgets/show_box.dart';
import 'package:exe201/widgets/sleep_quality_linechart.dart';
import 'package:flutter/material.dart';
import '../widgets/bottom_navigation_bar.dart';
import '../widgets/top_bar.dart';

class ChartPage extends StatefulWidget {
  const ChartPage({super.key});

  @override
  _ChartPageState createState() {
    return _ChartPageState();
  }
}

class _ChartPageState extends State<ChartPage> {
  int _selectedIndex = 1;

  // bool _showButton = true;

  // void _toggleButton() {
  //   setState(() {
  //     _showButton = !_showButton;
  //   });
  // }

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
                ColoredRectangle(
                    width: 360,
                    height: 40,
                    text: 'Time Asleep',
                    padding: EdgeInsets.only(top: 90)),
                SleepChart(
                  daysOfWeek: ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'],
                  sleepHours: [6, 5.25, 4, 6.75, 3.75, 3, 8.25],
                  padding: EdgeInsets.only(top: 10),
                ),
                ColoredRectangle(
                    width: 360,
                    height: 40,
                    text: 'Sleep Goal',
                    padding: EdgeInsets.only(top: 20)),
                Padding(
                  padding: const EdgeInsets.only(top: 10.0),
                  child: PercentageRectangle(
                    bestPercentage: '80',
                    worstPercentage: '40',
                    averagePercentage: '70',
                  ),
                ),
                ColoredRectangle(
                    width: 360,
                    height: 40,
                    text: 'Sleep Quality (%)',
                    padding: EdgeInsets.only(top: 10)),
                Padding(
                  padding: const EdgeInsets.only(top: 10.0),
                  child: Container(
                    width: 360,
                    height: 200,
                    child: LineChartWidget(
                        sleepQuality: [80, 70, 60, 90, 50, 40, 100]),
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
