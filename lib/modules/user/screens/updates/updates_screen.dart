import 'package:flutter/material.dart';
import 'package:taskify/modules/tasks/screens/home/home_screen.dart';
import 'package:taskify/modules/user/screens/about/about_screen.dart';
import 'package:taskify/modules/user/screens/app_security/app_security_screen.dart';
import 'package:taskify/modules/user/screens/appearance/appearance_screen.dart';
import 'package:taskify/modules/user/screens/help_and_support/help_and_support_screen.dart';
import 'package:taskify/modules/user/screens/notification/notification_screen.dart';
import 'package:taskify/modules/user/screens/privacy_policy/privacy_policy_screen.dart';
import 'package:taskify/shared/layout/widgets/layout.dart';
import 'package:taskify/modules/user/screens/account/account_screen.dart';
import 'package:taskify/shared/routes/navigate.dart';
import 'package:taskify/shared/widgets/button.dart';

part 'widgets/body.dart';

class UpdatesScreen extends StatelessWidget {
  const UpdatesScreen({super.key});

  static String id = "updates_screen";

  @override
  Widget build(BuildContext context) {
    return Layout(
      body: Body(),
    );
  }
}
