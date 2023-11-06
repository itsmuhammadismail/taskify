import 'package:flutter/material.dart';
import 'package:taskify/modules/chatgpt/screens/chat/chat_screen.dart';
import 'package:taskify/modules/tasks/screens/add_task/add_task_screen.dart';
import 'package:taskify/modules/tasks/screens/create/create_screen.dart';
import 'package:taskify/modules/tasks/screens/home/home_screen.dart';
import 'package:taskify/modules/tasks/screens/stats/stats_screen.dart';
import 'package:taskify/modules/user/screens/about/about_screen.dart';
import 'package:taskify/modules/user/screens/account/account_screen.dart';
import 'package:taskify/modules/user/screens/add_account/add_account_screen.dart';
import 'package:taskify/modules/user/screens/app_security/app_security_screen.dart';
import 'package:taskify/modules/user/screens/appearance/appearance_screen.dart';
import 'package:taskify/modules/user/screens/edit_profile/edit_profile_screen.dart';
import 'package:taskify/modules/user/screens/forget_password/forget_password_screen.dart';
import 'package:taskify/modules/user/screens/help_and_support/help_and_support_screen.dart';
import 'package:taskify/modules/user/screens/history/history_screen.dart';
import 'package:taskify/modules/user/screens/login/login_screen.dart';
import 'package:taskify/modules/user/screens/manage_accounts/manage_accounts_screen.dart';
import 'package:taskify/modules/user/screens/manage_history/manage_history_screen.dart';
import 'package:taskify/modules/user/screens/notification/notification_screen.dart';
import 'package:taskify/modules/user/screens/privacy_and_security/privacy_and_security_screen.dart';
import 'package:taskify/modules/user/screens/privacy_policy/privacy_policy_screen.dart';
import 'package:taskify/modules/user/screens/remove_account/remove_account_screen.dart';
import 'package:taskify/modules/user/screens/save_info/save_info_screen.dart';
import 'package:taskify/modules/user/screens/settings/settings_screen.dart';
import 'package:taskify/modules/user/screens/show_details/show_details_screen.dart';
import 'package:taskify/modules/user/screens/show_password/show_password_screen.dart';
import 'package:taskify/modules/user/screens/signup/signup_screen.dart';
import 'package:taskify/modules/user/screens/splash/splash_screen.dart';
import 'package:taskify/modules/user/screens/updates/updates_screen.dart';

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
    CreateScreen.id: (context) => const CreateScreen(),
    ApearanceScreen.id: (context) => const ApearanceScreen(),
    PrivacyAndSecurityScreen.id: (context) => const PrivacyAndSecurityScreen(),
    ShowPasswordScreen.id: (context) => const ShowPasswordScreen(),
    ManageAccountsScreen.id: (context) => const ManageAccountsScreen(),
    ManageHistoryScreen.id: (context) => const ManageHistoryScreen(),
    UpdatesScreen.id: (context) => const UpdatesScreen(),
    PrivacyPolicyScreen.id: (context) => const PrivacyPolicyScreen(),
    AppSecurityScreen.id: (context) => const AppSecurityScreen(),
    SaveInfoScreen.id: (context) => const SaveInfoScreen(),
    RemoveAccountScreen.id: (context) => const RemoveAccountScreen(),
    AddAccountScreen.id: (context) => const AddAccountScreen(),
    ChatScreen.id: (context) => const ChatScreen(),
  };
}
