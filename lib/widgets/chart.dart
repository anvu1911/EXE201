import 'package:flutter/material.dart';

class SleepChart extends StatelessWidget {
  final List<String> daysOfWeek;
  final List<int> sleepHours;
  final EdgeInsets padding;

  SleepChart({
    required this.daysOfWeek,
    required this.sleepHours,
    this.padding = EdgeInsets.zero,
  });

  @override
  Widget build(BuildContext context) {
    final maxWidth = sleepHours.reduce((a, b) => a > b ? a : b).toDouble() * 10;

    return Padding(
      padding: padding,
      child: Container(
        width: 360.0,
        decoration: BoxDecoration(
          color: Color.fromARGB(185, 79, 82, 179),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Column(
          children: [
            SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: List.generate(
                daysOfWeek.length,
                (index) => Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      '${sleepHours[index]}h',
                      style: TextStyle(
                        color: Color(0xFF2CF9C7),
                      ),
                    ),
                    Container(
                      width: 25,
                      height: sleepHours[index].toDouble() * 15,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            Color.fromARGB(255, 158, 145, 255),
                            Color.fromARGB(255, 145, 255, 182),
                          ],
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                        ),
                      ),
                    ),
                    Text(
                      daysOfWeek[index],
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF2CF9C7),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
