import 'package:flutter/material.dart';
import 'package:taskify/notification_service.dart';
import 'package:taskify/shared/layout/widgets/layout.dart';
import 'package:taskify/modules/tasks/screens/home/widgets/hero.dart';
import 'package:taskify/modules/tasks/screens/home/widgets/chat_gpt.dart';
import 'package:taskify/modules/tasks/screens/home/widgets/task_completed_card.dart';
import 'package:taskify/modules/tasks/screens/home/widgets/notification_card.dart';
import 'package:taskify/modules/tasks/screens/home/widgets/task.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

part 'widgets/body.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  static String id = "home_screen";

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    // TODO: implement initState
    NotificationService().showNotifications("Welcome Back",
        "The ultimate tool for planning and achieving your goals");

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Layout(
      body: Body(),
    );
  }
}
