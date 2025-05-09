import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:taskly/viewmodel/task_viewmodel.dart';
import 'package:taskly/widgets/dialogbox.dart';

class Taskview extends StatelessWidget {
  const Taskview({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<TaskProvider>(
      builder: (context, taskProvider, child) {
        return Scaffold(
          appBar: AppBar(
            title: Text("Tasks"),
            backgroundColor: Theme.of(context).colorScheme.inversePrimary,
            shadowColor: Colors.grey,
            elevation: 2.0,
            centerTitle: true,
          ),
          body: ListView.builder(
            itemCount: taskProvider.tasks.length,
            itemBuilder: (context, index) {
              final task = taskProvider.tasks[index];
              return GestureDetector(
                onLongPress: () {
                  taskProvider.removeTask(index);
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text("Task Deleted"),
                      duration: Duration(seconds: 2),
                      action: SnackBarAction(
                        label: "Undo",
                        onPressed: () {
                          taskProvider.addtask(task.taskName);
                        },
                      ),
                    ),
                  );
                },
                child: CheckboxListTile(
                  title: Text(
                    task.taskName,
                    style: TextStyle(
                      decoration: task.isComplete
                              ? TextDecoration.lineThrough
                              : TextDecoration.none,
                    ),
                  ),
                  value: task.isComplete,
                  controlAffinity: ListTileControlAffinity.leading,
                  onChanged: (value) {
                    taskProvider.completeTask(index);
                  },
                ),
              );
            },
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              dialogBox(context, taskProvider.controller, taskProvider.addtask);
            },
            shape: CircleBorder(),
            child: Icon(Icons.add),
          ),
        );
      },
    );
  }
}
