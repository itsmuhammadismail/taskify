import 'package:flutter/material.dart';
import 'package:taskify/shared/layout/widgets/layout.dart';

part 'widgets/body.dart';

class RemoveAccountScreen extends StatelessWidget {
  const RemoveAccountScreen({super.key});

  static String id = "remove_account_screen";

  @override
  Widget build(BuildContext context) {
    return Layout(
      body: SingleChildScrollView(child: Body()),
    );
  }
}
