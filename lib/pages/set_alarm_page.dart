import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import '../widgets/circle_day.dart';
import '../widgets/top_bar.dart';
import 'package:intl/intl.dart';
import 'home_page.dart';

class AddAlarm extends StatefulWidget {
  const AddAlarm({Key? key}) : super(key: key);

  @override
  _AddAlarmState createState() => _AddAlarmState();
}

class _AddAlarmState extends State<AddAlarm> {
  late TimeOfDay _selectedTime;
  late TimeOfDay wakeTime1 = TimeOfDay(hour: 3, minute: 00);
  late TimeOfDay wakeTime2 = TimeOfDay(hour: 4, minute: 30);
  late TimeOfDay wakeTime3 = TimeOfDay(hour: 6, minute: 00);
  late TimeOfDay wakeTime4 = TimeOfDay(hour: 7, minute: 30);
  late ValueChanged<TimeOfDay> selectTime;
  late bool isMonSelected;
  late bool isTueSelected;
  late bool isWedSelected;
  late bool isThuSelected;
  late bool isFriSelected;
  late bool isSatSelected;
  late bool isSunSelected;

  Map<String, TimeOfDay?> selectedTimes = {};

  @override
  void initState() {
    _selectedTime = TimeOfDay(hour: 12, minute: 00);
    isMonSelected = false;
    isTueSelected = false;
    isWedSelected = false;
    isThuSelected = false;
    isFriSelected = false;
    isSatSelected = false;
    isSunSelected = false;
    super.initState();
  }

  void _saveTimes(BuildContext context, int choice) {
    TimeOfDay? wakeTime;
    switch (choice) {
      case 1:
        {
          wakeTime = wakeTime1;
        }
        break;
      case 2:
        {
          wakeTime = wakeTime2;
        }
        break;
      case 3:
        {
          wakeTime = wakeTime3;
        }
        break;
      case 4:
        {
          wakeTime = wakeTime4;
        }
        break;
    }
    selectedTimes = {'bed_time': wakeTime, 'wake_time': _selectedTime};

    print(selectedTimes);
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
                  title: 'Set wake up time',
                  onBackButtonPressed: () {
                    Navigator.of(context).pop(selectedTimes);
                    // Navigator.pop(context);
                  },
                ),
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.all(20.0),
                    child: SingleChildScrollView(
                      child: Column(
                        children: <Widget>[
                          SizedBox(height: 60.0),
                          GestureDetector(
                            child: Text(
                              _selectedTime.format(context),
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
                          SizedBox(height: 30.0),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                          FloatingActionButton(
                            child: Text(
                              'Save',
                              style: TextStyle(color: Colors.white),
                            ),
                            onPressed: () {
                              showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return Dialog(
                                    backgroundColor:
                                        Color.fromARGB(150, 53, 70, 131),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10),
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
                                                //code here

                                                Navigator.pop(context);
                                                Navigator.pop(
                                                    context, selectedTimes);
                                              },
                                              child: Ink(
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(8),
                                                  color: Color.fromARGB(
                                                      150, 53, 70, 131),
                                                ),
                                                padding: EdgeInsets.symmetric(
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
                                                        color: Color.fromARGB(
                                                            255, 198, 167, 132),
                                                      ),
                                                    ),
                                                    SizedBox(width: 16),
                                                    Expanded(
                                                      child: Text(
                                                        '${wakeTime1.formatOrEmpty(context)} for Six Cycles - Nine Hours of Sleep.',
                                                        textAlign:
                                                            TextAlign.left,
                                                        style: TextStyle(
                                                          color: Colors.white,
                                                          fontWeight:
                                                              FontWeight.w700,
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
                                            color:
                                                Color.fromARGB(192, 37, 34, 70),
                                            height: 1,
                                            thickness: 2,
                                          ),
                                          Expanded(
                                            flex: 1,
                                            child: InkWell(
                                              onTap: () {
                                                _saveTimes(context, 2);
                                                Navigator.pop(context);
                                                Navigator.pop(
                                                    context, selectedTimes);
                                              },
                                              child: Ink(
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(8),
                                                  color: Color.fromARGB(
                                                      150, 53, 70, 131),
                                                ),
                                                padding: EdgeInsets.symmetric(
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
                                                        color: Color.fromARGB(
                                                            255, 198, 167, 132),
                                                      ),
                                                    ),
                                                    SizedBox(width: 16),
                                                    Expanded(
                                                      child: Text(
                                                        '${wakeTime2.formatOrEmpty(context)} for Five Cycles - Seven and a Half Hours of Sleep.',
                                                        textAlign:
                                                            TextAlign.left,
                                                        style: TextStyle(
                                                          color: Colors.white,
                                                          fontWeight:
                                                              FontWeight.w700,
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
                                            color:
                                                Color.fromARGB(192, 37, 34, 70),
                                            height: 1,
                                            thickness: 2,
                                          ),
                                          Expanded(
                                            flex: 1,
                                            child: InkWell(
                                              onTap: () {
                                                _saveTimes(context, 3);
                                                Navigator.pop(context);
                                                Navigator.pop(
                                                    context, selectedTimes);
                                              },
                                              child: Ink(
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(8),
                                                  color: Color.fromARGB(
                                                      150, 53, 70, 131),
                                                ),
                                                padding: EdgeInsets.symmetric(
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
                                                        color: Color.fromARGB(
                                                            255, 198, 167, 132),
                                                      ),
                                                    ),
                                                    SizedBox(width: 16),
                                                    Expanded(
                                                      child: Text(
                                                        '${wakeTime3.formatOrEmpty(context)} for Four Cycles - Six Hours of Sleep.',
                                                        textAlign:
                                                            TextAlign.left,
                                                        style: TextStyle(
                                                          color: Colors.white,
                                                          fontWeight:
                                                              FontWeight.w700,
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
                                            color:
                                                Color.fromARGB(192, 37, 34, 70),
                                            height: 1,
                                            thickness: 2,
                                          ),
                                          Expanded(
                                            flex: 1,
                                            child: InkWell(
                                              onTap: () {
                                                _saveTimes(context, 4);
                                                Navigator.pop(context);
                                                Navigator.pop(
                                                    context, selectedTimes);
                                              },
                                              child: Ink(
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(8),
                                                  color: Color.fromARGB(
                                                      150, 53, 70, 131),
                                                ),
                                                padding: EdgeInsets.symmetric(
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
                                                        color: Color.fromARGB(
                                                            255, 198, 167, 132),
                                                      ),
                                                    ),
                                                    SizedBox(width: 16),
                                                    Expanded(
                                                      child: Text(
                                                        '${wakeTime4.formatOrEmpty(context)} for Three Cycles - Four and a Half Hours of Sleep',
                                                        textAlign:
                                                            TextAlign.left,
                                                        style: TextStyle(
                                                          color: Colors.white,
                                                          fontWeight:
                                                              FontWeight.w700,
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

  Future<void> _selectTime(BuildContext context) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: _selectedTime,
    );
    if (picked != null) {
      setState(() {
        _selectedTime = picked;
      });

      int cycle_length = 90;
      wakeTime1 = _selectedTime.minusMinute(cycle_length * 6);
      wakeTime2 = _selectedTime.minusMinute(cycle_length * 5);
      wakeTime3 = _selectedTime.minusMinute(cycle_length * 4);
      wakeTime4 = _selectedTime.minusMinute(cycle_length * 3);
      print("$wakeTime1\t$wakeTime2\t$wakeTime3\t$wakeTime4");
    }
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
    print("$hourNew, $minuteNew");
    return replacing(hour: hourNew, minute: minuteNew);
  }

  String formatOrEmpty(BuildContext context) {
    return "${hour.toString().padLeft(2, '0')}:${minute.toString().padLeft(2, '0')}";
  }
}
