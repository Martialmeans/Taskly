import 'package:flutter/material.dart';
import 'package:taskly/model/task_model.dart';

class TaskProvider extends ChangeNotifier {
  final TextEditingController controller = TextEditingController();
  final List<Task> _task = [];
  List<Task> get tasks => _task;

  void addtask(String taskName) {
    _task.add(Task(taskName: taskName));
    notifyListeners();
  }

  void completeTask(int index) {
    _task[index].complete();
    notifyListeners();
  }
}