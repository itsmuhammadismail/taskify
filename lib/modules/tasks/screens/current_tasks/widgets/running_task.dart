import 'package:flutter/material.dart';
import 'package:taskify/modules/tasks/screens/create/create_screen.dart';

class RunningTask extends StatelessWidget {
  final Task task;
  final Function onComplete;

  const RunningTask({
    super.key,
    required this.task,
    required this.onComplete,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Started at: ${task.due_date}'),
        SizedBox(height: 5),
        ListTile(
          title: Text(task.desc),
          trailing: TextButton(onPressed: () {
            onComplete(task.id);
          }, child: Text('Complete')),
        ),
        SizedBox(height: 10),
      ],
    );
  }
}
