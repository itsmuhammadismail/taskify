import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:openai_client/openai_client.dart';
import 'package:provider/provider.dart';
import 'package:taskify/resources/colors.dart';
import 'package:taskify/shared/dark_theme/dark_theme_provider.dart';
import 'package:taskify/shared/providers/running_tasks_provider.dart';
import 'package:taskify/shared/providers/todo_tasks_provider.dart';
import 'package:openai_client/src/model/openai_chat/chat_message.dart';

class NotificationCard extends HookWidget {
  NotificationCard({
    super.key,
  });

  static final configuration = OpenAIConfiguration(
    apiKey: dotenv.env['OPEN_AI_KEY'] ?? '',
  );

  final client = OpenAIClient(
    configuration: configuration,
    enableLogging: true,
  );

  @override
  Widget build(BuildContext context) {
    final themeChange = context.watch<DarkThemeProvider>();
    final todoTasks = context.watch<TodoTaskProvider>().todoTasks;
    final runningTasks = context.watch<RunningTaskProvider>().runningTasks;

    final suggestion = useState<String>('');

    chatGpt() async {
      var myRunningTasks = runningTasks.map((task) => task.task.desc).toList();
      var myTodoTasks = todoTasks.map((task) => task.task.desc).toList();

      String text =
          'These are the task I need to do ```${myTodoTasks.toString()}``` and these are the task which I am currently working on ```${myRunningTasks.toString()}```. Please suggest the task from my todo task which I can do in parellel with my currently running tasks';

      try {
        final chat = await client.chat.create(
          model: 'gpt-3.5-turbo',
          messages: [
            ChatMessage(
              role: 'user',
              content: text,
            )
          ],
        ).data;

        // print(chat.choices[0].message.content);
        suggestion.value = chat.choices[0].message.content;
      } catch (e) {}
    }

    useEffect(() {
      if (todoTasks.length > 0 && runningTasks.length > 0) {
        chatGpt();
      }
    }, [todoTasks.length, runningTasks.length]);

    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
          color: themeChange.darkTheme ? Colors.grey.shade800 : kHomeCardColor,
          borderRadius: BorderRadius.circular(16)),
      child: suggestion.value == ''
          ? Row(
              children: [
                const Text("You are doing great"),
                const SizedBox(width: 10),
                Image.asset('assets/images/like.png'),
              ],
            )
          : Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'System Suggestion',
                  style: TextStyle(
                    color: kPrimaryColor,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 8),
                Text(suggestion.value),
              ],
            ),
    );
  }
}
