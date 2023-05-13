import 'package:flutter/material.dart';

var textInputDecoration = InputDecoration(
    labelStyle: TextStyle(color: Colors.white, fontWeight: FontWeight.w300),
    // border: OutlineInputBorder(
    //   borderRadius: BorderRadius.circular(5.0),
    // ),
    focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.white, width: 2),
        borderRadius: BorderRadius.circular(20.0)),
    enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.white30, width: 2),
        borderRadius: BorderRadius.circular(20.0)),
    errorBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.white, width: 2),
        borderRadius: BorderRadius.circular(20.0)));

void nextScreen(context, page) {
  Navigator.push(context, MaterialPageRoute(builder: (context) => page));
}

void nextScreenReplace(context, page) {
  Navigator.pushReplacement(
      context, MaterialPageRoute(builder: (context) => page));
}

void showSnackBar(context, color, message) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    content: Text(
      message,
      style: const TextStyle(fontSize: 14),
    ),
    backgroundColor: color,
    duration: const Duration(seconds: 2),
    action: SnackBarAction(
      label: "OK",
      onPressed: () {},
      textColor: Colors.white,
    ),
  ));
}
