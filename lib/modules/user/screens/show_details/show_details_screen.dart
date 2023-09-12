import 'package:flutter/material.dart';
import 'package:taskify/auth.dart';
import 'package:taskify/shared/layout/widgets/layout.dart';
import 'package:taskify/resources/colors.dart';
import 'package:taskify/shared/widgets/date_selector.dart';

part 'widgets/body.dart';

class ShowDetailsScreen extends StatelessWidget {
  const ShowDetailsScreen({super.key});

  static String id = "show_details_screen";

  @override
  Widget build(BuildContext context) {
    return const Layout(
      body: Body(),
    );
  }
}
