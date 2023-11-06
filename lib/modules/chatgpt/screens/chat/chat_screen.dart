import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:taskify/modules/chatgpt/screens/chat/models/messageModel.dart';
import 'package:taskify/resources/colors.dart';
import 'package:taskify/shared/dark_theme/dark_theme_provider.dart';
import 'package:taskify/shared/layout/widgets/layout.dart';
import 'package:uuid/uuid.dart';
import 'package:openai_client/openai_client.dart';
import 'package:openai_client/src/model/openai_chat/chat_message.dart';

part 'widgets/body.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  static String id = "chat_screen";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("ChatGPT")),
      body: Body(),
    );
  }
}
