import 'package:flutter/material.dart';
import 'package:taskify/shared/widgets/aut_text_field.dart';
import 'package:taskify/shared/widgets/button.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:taskify/modules/tasks/screens/home/home_screen.dart';
import 'package:taskify/shared/routes/navigate.dart';

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
