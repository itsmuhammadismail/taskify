import 'package:flutter/material.dart';
import 'package:taskify/shared/layout/widgets/app_bar.dart';

class Layout extends StatelessWidget {
  final Widget body;
  final int currentTab;

  const Layout({super.key, required this.body, this.currentTab = 0});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const BuildAppBar(),
      body: body,
    );
  }
}
