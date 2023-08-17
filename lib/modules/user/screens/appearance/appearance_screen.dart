import 'package:flutter/material.dart';
import 'package:taskify/shared/dark_theme/dark_theme_provider.dart';
import 'package:taskify/shared/layout/widgets/layout.dart';
import 'package:provider/provider.dart';

part 'widgets/body.dart';

class ApearanceScreen extends StatelessWidget {
  const ApearanceScreen({super.key});

  static String id = "appearance_screen";

  @override
  Widget build(BuildContext context) {
    return Layout(
      body: SingleChildScrollView(child: Body()),
    );
  }
}
