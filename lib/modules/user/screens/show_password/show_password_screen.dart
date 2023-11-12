import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:taskify/shared/layout/widgets/layout.dart';
import 'package:taskify/shared/providers/user_provider.dart';
import 'package:taskify/shared/widgets/button.dart';
import 'package:taskify/shared/widgets/text_field.dart';

part 'widgets/body.dart';

class ShowPasswordScreen extends StatelessWidget {
  const ShowPasswordScreen({super.key});

  static String id = "show_password_screen";

  @override
  Widget build(BuildContext context) {
    return Layout(
      body: SingleChildScrollView(child: Body()),
    );
  }
}
