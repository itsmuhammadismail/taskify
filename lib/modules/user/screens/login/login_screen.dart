import 'package:flutter/material.dart';
import 'package:taskify/auth.dart';
import 'package:taskify/shared/widgets/aut_text_field.dart';
import 'package:taskify/shared/widgets/button.dart';
import 'package:taskify/shared/widgets/text_field_container.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:taskify/shared/routes/navigate.dart';
import 'package:taskify/shared/widgets/alert.dart';
import 'package:taskify/modules/user/screens/forget_password/forget_password_screen.dart';
import 'package:taskify/modules/user/screens/signup/signup_screen.dart';
import 'package:taskify/modules/tasks/screens/home/home_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';

part 'widgets/body.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  static String id = "login_screen";

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Body(),
    );
  }
}
