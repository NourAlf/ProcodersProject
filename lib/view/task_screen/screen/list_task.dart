import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../Model/task.dart';
import '../controller/task_controller.dart';

class TaskListPage extends StatelessWidget {
  final TaskController noteController = Get.find<TaskController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Notes Manager'),
        actions: [
          IconButton(
            icon: Icon(Icons.brightness_6),
            onPressed: noteController.toggleTheme,
          )
        ],
      ),
      body: Obx(() => noteController.tasks.isEmpty
          ? Center(child: Text('No notes available.'))
          : ListView.builder(
                  itemCount: noteController.tasks.length,
                  itemBuilder: (context, index) {
          final note = noteController.tasks[index];
          return Card(
            child: ListTile(
              title: Text(note.title),
              subtitle: Text(note.content),
              leading: Icon(Icons.note, color: Color(0xFF997DA444)),

              onTap: () => _editNoteDialog(context, note, index),
              trailing: IconButton(
                icon: Icon(Icons.delete, color: Colors.red),
                onPressed: () {
                  noteController.deleteNote(index);
                },
              ),
            ),
          );
                  },
                )),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _addNoteDialog(context),
        child: Icon(Icons.add),
      ),
    );
  }

  void _addNoteDialog(BuildContext context) {
    final titleController = TextEditingController();
    final contentController = TextEditingController();

    Get.defaultDialog(
      title: 'Add New Note',
      content: Column(
        children: [
          TextField(
            controller: titleController,
            decoration: InputDecoration(hintText: 'Enter note title'),
          ),
          TextField(
            controller: contentController,
            decoration: InputDecoration(hintText: 'Enter note content'),
          ),
        ],
      ),
      textConfirm: 'Add',
      onConfirm: () {
        if (titleController.text.isNotEmpty &&
            contentController.text.isNotEmpty) {

          // إضافة الملاحظة
          noteController.addNote(
            titleController.text.trim(),
            contentController.text.trim(),
          );

          // إزالة التركيز من الحقول النصية
          FocusScope.of(context).unfocus();

          // إغلاق مربع الحوار
          Get.back();
        }
      },
      textCancel: 'Cancel',
    );
  }

  void _editNoteDialog(BuildContext context, Task task, int index) {
    final titleController = TextEditingController(text: task.title);
    final contentController = TextEditingController(text: task.content);

    Get.defaultDialog(
      title: 'Edit Note',
      content: Column(
        children: [
          TextField(
            controller: titleController,
            decoration: InputDecoration(hintText: 'Enter note title'),
          ),
          TextField(
            controller: contentController,
            decoration: InputDecoration(hintText: 'Enter note content'),
          ),
        ],
      ),
      textConfirm: 'Save',
      onConfirm: () {
        if (titleController.text.isNotEmpty &&
            contentController.text.isNotEmpty) {

          // تحديث الملاحظة
          noteController.updateNote(
            index,
            titleController.text.trim(),
            contentController.text.trim(),
          );

          // إزالة التركيز من الحقول النصية
          FocusScope.of(context).unfocus();

          // إغلاق مربع الحوار
          Get.back();
        }
      },
      textCancel: 'Cancel',
    );
  }

}