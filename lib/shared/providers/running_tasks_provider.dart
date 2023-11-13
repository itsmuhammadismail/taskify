import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

import 'package:taskify/modules/tasks/screens/create/create_screen.dart';
import 'package:taskify/shared/network/network.dart';
import 'package:taskify/shared/providers/user_provider.dart';
import 'package:uuid/uuid.dart';

class RunningTaskInterface {
  final Task task;

  RunningTaskInterface({
    required this.task,
  });

  // Add a converter to from JSON
  static RunningTaskInterface fromJSON(Map<String, dynamic> jsonData) {
    return RunningTaskInterface(
      task: Task(
        desc: jsonData['desc'],
        due_date: jsonData['due_date'],
        id: jsonData['id'],
        status: jsonData['status'],
      ),
    );
  }

  // Add a converter to from an encoded JSON string
  static RunningTaskInterface fromJSONString(String jsonDataString) {
    Map<String, dynamic> jsonData = json.decode(jsonDataString);
    return RunningTaskInterface.fromJSON(jsonData);
  }

  // Add a converter to JSON
  dynamic toJSON() {
    return {
      "desc": task.desc,
      "id": task.id,
      "status": task.status,
      "due_date": task.due_date,
    };
  }

  // Add a converter to JSON string
  String toJSONString() {
    return json.encode(toJSON());
  }
}

class RunningTaskProvider with ChangeNotifier {
  late List<RunningTaskInterface> _runningTasks = [];
  List<RunningTaskInterface> get runningTasks => _runningTasks;

  RunningTaskProvider() {
    getData();
  }

  void getData() async {
    final prefs = await SharedPreferences.getInstance();
    String? userString = prefs.getString("user");
    userString ??= "";

    // Load the data into the state
    var user = UserInterface.fromJSONString(userString);

    var res = await NetworkHelper.request(
      url: '/tasks/started/?id=${user.id}',
      method: 'GET',
    );

    var runningtasks = res
        .map<RunningTaskInterface>((task) => RunningTaskInterface(
            task: Task(
                id: task['id'],
                desc: task['desc'],
                due_date: task['due_date'],
                status: task['status'])))
        .toList();

    _runningTasks = runningtasks;
    notifyListeners();
  }

  updateRunningTasks(List<Task> tasks) {
    var newTasks =
        tasks.map((task) => RunningTaskInterface(task: task)).toList();
    _runningTasks = newTasks;
    notifyListeners();
  }

  clearRunningTask() {
    _runningTasks = [];
    notifyListeners();
  }
}
