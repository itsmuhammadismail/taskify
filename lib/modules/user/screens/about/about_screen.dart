import 'package:flutter/material.dart';
import 'package:taskify/shared/layout/widgets/layout.dart';

part 'widgets/body.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({super.key});

  static String id = "about_screen";

  @override
  Widget build(BuildContext context) {
    return Layout(
      body: SingleChildScrollView(child: Body()),
    );
  }
}
