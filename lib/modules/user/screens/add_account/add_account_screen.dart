import 'package:flutter/material.dart';
import 'package:taskify/shared/layout/widgets/layout.dart';
import 'package:taskify/resources/colors.dart';
import 'package:taskify/shared/widgets/date_selector.dart';

part 'widgets/body.dart';

class AddAccountScreen extends StatelessWidget {
  const AddAccountScreen({super.key});

  static String id = "add_account_screen";

  @override
  Widget build(BuildContext context) {
    return Layout(body: Body());
  }
}
