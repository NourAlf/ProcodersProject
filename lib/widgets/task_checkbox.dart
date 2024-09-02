import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../view/controller/task_controller.dart';

class TaskCheckBox extends StatelessWidget {
  final int index;
  final TaskController taskController = Get.find<TaskController>();

  TaskCheckBox({required this.index});

  @override
  Widget build(BuildContext context) {
    return Checkbox(
      activeColor: Colors.pink[100],
      value: taskController.tasks[index].isCompleted,
      onChanged: (_) {
        taskController.taskCompletion(index);
      },
    );
  }
}
