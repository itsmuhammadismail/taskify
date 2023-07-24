import 'package:flutter/material.dart';
import 'package:taskify/modules/tasks/screens/add_task/widgets/my_calender.dart';
import 'package:taskify/modules/tasks/screens/add_task/widgets/my_calender_picker.dart';
import 'package:taskify/modules/tasks/screens/create/create_screen.dart';
import 'package:taskify/shared/layout/widgets/layout.dart';
import 'package:taskify/shared/routes/navigate.dart';
import 'package:taskify/shared/widgets/button.dart';

part 'widgets/body.dart';

class AddTaskScreen extends StatelessWidget {
  const AddTaskScreen({super.key});

  static String id = "add_task_screen";

  @override
  Widget build(BuildContext context) {
    return Layout(body: Body());
  }
}
