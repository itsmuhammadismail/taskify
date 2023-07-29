import 'package:flutter/material.dart';
import 'package:taskify/shared/layout/widgets/layout.dart';

part 'widgets/body.dart';

class AppSecurityScreen extends StatelessWidget {
  const AppSecurityScreen({super.key});

  static String id = "app_security_screen";

  @override
  Widget build(BuildContext context) {
    return Layout(body: const Body());
  }
}
