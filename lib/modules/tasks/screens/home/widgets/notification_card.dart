import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:taskify/shared/dark_theme/dark_theme_provider.dart';

class NotificationCard extends StatelessWidget {
  const NotificationCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final themeChange = Provider.of<DarkThemeProvider>(context);

    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
          color: themeChange.darkTheme
              ? Colors.grey.shade800
              : const Color(0xFFFFFFB5),
          borderRadius: BorderRadius.circular(16)),
      child: Row(
        children: [
          const Text("You are doing great"),
          const SizedBox(width: 10),
          Image.asset('assets/images/like.png'),
        ],
      ),
    );
  }
}
