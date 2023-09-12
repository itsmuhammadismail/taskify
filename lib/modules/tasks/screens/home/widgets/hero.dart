import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:taskify/auth.dart';

class HeroSection extends StatelessWidget {
  const HeroSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(
                  "Hi ${Auth().currentUser?.displayName?.split(" ")[0]}",
                  style: TextStyle(
                    color: Color(0xFFDA6FCF),
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(width: 10),
                Image.asset('assets/emojis/hand.png')
              ],
            ),
            const Text(
              "You have scheduled 5 tasks",
              style: TextStyle(color: Color(0xFF3B96EA)),
            ),
          ],
        ),
        const Spacer(),
        Image.asset('assets/images/avatar.png')
      ],
    );
  }
}
