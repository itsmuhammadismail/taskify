import 'package:flutter/material.dart';
import 'package:taskify/auth.dart';
import 'package:taskify/modules/user/screens/add_account/add_account_screen.dart';
import 'package:taskify/modules/user/screens/remove_account/remove_account_screen.dart';
import 'package:taskify/shared/layout/widgets/layout.dart';
import 'package:taskify/shared/routes/navigate.dart';

part 'widgets/body.dart';

class AccountScreen extends StatelessWidget {
  const AccountScreen({super.key});

  static String id = "account_screen";

  @override
  Widget build(BuildContext context) {
    return Layout(
      body: SingleChildScrollView(child: Body()),
    );
  }
}
