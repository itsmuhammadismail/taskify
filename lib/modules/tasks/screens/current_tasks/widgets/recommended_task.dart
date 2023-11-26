import 'package:flutter/material.dart';
import 'package:taskify/main.dart';
import 'package:taskify/modules/tasks/screens/create/create_screen.dart';

class RecommendedTask extends StatelessWidget {
  final Task task;
  final Function onStart;

  const RecommendedTask({
    super.key,
    required this.task,
    required this.onStart,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text('Priority: ${task.status.capitalize()} '),
            Spacer(),
            Text('Due Date: ${task.due_date.split(" ")[0]}'),
          ],
        ),
        SizedBox(height: 5),
        ListTile(
          title: Text(task.desc),
          trailing: TextButton(
            onPressed: () {
              onStart(task.id);
            },
            child: Text('Start'),
          ),
        ),
        SizedBox(height: 10),
      ],
    );
  }
}
