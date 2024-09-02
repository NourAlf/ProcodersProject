import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../widgets/listviewtask.dart';
import '../controller/task_controller.dart';
import 'add_task_screen.dart';


class TaskScreen extends StatelessWidget {
  final TaskController taskController = Get.put(TaskController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.pink[100],
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
            isScrollControlled: true,
            context: context,
            builder: (context) => SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.only(
                    bottom: MediaQuery.of(context).viewInsets.bottom),
                child: AddTaskScreen(),
              ),
            ),
          );
        },
        backgroundColor: Colors.pink,
        child: Icon(Icons.add, color: Colors.white),
      ),
      body: Container(
        padding: const EdgeInsets.only(
            top: 60, left: 20, right: 20, bottom: 80),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(Icons.featured_play_list_outlined,
                    color: Colors.white, size: 40),
                SizedBox(width: MediaQuery.of(context).size.width * 0.05),
                Text(
                  "ToDoList",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 30,
                      fontWeight: FontWeight.bold),
                )
              ],
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.05),
            Obx(() => Text(
              "${taskController.tasks.length} Tasks",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            )),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(20))),
                child: ListViewTask(),
              ),
            )
          ],
        ),
      ),
    );
  }
}
