import 'package:flutter/material.dart';
import 'package:taskify/shared/layout/widgets/layout.dart';

part 'widgets/body.dart';

class HelpAndSupportScreen extends StatelessWidget {
  const HelpAndSupportScreen({super.key});

  static String id = "help_and_support_screen";

  @override
  Widget build(BuildContext context) {
    return Layout(
      body: SingleChildScrollView(child: Body()),
    );
  }
}
