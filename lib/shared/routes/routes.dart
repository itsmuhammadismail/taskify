import 'package:flutter/material.dart';
import 'package:taskify/modules/tasks/screens/add_task/add_task_screen.dart';
import 'package:taskify/modules/tasks/screens/create/create_screen.dart';
import 'package:taskify/modules/tasks/screens/home/home_screen.dart';
import 'package:taskify/modules/tasks/screens/stats/stats_screen.dart';
import 'package:taskify/modules/user/screens/about/about_screen.dart';
import 'package:taskify/modules/user/screens/account/account_screen.dart';
import 'package:taskify/modules/user/screens/edit_profile/edit_profile_screen.dart';
import 'package:taskify/modules/user/screens/forget_password/forget_password_screen.dart';
import 'package:taskify/modules/user/screens/help_and_support/help_and_support_screen.dart';
import 'package:taskify/modules/user/screens/history/history_screen.dart';
import 'package:taskify/modules/user/screens/login/login_screen.dart';
import 'package:taskify/modules/user/screens/notification/notification_screen.dart';
import 'package:taskify/modules/user/screens/settings/settings_screen.dart';
import 'package:taskify/modules/user/screens/show_details/show_details_screen.dart';
import 'package:taskify/modules/user/screens/signup/signup_screen.dart';
import 'package:taskify/modules/user/screens/splash/splash_screen.dart';

class Routes {
  static Map<String, Widget Function(BuildContext)> routes = {
    SplashScreen.id: (context) => const SplashScreen(),
    LoginScreen.id: (context) => const LoginScreen(),
    ForgetPasswordScreen.id: (context) => const ForgetPasswordScreen(),
    SignupScreen.id: (context) => const SignupScreen(),
    HomeScreen.id: (context) => const HomeScreen(),
    SettingsScreen.id: (context) => const SettingsScreen(),
    EditProfileScreen.id: (context) => const EditProfileScreen(),
    ShowDetailsScreen.id: (context) => const ShowDetailsScreen(),
    AccountScreen.id: (context) => const AccountScreen(),
    AboutScreen.id: (context) => const AboutScreen(),
    NotificationScreen.id: (context) => const NotificationScreen(),
    HelpAndSupportScreen.id: (context) => const HelpAndSupportScreen(),
    HistoyScreen.id: (context) => const HistoyScreen(),
    StatsScreen.id: (context) => StatsScreen(),
    AddTaskScreen.id: (context) => const AddTaskScreen(),
    CreateScreen.id: (context) => CreateScreen(),
  };
}