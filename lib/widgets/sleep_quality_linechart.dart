import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class LineChartWidget extends StatelessWidget {
  // Sample data

  final List<String> daysOfWeek = [
    "Mon",
    "Tue",
    "Wed",
    "Thu",
    "Fri",
    "Sat",
    "Sun"
  ];
  final List<double> sleepQuality;

  LineChartWidget({required this.sleepQuality});

  Widget bottomTitleWidgets(double value, TitleMeta meta) {
    const style = TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: 13,
      color: Colors.white, // Set text color to white
    );
    Widget text;
    switch (value.toInt()) {
      case 0:
        text = const Text('M', style: style);
        break;
      case 1:
        text = const Text('T', style: style);
        break;
      case 2:
        text = const Text('W', style: style);
        break;
      case 3:
        text = const Text('T', style: style);
        break;
      case 4:
        text = const Text('F', style: style);
        break;
      case 5:
        text = const Text('S', style: style);
        break;
      case 6:
        text = const Text('S', style: style);
        break;
      default:
        text = const Text('');
        break;
    }

    return SideTitleWidget(
      axisSide: meta.axisSide,
      space: 10,
      child: text,
    );
  }

  Widget leftTitleWidgets(double value, TitleMeta meta) {
    const style = TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: 10,
      color: Colors.white, // Set text color to white
    );
    Widget text;
    switch (value.toInt()) {
      case 0:
        text = const Text('0', style: style);
        break;
      case 20:
        text = const Text('20', style: style);
        break;
      case 40:
        text = const Text('40', style: style);
        break;
      case 60:
        text = const Text('60', style: style);
        break;
      case 80:
        text = const Text('80', style: style);
        break;
      case 100:
        text = const Text('100',
            style: TextStyle(
                fontWeight: FontWeight.bold, fontSize: 8, color: Colors.white));
        break;
      default:
        text = const Text('');
        break;
    }

    return SideTitleWidget(
      axisSide: meta.axisSide,
      space: 8,
      child: text,
    );
  }

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 2,
      child: LineChart(
        LineChartData(
          borderData: FlBorderData(
            show: true,

            border: Border.all(
                color: Color.fromARGB(185, 79, 82, 179),
                width: 1.0), // Set border properties
          ),
          // Set up x-axis labels
          titlesData: FlTitlesData(
              show: true,
              bottomTitles: AxisTitles(
                sideTitles: SideTitles(
                    showTitles: true,
                    getTitlesWidget: bottomTitleWidgets,
                    interval: 1.0),
              ),
              // Remove leftTitles
              leftTitles: AxisTitles(
                  sideTitles: SideTitles(
                      showTitles: true, getTitlesWidget: leftTitleWidgets)),
              topTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
              rightTitles:
                  AxisTitles(sideTitles: SideTitles(showTitles: false))
          ),
          // Set up y-axis range and labels
          gridData: FlGridData(
            show: true,
            checkToShowHorizontalLine: (value) => value % 20 == 0,
            getDrawingHorizontalLine: (value) => FlLine(
              color: Color.fromARGB(234, 96, 98, 169),
              strokeWidth: 1,
            ),
            drawVerticalLine: true,
            getDrawingVerticalLine: (value) => FlLine(
              color: Colors.grey,
              strokeWidth: 1,
            ),
          ),
          minY: 0,
          maxY: 100,
          // Set up line data
          lineBarsData: [
            LineChartBarData(
              spots: sleepQuality
                  .asMap()
                  .entries
                  .map((entry) => FlSpot(entry.key.toDouble(), entry.value))
                  .toList(),
              isCurved: true,
              dotData: FlDotData(show: true),
            ),
          ],
        ),
      ),
    );
  }
}
