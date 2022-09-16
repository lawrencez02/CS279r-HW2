import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/todo_provider.dart';

// class that is responsible for displaying the tasks in the list
class TodoAction extends StatelessWidget {
  const TodoAction({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    // get the relevant TodoProvider class which stores what tasks we have
    final task = Provider.of<TodoProvider>(context);
    // build a list with the following
    return ListView.builder(
      // number of tasks
      itemCount: task.allTasks.length,
      // for every item in the to-do task list
      itemBuilder: ((context, index) => ListTile(
            // the row leads/starts with a check-box
            leading: Checkbox(
              // check-box is checked if task is marked as completed, otherwise not checked
              value: task.allTasks[index].completed,
              // if check-box is changed/clicked, then this is toggled 
              onChanged: ((_) => task.toggleTask(task.allTasks[index])),
            ),
            // title of the task
            title: Text(task.allTasks[index].todoTitle),
            // the rows ends/trails with a button
            trailing: IconButton(
                // when pressed, deletes the task item
                onPressed: () {
                  // delete the task
                  task.deleteTask(task.allTasks[index]);
                },
                // load button with trash icon
                icon: const Icon(Icons.delete)),
          )),
    );
  }
}
