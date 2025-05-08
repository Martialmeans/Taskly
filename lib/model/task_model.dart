class Task {
  String taskName;
  bool isComplete;

  Task({required this.taskName, this.isComplete = false});

  void complete() {
    isComplete = !isComplete;
  }
}