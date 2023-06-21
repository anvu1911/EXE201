import 'package:flutter/material.dart';

class ColoredRectangle extends StatelessWidget {
  final double width;
  final double height;
  final String text;
  final EdgeInsetsGeometry padding;

  const ColoredRectangle({
    required this.width,
    required this.height,
    required this.text,
    this.padding = EdgeInsets.zero,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding,
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          color: Color.fromARGB(
              155, 86, 163, 180), // Replace with your desired color
          borderRadius: BorderRadius.circular(4),
        ),
        child: Align(
          alignment: Alignment.centerLeft,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Text(
              text,
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.left,
            ),
          ),
        ),
      ),
    );
  }
}
