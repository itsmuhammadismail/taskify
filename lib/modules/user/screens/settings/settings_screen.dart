import 'package:flutter/material.dart';
import 'package:taskify/modules/user/screens/about/about_screen.dart';
import 'package:taskify/modules/user/screens/appearance/appearance_screen.dart';
import 'package:taskify/modules/user/screens/help_and_support/help_and_support_screen.dart';
import 'package:taskify/modules/user/screens/notification/notification_screen.dart';
import 'package:taskify/modules/user/screens/privacy_and_security/privacy_and_security_screen.dart';
import 'package:taskify/shared/layout/widgets/layout.dart';
import 'package:taskify/modules/user/screens/account/account_screen.dart';

part 'widgets/body.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  static String id = "settings_screen";

  @override
  Widget build(BuildContext context) {
    return Layout(
      body: Body(),
    );
  }
}
