import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../view/controller/task_controller.dart';
import 'listtile.dart';

class ListViewTask extends StatelessWidget {
  final TaskController taskController = Get.find<TaskController>();

  @override
  Widget build(BuildContext context) {
    return Obx(() => ListView.builder(
      itemCount: taskController.tasks.length,
      itemBuilder: (context, index) {
        return ListTileTask(index: index);
      },
    ));
  }
}
