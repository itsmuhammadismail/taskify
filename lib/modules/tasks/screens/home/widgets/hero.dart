import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:provider/provider.dart';
import 'package:taskify/auth.dart';
import 'package:taskify/shared/network/network.dart';
import 'package:taskify/shared/providers/user_provider.dart';

class HeroSection extends StatefulWidget {
  const HeroSection({
    super.key,
  });

  @override
  State<HeroSection> createState() => _HeroSectionState();
}

class _HeroSectionState extends State<HeroSection> {
  int tasks = 0;

  void getHistory() async {
    String id = context.read<UserProvider>().user.id;
    try {
      var res = await NetworkHelper.request(
        url: '/tasks_history/?id=$id',
      );

      setState(() {
        tasks = res.length;
      });
    } catch (e) {
      print(e);
    }
  }

  @override
  void initState() {
    getHistory();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    String name = Provider.of<UserProvider>(context).user.first_name;

    return Row(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(
                  "Hi $name",
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
            Text(
              "You have scheduled $tasks tasks",
              style: const TextStyle(color: Color(0xFF3B96EA)),
            ),
          ],
        ),
        const Spacer(),
        Image.asset('assets/images/avatar.png')
      ],
    );
  }
}
