import 'package:flutter/material.dart';
import 'package:taskify/modules/chatgpt/screens/chat/chat_screen.dart';
import 'package:taskify/shared/routes/navigate.dart';

class ChatGPT extends StatelessWidget {
  const ChatGPT({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        gradient: const LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Color(0xFFABDEE6),
            Color(0xFFCBAACB),
          ],
        ),
      ),
      child: InkWell(
        onTap: () => Navigate.to(context, ChatScreen.id),
        child: Row(
          children: [
            Image.asset('assets/icons/search.png'),
            const SizedBox(width: 10),
            const Text(
              "Search with Chatgpt",
              style: TextStyle(color: Colors.white, fontSize: 16),
            ),
            const Spacer(),
            Image.asset('assets/icons/equalizer.png'),
          ],
        ),
      ),
    );
  }
}
