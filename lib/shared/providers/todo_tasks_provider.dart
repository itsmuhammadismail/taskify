import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

import 'package:taskify/modules/tasks/screens/create/create_screen.dart';
import 'package:taskify/shared/network/network.dart';
import 'package:taskify/shared/providers/user_provider.dart';
import 'package:uuid/uuid.dart';

class TodoTaskInterface {
  final Task task;

  TodoTaskInterface({
    required this.task,
  });

  // Add a converter to from JSON
  static TodoTaskInterface fromJSON(Map<String, dynamic> jsonData) {
    return TodoTaskInterface(
      task: Task(
        desc: jsonData['desc'],
        due_date: jsonData['due_date'],
        updated_at: jsonData['updated_at'],
        id: jsonData['id'],
        status: jsonData['status'],
      ),
    );
  }

  // Add a converter to from an encoded JSON string
  static TodoTaskInterface fromJSONString(String jsonDataString) {
    Map<String, dynamic> jsonData = json.decode(jsonDataString);
    return TodoTaskInterface.fromJSON(jsonData);
  }

  // Add a converter to JSON
  dynamic toJSON() {
    return {
      "desc": task.desc,
      "id": task.id,
      "status": task.status,
      "due_date": task.due_date,
      "updated_at": task.updated_at,
    };
  }

  // Add a converter to JSON string
  String toJSONString() {
    return json.encode(toJSON());
  }
}

class TodoTaskProvider with ChangeNotifier {
  late List<TodoTaskInterface> _todoTasks = [];
  List<TodoTaskInterface> get todoTasks => _todoTasks;

  TodoTaskProvider() {
    getData();
  }

  void getData() async {
    final prefs = await SharedPreferences.getInstance();
    String? userString = prefs.getString("user");
    userString ??= "";

    // Load the data into the state
    var user = UserInterface.fromJSONString(userString);

    var res = await NetworkHelper.request(
      url: '/tasks?id=${user.id}',
      method: 'GET',
    );

    var todotasks = res
        .map<TodoTaskInterface>(
          (task) => TodoTaskInterface(
            task: Task(
              id: task['id'],
              desc: task['desc'],
              due_date: task['due_date'],
              updated_at: task['updated_at'],
              status: task['status'],
            ),
          ),
        )
        .toList();

    _todoTasks = todotasks;
    notifyListeners();
  }

  updateTodoTasks(List<Task> tasks) {
    var newTasks = tasks.map((task) => TodoTaskInterface(task: task)).toList();
    _todoTasks = newTasks;
    notifyListeners();
  }

  clearTodoTask() {
    _todoTasks = [];
    notifyListeners();
  }
}
