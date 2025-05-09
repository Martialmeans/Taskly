import 'package:hive_ce/hive.dart';

part 'task_model.g.dart';

@HiveType(typeId: 0)
class Task extends HiveObject {
  @HiveField(0)
  String taskName;

  @HiveField(1)
  bool isComplete;

  Task({required this.taskName, this.isComplete = false});

  void complete() {
    isComplete = !isComplete;
  }
}