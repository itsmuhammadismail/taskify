import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:taskify/shared/network/network.dart';
import 'package:taskify/shared/providers/user_provider.dart';

class MyLineChart extends StatefulWidget {
  const MyLineChart({
    super.key,
  });

  @override
  State<MyLineChart> createState() => _MyLineChartState();
}

class _MyLineChartState extends State<MyLineChart> {
  List<FlSpot> spots = [];
  bool isLoading = true;
  double maxX = 0, maxY = 0;

  getGraphData() async {
    String id = context.read<UserProvider>().user.id;

    var res = await NetworkHelper.request(
      url: '/tasks_history/graph/$id',
    );

    print(res['counts']);
    int index = 1;
    maxX = res['counts'].length;
    res['counts'].forEach((item) {
      print(item.toDouble());
      print(index);
      if (item.toDouble() > maxY) {
        maxY = item.toDouble();
      }
      spots.add(FlSpot(index.toDouble(), item.toDouble()));
      index++;
    });
    isLoading = false;
    setState(() {});
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getGraphData();
  }

  @override
  Widget build(BuildContext context) {
    final List<Color> gradientColors = [
      const Color(0xff69B9F6),
      const Color(0xff69B9F6).withOpacity(0),
    ];
    return isLoading
        ? Center(child: const CircularProgressIndicator())
        : LineChart(
            LineChartData(
              // read about it in the LineChartData section
              minX: 0,
              maxX: maxX.toDouble(),
              minY: 0,
              maxY: maxY.toDouble(),
              borderData: FlBorderData(border: const Border()),
              gridData: const FlGridData(show: false),
              titlesData: const FlTitlesData(
                bottomTitles:
                    AxisTitles(sideTitles: SideTitles(showTitles: false)),
                leftTitles:
                    AxisTitles(sideTitles: SideTitles(showTitles: false)),
                topTitles:
                    AxisTitles(sideTitles: SideTitles(showTitles: false)),
                rightTitles:
                    AxisTitles(sideTitles: SideTitles(showTitles: false)),
              ),

              lineBarsData: [
                LineChartBarData(
                  // spots: [
                  //   FlSpot(0, 3),
                  //   FlSpot(2.6, 2),
                  //   FlSpot(4.9, 5),
                  //   FlSpot(6.8, 2.5),
                  //   FlSpot(8, 4),
                  //   FlSpot(9.5, 3),
                  //   FlSpot(11, 4),
                  // ],
                  spots: spots,
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
            duration: const Duration(milliseconds: 150),
          );
  }
}
