import 'package:flutter/material.dart';

class PercentageRectangle extends StatelessWidget {
  final String bestPercentage;
  final String worstPercentage;
  final String averagePercentage;
  final double padding;
  final double width;
  final double cornerRadius;

  PercentageRectangle({
    required this.bestPercentage,
    required this.worstPercentage,
    required this.averagePercentage,
    this.padding = 16.0,
    this.width = 360.0,
    this.cornerRadius = 4.0,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      padding: EdgeInsets.all(padding),
      decoration: BoxDecoration(
        color: Color.fromARGB(185, 79, 82, 179),
        borderRadius: BorderRadius.circular(cornerRadius),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                'Best',
                style: TextStyle(
                  color: Color(0xFF2BE9DD),
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                '$bestPercentage%',
                style: TextStyle(
                  color: Color(0xFF2BE9DD),
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                'Worst',
                style: TextStyle(
                  color: Color(0xFF2BE9DD),
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                '$worstPercentage%',
                style: TextStyle(
                  color: Color(0xFF2BE9DD),
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                'Average',
                style: TextStyle(
                  color: Color(0xFF2BE9DD),
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                '$averagePercentage%',
                style: TextStyle(
                  color: Color(0xFF2BE9DD),
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
