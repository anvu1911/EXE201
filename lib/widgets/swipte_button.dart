import 'package:flutter/material.dart';
import 'package:swipeable_button_view/swipeable_button_view.dart';

class SwipeButton extends StatelessWidget {
  final void Function() onFinish;
  final void Function() onWaitingProcess;
  final Color activeColor;
  final Color iconColor;

  const SwipeButton({
    Key? key,
    required this.onFinish,
    required this.onWaitingProcess,
    required this.activeColor,
    required this.iconColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SwipeableButtonView(
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
    );
  }
}
