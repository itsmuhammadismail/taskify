import 'package:flutter/material.dart';
import 'package:taskify/shared/layout/widgets/layout.dart';

part 'widgets/body.dart';

class PrivacyPolicyScreen extends StatelessWidget {
  const PrivacyPolicyScreen({super.key});

  static String id = "privacy_policy_screen";

  @override
  Widget build(BuildContext context) {
    return Layout(body: const Body());
  }
}
