import 'package:flutter/material.dart';

class NotificationCard extends StatelessWidget {
  const NotificationCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
          color: const Color(0xFFFFFFB5),
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
