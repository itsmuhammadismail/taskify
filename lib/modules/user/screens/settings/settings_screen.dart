import 'package:flutter/material.dart';
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
