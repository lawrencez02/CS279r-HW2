import 'package:flutter/material.dart';
import 'dart:collection';
import '../models/todo_model.dart';

// class that is instantiated in main.dart and stores the list of tasks and their states
class TodoProvider with ChangeNotifier {
  // list of tasks
  List<TodoModel> _tasks = [];
  // Helper to get list of all tasks
  UnmodifiableListView<TodoModel> get allTasks => UnmodifiableListView(_tasks);

  // Helper function to add a task, given the user's input string of what they title it
  void addTask(String task) {
    // add the uncompleted task to our list, with title == user input
    _tasks.add(TodoModel(todoTitle: task, completed: false));
    // notify the webpage to reload the main task list to include this new added task!
    notifyListeners();
  }

  // Helper function called whenever a task is checked/unchecked
  void toggleTask(TodoModel task) {
    // get the index of the task the user checked/unchecked
    final taskIndex = _tasks.indexOf(task);
    // toggle that completed check-box of that task
    _tasks[taskIndex].toggleCompleted();
    // notify the webpage to reload the main task list to include this updated check-box!
    notifyListeners();
  }

  // Helper function called whenever a task is deleted
  void deleteTask(TodoModel task) {
    // remove the appropriate task in the task list
    _tasks.remove(task);
    // notify the webpage to reload the main task list to exclude this deleted task!
    notifyListeners();
  }
}
