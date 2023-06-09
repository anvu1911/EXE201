import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../widgets/light_button.dart';
import '../widgets/bottom_navigation_bar.dart';
import '../widgets/top_bar.dart';
import '../widgets/dark_button.dart';
import '../widgets/clock_view.dart';
import '../widgets/current_datetime.dart';
import 'start_sleeping_page.dart';
import 'add_alarm_page.dart';
import 'dart:developer';
import 'chart_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _HomePageState createState() {
    return _HomePageState();
  }
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;
  TimeOfDay? bedTime = const TimeOfDay(hour: 10, minute: 0);
  TimeOfDay? wakeTime = const TimeOfDay(hour: 5, minute: 30);

  Future<void> getTimesSharedPreferences() async {
    final prefs = await SharedPreferences.getInstance();

    // Retrieve the TimeOfDay strings from SharedPreferences
    final wakeTimeString = prefs.getString('wake_time');
    final bedTimeString = prefs.getString('bed_time');
    log("Getting times from SF");
    log('wakeTime: $wakeTimeString');
    log('bedTime: $bedTimeString');
    // Convert the strings back to TimeOfDay objects
    if (wakeTimeString != null) {
      wakeTime = TimeOfDay(
          hour: int.parse(wakeTimeString.split(":")[0]),
          minute: int.parse(wakeTimeString.split(":")[1]));
    }
    if (bedTimeString != null) {
      bedTime = TimeOfDay(
          hour: int.parse(bedTimeString.split(":")[0]),
          minute: int.parse(bedTimeString.split(":")[1]));
    }

    // Trigger a rebuild of the widget tree
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    getTimesSharedPreferences();
  }

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
        Navigator.pushReplacementNamed(context, '#');
        break;
      default:
        // Do nothing
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: TopBar(
        showArrow: false,
        title: 'Alarm',
        onBackButtonPressed: () {
          //no pop in homepage
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
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 44.0),
                child: Container(
                  alignment: Alignment.center,
                  child: ClockView(),
                ), //hello
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 44.0),
                // child: Text(
                //   getCurrentDateTime(),
                //   style: TextStyle(
                //     color: Colors.white,
                //     fontSize: 40,
                //     fontWeight: FontWeight.bold,
                //   ),
                // ),
                child: CurrentDateTimeWidget(),
              ),
              Padding(
                  padding: const EdgeInsets.only(bottom: 8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Stack(
                        clipBehavior:
                            Clip.none, // add this line to remove clipping
                        children: [
                          LightButton(
                            // text: 'Bedtime\n 10:20 PM',
                            text: 'Bedtime\n ${bedTime.formatOrEmpty(context)}',
                            onPressed: () {},
                            width: 190,
                            height: 60,
                          ),
                          Positioned(
                            top: -20,
                            right: 0,
                            left: 0,
                            child: Container(
                              width: 30,
                              height: 30,
                              decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                color: Color.fromRGBO(49, 27, 107, 1),
                                image: DecorationImage(
                                  image: AssetImage('assets/images/bedtime.png'),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(width: 10),
                      Stack(
                        clipBehavior:
                            Clip.none, // add this line to remove clipping
                        children: [
                          LightButton(
                            // text: 'Wakeup \n 10:20 PM',
                            text:
                                'Wakeup \n ${wakeTime.formatOrEmpty(context)}',
                            onPressed: () {},
                            width: 190,
                            height: 60,
                          ),
                          Positioned(
                            top: -20,
                            right: 0,
                            left: 0,
                            child: Container(
                              width: 30,
                              height: 30,
                              decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                color: Color.fromRGBO(49, 27, 107, 1),
                                image: DecorationImage(
                                  image: AssetImage('assets/images/waketime.png'),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  )),
              Padding(
                  padding: const EdgeInsets.only(bottom: 8.0),
                  child: DarkButton(
                      text: 'START SLEEP TRACKING',
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const StartSleepingPage()),
                        );
                      },
                      width: 400,
                      height: 60)),
              Padding(
                  padding: const EdgeInsets.only(bottom: 24.0),
                  child: DarkButton(
                      text: 'SET ALARM',
                      onPressed: () async {
                        final selectedTimes =
                            await Navigator.push<Map<String, TimeOfDay?>>(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const AddAlarm()),
                        );

                        if (selectedTimes != null) {
                          setState(() {
                            wakeTime = selectedTimes['wake_time'];
                            bedTime = selectedTimes['bed_time'];
                          });
                        }
                      },
                      width: 400,
                      height: 40))
            ],
          ),
        ),
      ),
      bottomNavigationBar: MyBottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}

extension TimeOfDayExtension on TimeOfDay? {
  String formatOrEmpty(BuildContext context) {
    if (this != null) {
      return "${this?.hour.toString().padLeft(2, '0')}:${this?.minute.toString().padLeft(2, '0')}";
    }
    return '';
  }
}
