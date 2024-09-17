import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:procoders_flutter/view/task_screen/controller/task_controller.dart';
import '../../../Model/task.dart';
import 'list_task.dart';

class NoteApp extends StatelessWidget {
  final TaskController noteController = Get.put(TaskController());

  @override
  Widget build(BuildContext context) {
    return Obx(() => GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Tasks List',
      theme: noteController.isDarkMode.value
          ? ThemeData.dark()
          : ThemeData.light(),
      home: TaskListPage(),
    ));
  }
}


