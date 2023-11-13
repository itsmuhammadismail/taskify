import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:taskify/modules/tasks/screens/stats/widgets/line_chart.dart';
import 'package:taskify/shared/layout/widgets/layout.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:taskify/shared/providers/running_tasks_provider.dart';

part 'widgets/body.dart';

class StatsScreen extends StatelessWidget {
  static String id = "stats_screen";

  @override
  Widget build(BuildContext context) {
    return Layout(body: Body());
  }
}
