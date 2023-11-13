import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:taskify/modules/tasks/screens/create/create_screen.dart';
import 'package:taskify/modules/tasks/screens/current_tasks/current_tasks_screen.dart';
import 'package:taskify/shared/dark_theme/dark_theme_provider.dart';
import 'package:taskify/shared/network/network.dart';
import 'package:taskify/shared/providers/running_tasks_provider.dart';
import 'package:taskify/shared/providers/user_provider.dart';
import 'package:taskify/shared/routes/navigate.dart';

class ViewTask extends StatefulWidget {
  const ViewTask({super.key});

  @override
  State<ViewTask> createState() => _ViewTaskState();
}

class _ViewTaskState extends State<ViewTask> {
  @override
  Widget build(BuildContext context) {
    final themeChange = Provider.of<DarkThemeProvider>(context);
    var runningTasks = context.watch<RunningTaskProvider>().runningTasks;

    return Column(
      children: [
        Row(
          children: [
            Text(
              "Current task",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: themeChange.darkTheme ? Colors.white : Color(0xFF161616),
              ),
            ),
            Spacer(),
            GestureDetector(
              onTap: () => Navigate.to(context, CurrentTasksScreen.id),
              child: Row(
                children: [
                  Text("tasks of the day"),
                  Icon(Icons.arrow_forward_ios)
                ],
              ),
            )
          ],
        ),
        const SizedBox(height: 10),
        GestureDetector(
          onTap: () => Navigate.to(context, CurrentTasksScreen.id),
          child: Container(
            width: double.infinity,
            constraints: BoxConstraints(minHeight: 130),
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            decoration: BoxDecoration(
                color: const Color(0xFF69B9F2),
                borderRadius: BorderRadius.circular(16)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // const Row(
                //   children: [
                //     Chip(
                //       label: Text(
                //         "Youtube",
                //         style: TextStyle(color: Colors.white),
                //       ),
                //       backgroundColor: Colors.red,
                //     ),
                //     SizedBox(width: 10),
                //     Chip(
                //       label: Text(
                //         "Progress 32%",
                //         style: TextStyle(color: Colors.white),
                //       ),
                //       backgroundColor: Colors.green,
                //     ),
                //   ],
                // ),
                const SizedBox(height: 20),
                // const Text(
                //   "YouTube tutorial",
                //   style: TextStyle(
                //     color: Colors.white,
                //     fontWeight: FontWeight.bold,
                //     fontSize: 30,
                //   ),
                // ),

                if (runningTasks.length == 0)
                  const Text(
                    "No task is running",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 26,
                    ),
                  )
                else if (runningTasks.length > 2)
                  ...runningTasks
                      .sublist(0, 2)
                      .map((task) => Column(
                            children: [
                              Text(
                                task.task.desc,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 26,
                                ),
                              ),
                              const SizedBox(height: 10),
                            ],
                          ))
                      .toList()
                else
                  ...runningTasks
                      .map((task) => Column(
                            children: [
                              Text(
                                task.task.desc,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 26,
                                ),
                              ),
                              const SizedBox(height: 10),
                            ],
                          ))
                      .toList(),

                const SizedBox(height: 10),
                // Row(
                //   children: [
                //     SizedBox(
                //         height: 24.0,
                //         width: 24.0,
                //         child: Checkbox(
                //           value: true,
                //           onChanged: (value) {},
                //         )),
                //     const Padding(
                //       padding: EdgeInsets.only(left: 10),
                //       child: Text(
                //         "Watch every three days",
                //         style: TextStyle(color: Colors.white),
                //       ),
                //     ),
                //   ],
                // ),
                // Row(
                //   children: [
                //     SizedBox(
                //       height: 24.0,
                //       width: 24.0,
                //       child: Checkbox(
                //         value: false,
                //         onChanged: (value) {},
                //       ),
                //     ),
                //     const Padding(
                //       padding: EdgeInsets.only(left: 10),
                //       child: Text(
                //         "Leave Like",
                //         style: TextStyle(color: Colors.white),
                //       ),
                //     ),
                //   ],
                // ),
                const SizedBox(height: 10),
              ],
            ),
          ),
        )
      ],
    );
  }
}
