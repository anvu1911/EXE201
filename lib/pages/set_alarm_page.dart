import 'package:flutter/material.dart';
import '../widgets/circle_day.dart';
import '../widgets/top_bar.dart';

class AddAlarm extends StatefulWidget {
  const AddAlarm({Key? key}) : super(key: key);

  @override
  _AddAlarmState createState() => _AddAlarmState();
}

class _AddAlarmState extends State<AddAlarm> {
  late TimeOfDay _selectedTime;
  late ValueChanged<TimeOfDay> selectTime;
  late bool isMonSelected;
  late bool isTueSelected;
  late bool isWedSelected;
  late bool isThuSelected;
  late bool isFriSelected;
  late bool isSatSelected;
  late bool isSunSelected;

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

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
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
                    Navigator.pop(context);
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
                                                // do something when the row is clicked
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
                                                        '9:00 PM for Six Cycles - Nine Hours of Sleep.',
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
                                                // do something when the row is clicked
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
                                                        '9:00 PM for Six Cycles - Nine Hours of Sleep.',
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
                                                // do something when the row is clicked
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
                                                        '9:00 PM for Six Cycles - Nine Hours of Sleep.',
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
                                                // do something when the row is clicked
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
                                                        '9:00 PM for Six Cycles - Nine Hours of Sleep.',
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
    }
  }
}
