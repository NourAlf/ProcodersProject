import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controller/task_controller.dart';

class AddTaskScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final TaskController taskController = Get.find<TaskController>();
    final TextEditingController textEditingController = TextEditingController();

    return Container(
      padding: EdgeInsets.all(30),
      child: Column(
        children: [
          Text(
            "Add Task",
            textAlign: TextAlign.center,
            style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.pink,
                fontSize: 30),
          ),
          TextField(
            autofocus: true,
            textAlign: TextAlign.center,
            controller: textEditingController,
            decoration: InputDecoration(hintText: 'Enter task title'),
          ),
          SizedBox(height: 30),
          TextButton(
              style: TextButton.styleFrom(
                backgroundColor: Colors.pink[100],
              ),
              onPressed: () {
                if (textEditingController.text.isNotEmpty) {
                  taskController
                      .addTask(textEditingController.text.trim());
                  Get.back();
                }
              },
              child: Text(
                "Add",
                style: TextStyle(color: Colors.pink, fontSize: 24),
              ))
        ],
      ),
    );
  }
}
