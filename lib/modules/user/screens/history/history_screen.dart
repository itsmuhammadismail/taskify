import 'package:flutter/material.dart';
import 'package:taskify/shared/layout/widgets/layout.dart';

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
