import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:taskify/resources/constants.dart';
import 'package:taskify/shared/dark_theme/dark_theme_provider.dart';
import 'package:taskify/shared/layout/widgets/layout.dart';
import 'package:taskify/shared/network/network.dart';
import 'package:taskify/shared/providers/user_provider.dart';

part 'widgets/body.dart';

class HistoyScreen extends StatelessWidget {
  const HistoyScreen({super.key});

  static String id = "history_screen";

  @override
  Widget build(BuildContext context) {
    return Layout(
      body: SingleChildScrollView(child: Body()),
    );
  }
}
