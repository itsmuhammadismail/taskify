import 'dart:async';

import 'package:flutter/material.dart';
import 'package:taskify/modules/tasks/screens/create/create_screen.dart';

class RunningTask extends StatefulWidget {
  final Task task;
  final Function onComplete;

  const RunningTask({
    super.key,
    required this.task,
    required this.onComplete,
  });

  @override
  State<RunningTask> createState() => _RunningTaskState();
}

class _RunningTaskState extends State<RunningTask> {
  String timer = "";

  late Timer mytimer;

  @override
  void initState() {
    // TODO: implement initState
    var updatedDate =
        DateTime.parse(widget.task.updated_at).add(Duration(hours: 5));

    mytimer = Timer.periodic(const Duration(seconds: 1), (Timer t) {
      var currentDate = DateTime.now();
      setState(() {
        timer = currentDate.difference(updatedDate).toString().split(".")[0];
      });
    });
    super.initState();
  }

  void dispose() {
    mytimer.cancel();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
            'Started at: ${DateTime.parse(widget.task.updated_at).add(Duration(hours: 5))}'),
        SizedBox(height: 5),
        Text('Timer: ${timer}'),
        SizedBox(height: 5),
        ListTile(
          title: Text(widget.task.desc),
          trailing: TextButton(
              onPressed: () {
                widget.onComplete(widget.task.id);
              },
              child: Text('Complete')),
        ),
        SizedBox(height: 10),
      ],
    );
  }
}
