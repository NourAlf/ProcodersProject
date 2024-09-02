import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../view/controller/task_controller.dart';

class ListTileTask extends StatelessWidget {
  final TaskController taskController = Get.find<TaskController>();
  final int index;

  ListTileTask({required this.index});

  @override
  Widget build(BuildContext context) {
    final task = taskController.tasks[index];
    return ListTile(
      title: Text(
        task.description,
        style: TextStyle(
          decoration: task.isCompleted
              ? TextDecoration.lineThrough
              : TextDecoration.none,
        ),
      ),
      leading: Checkbox(
        activeColor: Colors.pink[100],
        value: task.isCompleted,
        onChanged: (_) {
          taskController.taskCompletion(index);
        },
      ),
     trailing: IconButton(
        icon: Icon(Icons.delete, color: Colors.red),
    onPressed: () {
    taskController.deleteTask(index);
    },
    ),
      // onTap: () {
      //   taskController.deleteTask(index);
      // },
    );
  }
}
