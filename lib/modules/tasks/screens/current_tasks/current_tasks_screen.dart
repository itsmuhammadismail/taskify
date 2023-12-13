import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:taskify/modules/tasks/screens/create/create_screen.dart';
import 'package:taskify/modules/tasks/screens/current_tasks/widgets/running_task.dart';
import 'package:taskify/modules/tasks/screens/current_tasks/widgets/todo_task.dart';
import 'package:taskify/notification_service.dart';
import 'package:taskify/shared/layout/widgets/layout.dart';
import 'package:taskify/shared/network/network.dart';
import 'package:taskify/shared/providers/running_tasks_provider.dart';
import 'package:taskify/shared/providers/todo_tasks_provider.dart';
import 'package:taskify/shared/providers/user_provider.dart';

part 'widgets/body.dart';

class CurrentTasksScreen extends StatelessWidget {
  const CurrentTasksScreen({super.key});

  static String id = 'current_tasks_screen';

  @override
  Widget build(BuildContext context) {
    return Layout(
      body: Body(),
    );
  }
}
