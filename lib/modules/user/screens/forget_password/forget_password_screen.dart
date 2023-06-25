import 'package:flutter/material.dart';
import 'package:taskify/shared/widgets/aut_text_field.dart';
import 'package:taskify/shared/widgets/button.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:taskify/modules/user/screens/login/login_screen.dart';
import 'package:taskify/shared/widgets/alert.dart';
import 'package:taskify/shared/routes/navigate.dart';

part 'widgets/body.dart';

class ForgetPasswordScreen extends StatelessWidget {
  const ForgetPasswordScreen({super.key});

  static String id = "forget_password_screen";

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Body(),
    );
  }
}
