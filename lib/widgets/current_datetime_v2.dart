import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CurrentDateTimeWidgetV2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<DateTime>(
      stream: Stream.periodic(Duration(seconds: 1), (_) => DateTime.now()),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          DateTime dateTime = snapshot.data!;
          var formatter = DateFormat('HH : mm');
          String formattedDateTime = formatter.format(dateTime);
          return Text(
            formattedDateTime,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 48,
              fontWeight: FontWeight.bold,
            ),
          );
        } else {
          return Text('Loading...');
        }
      },
    );
  }
}
