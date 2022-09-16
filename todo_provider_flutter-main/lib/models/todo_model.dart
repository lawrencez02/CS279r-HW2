// class of each item in the to-do list
class TodoModel {
  // title of the to-do item, given initially by user input
  String todoTitle;
  // whether this task is checked-off or not
  bool completed;
  // task item initializer: not completed, and title is required from user
  TodoModel({required this.todoTitle, this.completed = false});

  // Helper function to toggle the checked-off/not-checked-off state of this task
  void toggleCompleted() {
    completed = !completed;
  }
}
