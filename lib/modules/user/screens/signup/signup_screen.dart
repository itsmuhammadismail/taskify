import 'package:flutter/material.dart';
import 'package:taskify/auth.dart';
import 'package:taskify/shared/dark_theme/dark_theme_provider.dart';
import 'package:taskify/shared/providers/credentials_provider.dart';
import 'package:taskify/shared/providers/user_provider.dart';
import 'package:taskify/shared/widgets/alert.dart';
import 'package:taskify/shared/widgets/aut_text_field.dart';
import 'package:taskify/shared/widgets/button.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:taskify/modules/tasks/screens/home/home_screen.dart';
import 'package:taskify/shared/routes/navigate.dart';
import 'package:provider/provider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:taskify/shared/network/network.dart';

part 'widgets/body.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  static String id = "signup_screen";

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Body(),
    );
  }
}
