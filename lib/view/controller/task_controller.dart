import 'package:get/get.dart';
import '../../models/task_model.dart';

class TaskController extends GetxController {
  var tasks = <Task>[].obs;

  // إضافة مهمة جديدة
  void addTask(String title) {
    tasks.insert(0, Task(description: title));
  }

  // حذف مهمة
  void deleteTask(int index) {
    tasks.removeAt(index);
  }

  void taskCompletion(int index) {
    tasks[index].isCompleted = !tasks[index].isCompleted;
    tasks.refresh();
  }
}
