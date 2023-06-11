import 'package:flutter/material.dart';
import 'package:swipeable_button_view/swipeable_button_view.dart';

class SwipeUpButton extends StatelessWidget {
  final void Function() onFinish;
  final void Function() onWaitingProcess;
  final Color activeColor;
  final Color iconColor;

  const SwipeUpButton({
    Key? key,
    required this.onFinish,
    required this.onWaitingProcess,
    required this.activeColor,
    required this.iconColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 60, // adjust width as needed
      height: 100, // adjust height as needed
      child: RotatedBox(
        quarterTurns: 3,
        child: SwipeableButtonView(
          onFinish: onFinish,
          onWaitingProcess: onWaitingProcess,
          activeColor: activeColor,
          buttonWidget: Container(
            child: Icon(
              Icons.arrow_forward_ios_rounded,
              color: iconColor,
            ),
          ),
          buttonText: '',
        ),
      ),
    );
  }
}

class SwipeUpScreen extends StatefulWidget {
  const SwipeUpScreen({Key? key}) : super(key: key);

  @override
  _SwipeUpScreenState createState() => _SwipeUpScreenState();
}

class _SwipeUpScreenState extends State<SwipeUpScreen> {
  double _dragOffset = 0.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          GestureDetector(
            onVerticalDragUpdate: (details) {
              setState(() {
                _dragOffset += details.delta.dy;
              });
            },
            child: Container(
              color: Colors.white,
              child: Center(
                child: Text(
                  'Swipe up!',
                  style: TextStyle(fontSize: 24.0),
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 0.0,
            left: 0.0,
            right: 0.0,
            child: Transform.translate(
              offset: Offset(0.0, -_dragOffset),
              child: SwipeUpButton(
                onFinish: () {},
                onWaitingProcess: () {},
                activeColor: Color.fromARGB(255, 172, 165, 223),
                iconColor: Color(0xACA5DF),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
