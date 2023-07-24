import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class MyLineChart extends StatelessWidget {
  const MyLineChart({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final List<Color> gradientColors = [
      const Color(0xff69B9F6),
      const Color(0xff69B9F6).withOpacity(0),
    ];
    return LineChart(
      LineChartData(
        // read about it in the LineChartData section
        minX: 0,
        maxX: 11,
        minY: 0,
        maxY: 6,
        borderData: FlBorderData(border: const Border()),
        gridData: FlGridData(show: false),
        titlesData: FlTitlesData(
          bottomTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
          leftTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
          topTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
          rightTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
        ),

        lineBarsData: [
          LineChartBarData(
            spots: [
              FlSpot(0, 3),
              FlSpot(2.6, 2),
              FlSpot(4.9, 5),
              FlSpot(6.8, 2.5),
              FlSpot(8, 4),
              FlSpot(9.5, 3),
              FlSpot(11, 4),
            ],
            isCurved: true,
            // color: gradientColors,

            barWidth: 6,
            color: Color(0xFF69B9F2),
            // dotData: FlDotData(show: false),

            belowBarData: BarAreaData(
              show: true,
              gradient: LinearGradient(
                colors: gradientColors,
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
              // colors: gradientColors
              //     .map((color) => color.withOpacity(0.3))
              //     .toList(),
            ),
          ),
        ],
      ),
      curve: Curves.linear,
      duration: Duration(milliseconds: 150),
    );
  }
}
