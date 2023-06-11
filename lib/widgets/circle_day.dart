import 'package:flutter/material.dart';

class CircleDay extends StatefulWidget {
  final String day;
  final bool initialSelected;
  final ValueChanged<bool> onSelectedChanged;

  const CircleDay({
    Key? key,
    required this.day,
    required this.initialSelected,
    required this.onSelectedChanged,
  }) : super(key: key);

  @override
  _CircleDayState createState() => _CircleDayState();
}

class _CircleDayState extends State<CircleDay> {
  late bool selected;

  @override
  void initState() {
    selected = widget.initialSelected;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selected = !selected;
        });
        widget.onSelectedChanged(selected);
      },
      child: Container(
        width: 50.0,
        height: 50.0,
        decoration: BoxDecoration(
          color: selected ? Theme.of(context).accentColor : Colors.transparent,
          borderRadius: BorderRadius.circular(90.0),
        ),
        child: Padding(
          padding: EdgeInsets.all(6.0),
          child: Center(
            child: Text(
              widget.day,
              style: TextStyle(color: Colors.white, fontSize: 15.0),
            ),
          ),
        ),
      ),
    );
  }
}
