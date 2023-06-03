import 'dart:developer';
import 'package:exe201/domain/enums/enums.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../context/alarm_context.dart';
import '../domain/models/models.dart';
import '../widgets/circle_day.dart';
import '../widgets/top_bar.dart';
import 'home_page.dart';
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
  RepeatEnum _repeat = RepeatEnum.once;
  late TextEditingController _labelController;

  late TimeOfDay wakeTime = const TimeOfDay(hour: 5, minute: 30);
  late TimeOfDay bedTime;
  late TimeOfDay bedTime1 = const TimeOfDay(hour: 0, minute: 0);
  late TimeOfDay bedTime2 = const TimeOfDay(hour: 0, minute: 0);
  late TimeOfDay bedTime3 = const TimeOfDay(hour: 0, minute: 0);
  late TimeOfDay bedTime4 = const TimeOfDay(hour: 0, minute: 0);
  late ValueChanged<TimeOfDay> selectTime;
  late bool isMonSelected;
  late bool isTueSelected;
  late bool isWedSelected;
  late bool isThuSelected;
  late bool isFriSelected;
  late bool isSatSelected;
  late bool isSunSelected;

  Map<String, TimeOfDay?> selectedTimes = {};

  late DateTime wakeAt;
  late DateTime bedAt;

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
              decoration: const BoxDecoration(
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
                    padding: const EdgeInsets.all(20.0),
                    child: SingleChildScrollView(
                      child: Column(
                        children: <Widget>[
                          const SizedBox(height: 30.0),
                          const Text(
                            'Choose Time',
                            style: TextStyle(color: Colors.white),
                          ),
                          GestureDetector(
                            child: Text(
                              wakeTime.format(context),
                              style: const TextStyle(
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

                          const SizedBox(height: 30.0),
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
                          const SizedBox(height: 60.0),
                          SizedBox(
                            height: 2.0,
                            child: Container(
                              color: Colors.white30,
                            ),
                          ),
                          const ListTile(
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
                          const ListTile(
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
                          const ListTile(
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
                          const ListTile(
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
                          const SizedBox(height: 60.0),
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
                                            const Color.fromARGB(150, 53, 70, 131),
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),
                                        child: SizedBox(
                                          width: 600,
                                          height: 500,
                                          child: ListView(
                                            children: ListTile.divideTiles(
                                              context: context,
                                              tiles: List.generate(4, (index) {
                                                return InkWell(
                                                  onTap: () {
                                                    _saveTimes(
                                                        context, index + 1);
                                                    _saveTimesSharedPreferences();
                                                    _addAlarm();
                                                    Navigator.pop(context);
                                                    Navigator.pop(
                                                        context, selectedTimes);
                                                  },
                                                  child: Container(
                                                    height: 125,
                                                    // Specify the desired height here
                                                    decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8),
                                                      color: const Color.fromARGB(
                                                          150, 53, 70, 131),
                                                    ),
                                                    padding:
                                                        const EdgeInsets.symmetric(
                                                            horizontal: 8,
                                                            vertical: 16),
                                                    child: Row(
                                                      children: [
                                                        const SizedBox(width: 16),
                                                        Text(
                                                          (index + 1).toString().padLeft(2, '0'),
                                                          style: const TextStyle(
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
                                                        const SizedBox(width: 16),
                                                        Expanded(
                                                          child: Text(
                                                            '${_getBedTime(index + 1)} for ${_getCycleCount(index + 1)} Cycles \n${_getSleepDuration(index + 1)} of Sleep.',
                                                            textAlign:
                                                                TextAlign.left,
                                                            style: const TextStyle(
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
                                                );
                                              }),
                                              color: const Color.fromARGB(
                                                  192, 37, 34, 70),
                                            ).toList(),
                                          ),
                                        ),
                                      );
                                    },
                                  );
                                },
                              ),
                              const SizedBox(width: 8),

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

  Future<void> _saveTimesSharedPreferences() async {
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
      await prefs.setString('wake_time', wakeTimeString); //remove !
      await prefs.setString('bed_time', bedTimeString); //remove !
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
    int cycleLength = 90;
    bedTime1 = wakeTime.minusMinute(cycleLength * 6);
    // bedTime1 = wakeTime.replacing(minute: wakeTime.minute - 1);
    bedTime2 = wakeTime.minusMinute(cycleLength * 5);
    bedTime3 = wakeTime.minusMinute(cycleLength * 4);
    bedTime4 = wakeTime.minusMinute(cycleLength * 3);
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
    } on Exception {
      wakeTime = const TimeOfDay(hour: 6, minute: 0);
      setState(() {});
    }
  }

  String _getBedTime(int index) {
    switch (index) {
      case 1:
        return bedTime1.formatOrEmpty(context);
      case 2:
        return bedTime2.formatOrEmpty(context);
      case 3:
        return bedTime3.formatOrEmpty(context);
      case 4:
        return bedTime4.formatOrEmpty(context);
      default:
        return '';
    }
  }

  int _getCycleCount(int index) {
    switch (index) {
      case 1:
        return 6;
      case 2:
        return 5;
      case 3:
        return 4;
      case 4:
        return 3;
      default:
        return 0;
    }
  }

  String _getSleepDuration(int index) {
    switch (index) {
      case 1:
        return 'Nine Hours';
      case 2:
        return 'Seven and a Half Hours';
      case 3:
        return 'Six Hours';
      case 4:
        return 'Four and a Half Hours';
      default:
        return '';
    }
  }

  void _addAlarm() {
    TimeOfDay? wakeTime = selectedTimes['wake_time'];
    TimeOfDay? bedTime = selectedTimes['bed_time'];
    log('waketime $wakeTime');
    final now = DateTime.now();

    wakeAt =
        DateTime(now.year, now.month, now.day, wakeTime!.hour, wakeTime.minute);
    if (DateTime.now().hour > wakeAt.hour) {
      wakeAt = wakeAt.add(const Duration(days: 1));
    } else if (DateTime.now().hour == wakeAt.hour &&
        DateTime.now().minute >= wakeAt.minute) {
      wakeAt = wakeAt.add(const Duration(days: 1));
    }
    final AlarmsModel wakeAlarm = AlarmsModel(
        at: wakeAt,
        repeat: _repeat,
        vibrate: _isVibrate,
        label: _labelController.text.isNotEmpty ? _labelController.text : null,
        deleteAfterDone: _isDelete,
        type: TypeEnum.wakeTime);

    bedAt =
        DateTime(now.year, now.month, now.day, bedTime!.hour, bedTime.minute);
    if (DateTime.now().hour > bedAt.hour) {
      bedAt = bedAt.add(const Duration(days: 1));
    } else if (DateTime.now().hour == bedAt.hour &&
        DateTime.now().minute >= bedAt.minute) {
      bedAt = bedAt.add(const Duration(days: 1));
    }
    final AlarmsModel bedAlarm = AlarmsModel(
        at: bedAt,
        repeat: _repeat,
        vibrate: _isVibrate,
        label: _labelController.text.isNotEmpty ? _labelController.text : null,
        deleteAfterDone: _isDelete,
        type: TypeEnum.bedTime);

    final bool itExists = _alarmContext.isAlarmAlreadyExists(wakeAlarm);
    log("alarm already exists - $itExists");
    if (!itExists) {
      _alarmContext.addAlarms(bedAlarm);
      _alarmContext.addAlarms(wakeAlarm);
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
