import 'package:flutter/material.dart';
import 'package:taskify/shared/layout/widgets/layout.dart';

part 'widgets/body.dart';

class AccountScreen extends StatelessWidget {
  const AccountScreen({super.key});

  static String id = "account_screen";

  @override
  Widget build(BuildContext context) {
    return Layout(
      body: Body(),
    );
  }
}
