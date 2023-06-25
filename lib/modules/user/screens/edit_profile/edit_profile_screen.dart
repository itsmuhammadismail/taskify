import 'package:flutter/material.dart';
import 'package:taskify/shared/layout/widgets/layout.dart';
import 'package:taskify/resources/colors.dart';
import 'package:taskify/shared/widgets/date_selector.dart';

part 'widgets/body.dart';

class EditProfileScreen extends StatelessWidget {
  const EditProfileScreen({super.key});

  static String id = "edit_profile_screen";

  @override
  Widget build(BuildContext context) {
    return Layout(body: Body());
  }
}
