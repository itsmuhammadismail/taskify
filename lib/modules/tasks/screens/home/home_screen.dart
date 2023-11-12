import 'package:flutter/material.dart';
import 'package:taskify/shared/layout/widgets/layout.dart';
import 'package:taskify/modules/tasks/screens/home/widgets/hero.dart';
import 'package:taskify/modules/tasks/screens/home/widgets/chat_gpt.dart';
import 'package:taskify/modules/tasks/screens/home/widgets/task_completed_card.dart';
import 'package:taskify/modules/tasks/screens/home/widgets/notification_card.dart';
import 'package:taskify/modules/tasks/screens/home/widgets/task.dart';

part 'widgets/body.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  static String id = "home_screen";

  @override
  Widget build(BuildContext context) {
    return Layout(
      body: Body(),
    );
  }
}
