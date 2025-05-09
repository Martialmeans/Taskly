import 'package:flutter/material.dart';
import 'package:hive_ce_flutter/adapters.dart';
import 'package:taskly/model/task_model.dart';

class TaskProvider extends ChangeNotifier {
  final TextEditingController controller = TextEditingController();

  final Box<Task> _taskBox = Hive.box<Task>('tasks');
  List<Task> get tasks => _taskBox.values.toList();

  void addtask(String taskName) {
    _taskBox.add(Task(taskName: taskName));
    notifyListeners();
  }

  void completeTask(int index) {
    final task = _taskBox.getAt(index);
    task?.complete();
    task?.save();
    notifyListeners();
  }

  void removeTask(int index) {
    _taskBox.deleteAt(index);
    notifyListeners();
  }
}