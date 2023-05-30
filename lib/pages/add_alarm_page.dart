import 'dart:developer';
import 'dart:isolate';
import 'package:android_alarm_manager_plus/android_alarm_manager_plus.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:exe201/pages/wakeup_page.dart';

import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_ringtone_player/flutter_ringtone_player.dart';
import 'package:provider/provider.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../context/alarm_context.dart';
import '../domain/enums/repeat_enum.dart';
import '../domain/models/models.dart';
import '../service/alarm_service.dart';
import '../widgets/circle_day.dart';
import '../widgets/top_bar.dart';
import 'package:intl/intl.dart';
import 'home_page.dart';
import 'package:exe201/widgets/tooltip.dart';
import 'package:exe201/widgets/light_button.dart';
import 'package:exe201/widgets/dark_button.dart';

class AddAlarm extends StatefulWidget {
  const AddAlarm({Key? key}) : super(key: key);

  @override
  _AddAlarmState createState() => _AddAlarmState();
}

class _AddAlarmState extends State<AddAlarm> {
  late AlarmContext _alarmContext;

  bool _isVibrate = false;
  bool _isDelete = true;
  RepeatEnum _repeat = RepeatEnum.daily;
  late TextEditingController _labelController;

  late TimeOfDay wakeTime = TimeOfDay(hour: 5, minute: 30);
  late TimeOfDay bedTime;
  late TimeOfDay bedTime1;
  late TimeOfDay bedTime2;
  late TimeOfDay bedTime3;
  late TimeOfDay bedTime4;
  late ValueChanged<TimeOfDay> selectTime;
  late bool isMonSelected;
  late bool isTueSelected;
  late bool isWedSelected;
  late bool isThuSelected;
  late bool isFriSelected;
  late bool isSatSelected;
  late bool isSunSelected;

  Map<String, TimeOfDay?> selectedTimes = {};

  DateTime at = DateTime.now().add(const Duration(minutes: 1));

  @override
  void initState() {
    isMonSelected = false;
    isTueSelected = false;
    isWedSelected = false;
    isThuSelected = false;
    isFriSelected = false;
    isSatSelected = false;
    isSunSelected = false;
    super.initState();
    _getTimesSharedPreferences();
    _labelController = TextEditingController();
  }

  void _saveTimes(BuildContext context, int choice) {
    TimeOfDay? bedtime;
    switch (choice) {
      case 1:
        {
          bedtime = bedTime1;
        }
        break;
      case 2:
        {
          bedtime = bedTime2;
        }
        break;
      case 3:
        {
          bedtime = bedTime3;
        }
        break;
      case 4:
        {
          bedtime = bedTime4;
        }
        break;
    }
    selectedTimes = {'bed_time': bedtime, 'wake_time': wakeTime};
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _alarmContext = Provider.of<AlarmContext>(context);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        '/home': (context) => HomePage(),
        // Define other routes
      },
      home: Scaffold(
        backgroundColor: Colors.transparent,
        body: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/background-2.png'),
                  fit: BoxFit.cover,
                  colorFilter: ColorFilter.mode(
                    Color.fromRGBO(35, 56, 99, 0.6),
                    BlendMode.darken,
                  ),
                ),
              ),
            ),
            Column(
              children: [
                TopBar(
                  showArrow: true,
                  title: 'Set wake up time',
                  onBackButtonPressed: () {
                    Navigator.of(context).pop();
                    // Navigator.pop(context);
                  },
                ),
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.all(20.0),
                    child: SingleChildScrollView(
                      child: Column(
                        children: <Widget>[
                          SizedBox(height: 30.0),
                          Text(
                            'Choose Time',
                            style: TextStyle(color: Colors.white),
                          ),
                          GestureDetector(
                            child: Text(
                              wakeTime.format(context),
                              style: TextStyle(
                                fontSize: 60.0,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                            onTap: () {
                              _selectTime(context);
                            },
                          ),
                          //tool tip here

                          SizedBox(height: 30.0),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              CircleDay(
                                day: 'Mon',
                                initialSelected: isMonSelected,
                                onSelectedChanged: (value) {
                                  setState(() {
                                    isMonSelected = value;
                                  });
                                },
                              ),
                              CircleDay(
                                day: 'Tue',
                                initialSelected: isTueSelected,
                                onSelectedChanged: (value) {
                                  setState(() {
                                    isTueSelected = value;
                                  });
                                },
                              ),
                              CircleDay(
                                day: 'Wed',
                                initialSelected: isWedSelected,
                                onSelectedChanged: (value) {
                                  setState(() {
                                    isWedSelected = value;
                                  });
                                },
                              ),
                              CircleDay(
                                day: 'Thu',
                                initialSelected: isThuSelected,
                                onSelectedChanged: (value) {
                                  setState(() {
                                    isThuSelected = value;
                                  });
                                },
                              ),
                              CircleDay(
                                day: 'Fri',
                                initialSelected: isFriSelected,
                                onSelectedChanged: (value) {
                                  setState(() {
                                    isFriSelected = value;
                                  });
                                },
                              ),
                              CircleDay(
                                day: 'Sat',
                                initialSelected: isSatSelected,
                                onSelectedChanged: (value) {
                                  setState(() {
                                    isSatSelected = value;
                                  });
                                },
                              ),
                              CircleDay(
                                day: 'Sun',
                                initialSelected: isSunSelected,
                                onSelectedChanged: (value) {
                                  setState(() {
                                    isSunSelected = value;
                                  });
                                },
                              ),
                            ],
                          ),
                          SizedBox(height: 60.0),
                          SizedBox(
                            height: 2.0,
                            child: Container(
                              color: Colors.white30,
                            ),
                          ),
                          ListTile(
                            leading: Icon(
                              Icons.notifications_none,
                              color: Colors.white,
                            ),
                            title: Text(
                              'Alarm Notification',
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                          SizedBox(
                            height: 2.0,
                            child: Container(
                              color: Colors.white30,
                            ),
                          ),
                          ListTile(
                            leading: Icon(
                              Icons.notifications_none,
                              color: Colors.white,
                            ),
                            title: Text(
                              'Alarm Notification',
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                          SizedBox(
                            height: 2.0,
                            child: Container(
                              color: Colors.white30,
                            ),
                          ),
                          ListTile(
                            leading: Icon(
                              Icons.notifications_none,
                              color: Colors.white,
                            ),
                            title: Text(
                              'Alarm Notification',
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                          SizedBox(
                            height: 2.0,
                            child: Container(
                              color: Colors.white30,
                            ),
                          ),
                          ListTile(
                            leading: Icon(
                              Icons.check_box,
                              color: Colors.white,
                            ),
                            title: Text(
                              'Vibrate',
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                          SizedBox(
                            height: 2.0,
                            child: Container(
                              color: Colors.white30,
                            ),
                          ),
                          SizedBox(height: 60.0),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              LightButton(
                                text: 'CALCULATE',
                                width: 170,
                                height: 50,
                                onPressed: () {
                                  _calculateTimes();
                                  showDialog(
                                    context: context,
                                    builder: (BuildContext context) {
                                      return Dialog(
                                        backgroundColor:
                                            Color.fromARGB(150, 53, 70, 131),
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),
                                        child: Container(
                                          width: 600,
                                          height: 500,
                                          child: Column(
                                            children: [
                                              Expanded(
                                                flex: 1,
                                                child: InkWell(
                                                  onTap: () {
                                                    _saveTimes(context, 1);
                                                    saveTimesSharedPreferences();
                                                    //code here

                                                    Navigator.pop(context);
                                                    Navigator.pop(
                                                        context, selectedTimes);
                                                  },
                                                  child: Ink(
                                                    decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8),
                                                      color: Color.fromARGB(
                                                          150, 53, 70, 131),
                                                    ),
                                                    padding:
                                                        EdgeInsets.symmetric(
                                                            horizontal: 8,
                                                            vertical: 16),
                                                    child: Row(
                                                      children: [
                                                        SizedBox(width: 16),
                                                        Text(
                                                          '01',
                                                          style: TextStyle(
                                                            fontWeight:
                                                                FontWeight.w700,
                                                            fontSize: 20,
                                                            color:
                                                                Color.fromARGB(
                                                                    255,
                                                                    198,
                                                                    167,
                                                                    132),
                                                          ),
                                                        ),
                                                        SizedBox(width: 16),
                                                        Expanded(
                                                          child: Text(
                                                            '${bedTime1.formatOrEmpty(context)} for Six Cycles - Nine Hours of Sleep.',
                                                            textAlign:
                                                                TextAlign.left,
                                                            style: TextStyle(
                                                              color:
                                                                  Colors.white,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w700,
                                                              fontSize: 20,
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              Divider(
                                                color: Color.fromARGB(
                                                    192, 37, 34, 70),
                                                height: 1,
                                                thickness: 2,
                                              ),
                                              Expanded(
                                                flex: 1,
                                                child: InkWell(
                                                  onTap: () async {
                                                    _saveTimes(context, 2);
                                                    saveTimesSharedPreferences();
                                                    // _scheduleAlarm();
                                                    _addAlarm();
                                                    // Provider.of<AlarmContext>(context, listen: false).addAlarms(AlarmsModel(at: at));
                                                    Navigator.pop(context);
                                                    Navigator.pop(
                                                        context, selectedTimes);
                                                  },
                                                  child: Ink(
                                                    decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8),
                                                      color: Color.fromARGB(
                                                          150, 53, 70, 131),
                                                    ),
                                                    padding:
                                                        EdgeInsets.symmetric(
                                                            horizontal: 8,
                                                            vertical: 16),
                                                    child: Row(
                                                      children: [
                                                        SizedBox(width: 16),
                                                        Text(
                                                          '02',
                                                          style: TextStyle(
                                                            fontWeight:
                                                                FontWeight.w700,
                                                            fontSize: 20,
                                                            color:
                                                                Color.fromARGB(
                                                                    255,
                                                                    198,
                                                                    167,
                                                                    132),
                                                          ),
                                                        ),
                                                        SizedBox(width: 16),
                                                        Expanded(
                                                          child: Text(
                                                            '${bedTime2.formatOrEmpty(context)} for Five Cycles - Seven and a Half Hours of Sleep.',
                                                            textAlign:
                                                                TextAlign.left,
                                                            style: TextStyle(
                                                              color:
                                                                  Colors.white,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w700,
                                                              fontSize: 20,
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              Divider(
                                                color: Color.fromARGB(
                                                    192, 37, 34, 70),
                                                height: 1,
                                                thickness: 2,
                                              ),
                                              Expanded(
                                                flex: 1,
                                                child: InkWell(
                                                  onTap: () {
                                                    _saveTimes(context, 3);
                                                    saveTimesSharedPreferences();
                                                    Navigator.pop(context);
                                                    Navigator.pop(
                                                        context, selectedTimes);
                                                  },
                                                  child: Ink(
                                                    decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8),
                                                      color: Color.fromARGB(
                                                          150, 53, 70, 131),
                                                    ),
                                                    padding:
                                                        EdgeInsets.symmetric(
                                                            horizontal: 8,
                                                            vertical: 16),
                                                    child: Row(
                                                      children: [
                                                        SizedBox(width: 16),
                                                        Text(
                                                          '03',
                                                          style: TextStyle(
                                                            fontWeight:
                                                                FontWeight.w700,
                                                            fontSize: 20,
                                                            color:
                                                                Color.fromARGB(
                                                                    255,
                                                                    198,
                                                                    167,
                                                                    132),
                                                          ),
                                                        ),
                                                        SizedBox(width: 16),
                                                        Expanded(
                                                          child: Text(
                                                            '${bedTime3.formatOrEmpty(context)} for Four Cycles - Six Hours of Sleep.',
                                                            textAlign:
                                                                TextAlign.left,
                                                            style: TextStyle(
                                                              color:
                                                                  Colors.white,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w700,
                                                              fontSize: 20,
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              Divider(
                                                color: Color.fromARGB(
                                                    192, 37, 34, 70),
                                                height: 1,
                                                thickness: 2,
                                              ),
                                              Expanded(
                                                flex: 1,
                                                child: InkWell(
                                                  onTap: () {
                                                    _saveTimes(context, 4);
                                                    saveTimesSharedPreferences();
                                                    Navigator.pop(context);
                                                    Navigator.pop(
                                                        context, selectedTimes);
                                                  },
                                                  child: Ink(
                                                    decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8),
                                                      color: Color.fromARGB(
                                                          150, 53, 70, 131),
                                                    ),
                                                    padding:
                                                        EdgeInsets.symmetric(
                                                            horizontal: 8,
                                                            vertical: 16),
                                                    child: Row(
                                                      children: [
                                                        SizedBox(width: 16),
                                                        Text(
                                                          '04',
                                                          style: TextStyle(
                                                            fontWeight:
                                                                FontWeight.w700,
                                                            fontSize: 20,
                                                            color:
                                                                Color.fromARGB(
                                                                    255,
                                                                    198,
                                                                    167,
                                                                    132),
                                                          ),
                                                        ),
                                                        SizedBox(width: 16),
                                                        Expanded(
                                                          child: Text(
                                                            '${bedTime4.formatOrEmpty(context)} for Three Cycles - Four and a Half Hours of Sleep',
                                                            textAlign:
                                                                TextAlign.left,
                                                            style: TextStyle(
                                                              color:
                                                                  Colors.white,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w700,
                                                              fontSize: 20,
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      );
                                    },
                                  );
                                },
                              ),
                              SizedBox(width: 8),

                              DarkButton(
                                text: 'SAVE',
                                width: 170,
                                height: 50,
                                onPressed: () {},
                              ),
                              //
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Future<void> saveTimesSharedPreferences() async {
    if (selectedTimes['wake_time'] != null &&
        selectedTimes['bed_time'] != null) {
      final prefs = await SharedPreferences.getInstance();

      // Convert TimeOfDay objects to String representation
      final wakeTimeString =
          "${selectedTimes['wake_time']?.hour.toString()}:${selectedTimes['wake_time']?.minute.toString()}";
      final bedTimeString =
          "${selectedTimes['bed_time']?.hour.toString()}:${selectedTimes['bed_time']?.minute.toString()}";

      log("Saving to SF");
      log('wakeTime $wakeTimeString');
      log('bedTimeString $bedTimeString');

      // Save the TimeOfDay strings to SharedPreferences
      await prefs.setString('wake_time', wakeTimeString!);
      await prefs.setString('bed_time', bedTimeString!);
    }
  }

  Future<void> _selectTime(BuildContext context) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: wakeTime,
    );
    if (picked != null) {
      setState(() {
        wakeTime = picked;
      });
    }
  }

  void _calculateTimes() {
    int cycle_length = 90;
    bedTime1 = wakeTime.minusMinute(cycle_length * 6);
    bedTime2 = wakeTime.minusMinute(cycle_length * 5);
    bedTime3 = wakeTime.minusMinute(cycle_length * 4);
    bedTime4 = wakeTime.minusMinute(cycle_length * 3);
  }

  Future<void> _getTimesSharedPreferences() async {
    final prefs = await SharedPreferences.getInstance();

    // Retrieve the TimeOfDay strings from SharedPreferences
    final wakeTimeString = prefs.getString('wake_time');
    final bedTimeString = prefs.getString('bed_time');

    // Convert the strings back to TimeOfDay objects
    try {
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
      setState(() {});
    } on Exception catch (e) {
      wakeTime = TimeOfDay(hour: 6, minute: 0);
      setState(() {});
    }
  }

  void _scheduleAlarm() async {
    // DateTime now = DateTime.now();
    // DateTime alarmTime = DateTime(now.year, now.month, now.day, 7);

    // await AndroidAlarmManager.periodic(
    //     const Duration(minutes: 1), 0, printHello);
    await AndroidAlarmManager.periodic(
      const Duration(minutes: 1),
      0,
      printHello,
      exact: true,
      wakeup: true,
    );

    log('alarm set ' + DateTime.now().toString());
  }

  Future<void> _playRingtone() async {
    await FlutterRingtonePlayer.play(
      fromAsset: "assets/sound/wakeup-alarm.mp3",
      looping: true, // Android only - API >= 28
      volume: 0.1, // Android only - API >= 28
      asAlarm: true, // Android only - all APIs
    );
  }

  static printHello() {
// Handle alarm triggered here
    AudioPlayer audioPlayer = AudioPlayer();
// AudioCache audioCache = AudioCache();

    audioPlayer.play(UrlSource(
        'https://d6cp9b00-a.akamaihd.net/downloads/ringtones/files/mp3/wakeup-alarm-tone-21497.mp3'));
    log("printHello called");

    final DateTime now = DateTime.now();
    final int isolateId = Isolate.current.hashCode;
    print("[$now] Hello, world! isolate=${isolateId} function='$printHello'");
  }

  void _addAlarm() {
    TimeOfDay? wakeTime = selectedTimes['wake_time'];
    log('waketime $wakeTime');
    final now = DateTime.now();
    at = DateTime(now.year, now.month, now.day, wakeTime!.hour, wakeTime!.minute);
    if (DateTime.now().hour > at.hour) {
      at = at.add(const Duration(days: 1));
    } else if (DateTime.now().hour == at.hour &&
        DateTime.now().minute >= at.minute) {
      at = at.add(const Duration(days: 1));
    }
    final AlarmsModel alarm = AlarmsModel(
      at: at,
      repeat: _repeat,
      vibrate: _isVibrate,
      label: _labelController.text.isNotEmpty ? _labelController.text : null,
      deleteAfterDone: _isDelete,
    );
    final bool itExists = _alarmContext.isAlarmAlreadyExists(alarm);

    if (!itExists) {
      _alarmContext.addAlarms(alarm);
      // return Navigator.of(context).pop();
    }
    // showDialog(
    //   context: context,
    //   builder: (BuildContext context) => AlertDialog(
    //     title: const Text('Failed to create an alarm'),
    //     content: const Text(
    //         'There is a alarm already assigned to this  particular time'),
    //     actions: <Widget>[
    //       ElevatedButton(
    //         onPressed: () => Navigator.of(context)
    //           ..pop()
    //           ..pop(),
    //         child: const Text('OK I got it !'),
    //       )
    //     ],
    //   ),
    // );
  }
}

extension TimeOfDayExtension on TimeOfDay {
  TimeOfDay minusMinute(int minute) {
    int minuteNew = this.minute;
    int hourSubtracted = (minute / 60).round();
    int hourNew = hour - hourSubtracted;
    if (minute % 60 != 0) {
      minuteNew = 30 + this.minute;
      if (minuteNew >= 60) {
        minuteNew = minuteNew % 60;
        hourNew += 1;
      }
    }
    if (hourNew < 0) {
      hourNew = 24 + hourNew;
    }
    if (hourNew >= 24) {
      hourNew = 0;
    }
    return replacing(hour: hourNew, minute: minuteNew);
  }

  String formatOrEmpty(BuildContext context) {
    return "${hour.toString().padLeft(2, '0')}:${minute.toString().padLeft(2, '0')}";
  }
}

// @pragma('vm:entry-point')
// printHello() {
// // Handle alarm triggered here
//   AudioPlayer audioPlayer = AudioPlayer();
// // AudioCache audioCache = AudioCache();
//
//   audioPlayer.play(UrlSource(
//       'https://d6cp9b00-a.akamaihd.net/downloads/ringtones/files/mp3/wakeup-alarm-tone-21497.mp3'));
//
// // Navigator.pushNamedAndRemoveUntil(context, '/wakeup', (_) => false);
//
//   final DateTime now = DateTime.now();
//   final int isolateId = Isolate.current.hashCode;
//   print("[$now] Hello, world! isolate=${isolateId} function='$printHello'");
// }

void _navigateToScreen(BuildContext context, String route) {
  WidgetsBinding.instance.addPostFrameCallback((_) {
    Navigator.of(context).pushReplacementNamed(route);
  });
}
