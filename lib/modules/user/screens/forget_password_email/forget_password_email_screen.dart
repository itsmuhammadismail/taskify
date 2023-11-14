import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:taskify/auth.dart';
import 'package:taskify/shared/widgets/aut_text_field.dart';
import 'package:taskify/shared/widgets/button.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:taskify/modules/user/screens/login/login_screen.dart';
import 'package:taskify/shared/widgets/alert.dart';
import 'package:taskify/shared/routes/navigate.dart';

part 'widgets/body.dart';

class ForgetPasswordEmailScreen extends StatelessWidget {
  const ForgetPasswordEmailScreen({super.key});

  static String id = "forget_password_email_screen";

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Body(),
    );
  }
}
