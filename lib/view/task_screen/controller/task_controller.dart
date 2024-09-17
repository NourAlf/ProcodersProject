import 'dart:io';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../../Model/task.dart';


class TaskController extends GetxController {
  // A list to hold tasks, wrapped in Rx to make it observable
  var tasks = <Task>[].obs;
  var isDarkMode =false.obs;
  final storage= GetStorage();
  @override
  void onInit() {
    super.onInit();
    loadTasks();
    loadTheme();
  }

  //load all exicted task :
  void  loadTasks(){
    List<dynamic> exictedTasks= storage.read<List>("tasks")?? [];
    tasks.assignAll(exictedTasks.map((task) => Task.fromJson(task)).toList());
  }


  // Add a new note
  void addNote(String title, String content) {
    tasks.add(Task(title: title, content: content));
    saveNotes();
    update();
  }

  // Update an existing note
  void updateNote(int index, String title, String content) {
    tasks[index].title = title;
    tasks[index].content = content;

    tasks.refresh();  // This will notify GetX to rebuild the UI with updated data
    saveNotes(); // Ensure the updated task is saved
  }


  // Delete a note
  void deleteNote(int index) {
    tasks.removeAt(index);
    saveNotes();
  }

  // Save notes to GetStorage
  void saveNotes() {
    storage.write('tasks', tasks.map((note) => note.toJson()).toList());
    update();
  }

  // Toggle between dark mode and light mode
  void toggleTheme() {
    isDarkMode.value = !isDarkMode.value;
    saveTheme();
  }

  // Save current theme to GetStorage
  void saveTheme() {
    storage.write('isDarkMode', isDarkMode.value);
  }

  // Load saved theme from GetStorage
  void loadTheme() {
    isDarkMode.value = storage.read('isDarkMode') ?? false;
  }
}
