import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:taskify/shared/dark_theme/dark_theme_provider.dart';
import 'package:taskify/shared/layout/widgets/layout.dart';
import 'package:taskify/shared/widgets/text_field.dart';

part 'widgets/body.dart';

class CreateScreen extends StatelessWidget {
  const CreateScreen({super.key});

  static String id = "create_screen";

  @override
  Widget build(BuildContext context) {
    return const Layout(
      body: Body(),
    );
  }
}
