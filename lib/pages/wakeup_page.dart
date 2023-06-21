import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class WakeupPage extends StatefulWidget {
  const WakeupPage({Key? key}) : super(key: key);

  @override
  State<WakeupPage> createState() => _WakeupPageState();
}

class _WakeupPageState extends State<WakeupPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Wake Up'),
      ),
      body: Center(
        child: Text(
          'Wake Up!',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
