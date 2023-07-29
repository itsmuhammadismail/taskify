import 'package:flutter/material.dart';
import 'package:taskify/modules/user/screens/about/about_screen.dart';
import 'package:taskify/modules/user/screens/app_security/app_security_screen.dart';
import 'package:taskify/modules/user/screens/appearance/appearance_screen.dart';
import 'package:taskify/modules/user/screens/help_and_support/help_and_support_screen.dart';
import 'package:taskify/modules/user/screens/manage_accounts/manage_accounts_screen.dart';
import 'package:taskify/modules/user/screens/manage_history/manage_history_screen.dart';
import 'package:taskify/modules/user/screens/notification/notification_screen.dart';
import 'package:taskify/modules/user/screens/privacy_policy/privacy_policy_screen.dart';
import 'package:taskify/modules/user/screens/show_password/show_password_screen.dart';
import 'package:taskify/modules/user/screens/updates/updates_screen.dart';
import 'package:taskify/shared/layout/widgets/layout.dart';
import 'package:taskify/modules/user/screens/account/account_screen.dart';

part 'widgets/body.dart';

class PrivacyAndSecurityScreen extends StatelessWidget {
  const PrivacyAndSecurityScreen({super.key});

  static String id = "privacy_and_security_screen";

  @override
  Widget build(BuildContext context) {
    return Layout(
      body: Body(),
    );
  }
}
