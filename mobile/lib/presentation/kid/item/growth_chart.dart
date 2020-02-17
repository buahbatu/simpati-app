import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class GrowthChart extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 160,
      child: LineChart(
        LineChartData(
          borderData: FlBorderData(show: false),
          lineTouchData: const LineTouchData(enabled: false),
          lineBarsData: [
            ...getTemplateBars(),
          ],
          betweenBarsData: [
            ...getTemplateColors(),
          ],
          minY: 0,
          titlesData: FlTitlesData(
            bottomTitles: SideTitles(
              reservedSize: 10,
              showTitles: true,
              textStyle: TextStyle(fontSize: 10, color: Colors.black45),
              getTitles: (value) {
                if (value == 12) {
                  return '12';
                } else if (value == 24) {
                  return '24';
                } else if (value == 34) {
                  return '34';
                } else if (value == 36) {
                  return '(bln)';
                } else {
                  return '';
                }
              },
              margin: 8,
            ),
            leftTitles: SideTitles(
              reservedSize: 12,
              showTitles: true,
              textStyle: TextStyle(fontSize: 10, color: Colors.black45),
              getTitles: (value) {
                if (value % 3 == 0)
                  return value.toInt().toString();
                else
                  return '';
              },
            ),
          ),
          gridData: FlGridData(
            show: true,
            drawVerticalLine: true,
            getDrawingHorizontalLine: (value) => const FlLine(
              color: Colors.black45,
              strokeWidth: 0.2,
            ),
            getDrawingVerticalLine: (value) => const FlLine(
              color: Colors.black45,
              strokeWidth: 0.2,
            ),
          ),
        ),
      ),
    );
  }

  List<BetweenBarsData> getTemplateColors() {
    return [
      BetweenBarsData(
        fromIndex: 0,
        toIndex: 1,
        colors: [Colors.yellow.withOpacity(0.3)],
      ),
      BetweenBarsData(
        fromIndex: 1,
        toIndex: 2,
        colors: [Colors.lightGreen.withOpacity(0.4)],
      ),
      BetweenBarsData(
        fromIndex: 2,
        toIndex: 3,
        colors: [Colors.green.withOpacity(0.5)],
      ),
      BetweenBarsData(
        fromIndex: 3,
        toIndex: 4,
        colors: [Colors.lightGreen.withOpacity(0.4)],
      ),
      BetweenBarsData(
        fromIndex: 4,
        toIndex: 5,
        colors: [Colors.yellow.withOpacity(0.3)],
      )
    ];
  }

  List<LineChartBarData> getTemplateBars() {
    return [
      LineChartBarData(
        spots: const [
          FlSpot(0, 3.8),
          FlSpot(3, 6.7),
          FlSpot(6, 9),
          FlSpot(10, 11),
          FlSpot(13, 12),
          FlSpot(20, 14),
          FlSpot(24, 15),
          FlSpot(29, 16),
          FlSpot(36, 17.2),
        ],
        isCurved: true,
        barWidth: 1,
        colors: [Colors.yellow],
        dotData: const FlDotData(show: false),
      ),
      LineChartBarData(
        spots: const [
          FlSpot(0, 3.3),
          FlSpot(4, 6.9),
          FlSpot(10, 10),
          FlSpot(16, 12),
          FlSpot(25, 14),
          FlSpot(30, 15),
          FlSpot(36, 16),
        ],
        isCurved: true,
        barWidth: 1,
        colors: [Colors.lightGreen],
        dotData: const FlDotData(show: false),
      ),
      LineChartBarData(
        spots: const [
          FlSpot(0, 2.9),
          FlSpot(2, 4.6),
          FlSpot(4, 6.2),
          FlSpot(7, 7.9),
          FlSpot(13, 10),
          FlSpot(21, 12),
          FlSpot(26, 13),
          FlSpot(32, 14),
          FlSpot(36, 14.8),
        ],
        isCurved: true,
        barWidth: 1,
        colors: [Colors.green],
        dotData: const FlDotData(show: false),
      ),
      LineChartBarData(
        spots: const [
          FlSpot(0, 2.6),
          FlSpot(3, 4.8),
          FlSpot(9, 7.7),
          FlSpot(22, 11),
          FlSpot(34, 13),
          FlSpot(36, 13.2),
        ],
        isCurved: true,
        barWidth: 1,
        colors: [Colors.lightGreen],
        dotData: const FlDotData(show: false),
      ),
      LineChartBarData(
        spots: const [
          FlSpot(0, 2.2),
          FlSpot(2, 3.7),
          FlSpot(7, 6.2),
          FlSpot(10, 7.2),
          FlSpot(19, 9.3),
          FlSpot(24, 10),
          FlSpot(30, 11),
          FlSpot(36, 11.9),
        ],
        isCurved: true,
        barWidth: 1,
        colors: [Colors.yellow],
        dotData: const FlDotData(show: false),
      ),
      LineChartBarData(
        spots: const [
          FlSpot(0, 2),
          FlSpot(3, 4),
          FlSpot(8, 6),
          FlSpot(12, 7),
          FlSpot(19, 8),
          FlSpot(26, 9),
          FlSpot(36, 10.2),
        ],
        isCurved: true,
        barWidth: 1,
        colors: [Colors.red],
        dotData: const FlDotData(show: false),
      ),
    ];
  }
}
