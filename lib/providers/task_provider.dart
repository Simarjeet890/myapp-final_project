import 'package:myapp/services/task_service.dart';
import 'package:flutter/material.dart';
import 'package:myapp/models/task_model.dart';

//Actually, it helps to import task service, tasl model and flutter UI//

class TaskProvider extends ChangeNotifier {
  final TaskService taskService = TaskService();
  List<Task> tasks = [];

  Future<void> loadTasks() async {
    tasks = await taskService.fetchTasks();
    notifyListeners();
  }
//it helps to refreshes the app and it gets the data from the database//

  Future<void> addTask(String name) async {
    if (name.trim().isNotEmpty) {
      final id = await taskService.addTask(name.trim());
      tasks.add(Task(id: id, name: name.trim(), completed: false));
      notifyListeners();
    }
  }

  Future<void> updateTask(int index, bool completed) async {
    final task = tasks[index];
    await taskService.updateTask(task.id, completed);
    notifyListeners();
  }

  Future<void> removeTask(int index) async {
    final task = tasks[index];
    await taskService.deleteTask(task.id);
    notifyListeners();
  }
}

//it helps to add loading data , deleting and update the changes when happens in the code//

