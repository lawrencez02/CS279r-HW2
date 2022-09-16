import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/todo_provider.dart';
import '../widgets/todo_action.dart';

// class for the homepage of the to-do list webapp
class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);
  // override the default createState function to add our own configurable state
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  // controller for editable text field for user to add tasks to list with
  final _textFieldController = TextEditingController();
  // newTask string populated when user enters a new task to add to the list
  String newTask = '';
  //creating initState() for adding listener to controller
  @override
  void initState() {
    super.initState();
    _textFieldController.addListener(() {
      // set the newTask string in code equal to whatever the user is typing
      newTask = _textFieldController.text;
    });
  }

  //Helper function for disposing the controller for clean-up
  @override
  void dispose() {
    _textFieldController.dispose();
    super.dispose();
  }

  // Helper function for when user submits add task form
  void _submit() {
    // add the task that the user entered
    Provider.of<TodoProvider>(context, listen: false).addTask(newTask);
    // cancel the pop-up modal/dialog so that the user sees the main homepage
    Navigator.pop(context);
    // clear the text field once the task is submitted to be added to the list
    _textFieldController.clear();
  }

  // build the appearance of the main part of the homepage
  @override
  Widget build(BuildContext context) {
    // Helper function to display the pop-up/dialog for the user to add a new item
    Future<void> _showAddTextDialog() async {
      return showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              // title of dialog
              title: const Text("Add a new Task"),
              // text field that user types into
              content: TextField(
                autofocus: true,
                // link this text field to the controller we defined above
                controller: _textFieldController,
                // background text within the text input field
                decoration: const InputDecoration(hintText: "Add New Task"),
                // when user submits, call the relevant helper function we defined
                onSubmitted: (_) => _submit(),
              ),
              // list of actions possible on this dialog
              actions: [
                // only action is to submit
                ElevatedButton(
                  // submit when button is pressed
                  onPressed: _submit,
                  // title of button
                  child: const Text("Submit"),
                  // style of button
                  style: ElevatedButton.styleFrom(
                      minimumSize: const Size(120, 40)),
                )
              ],
              // shape of pop-up/dialog
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              // alignment of pop-up/dialog
              actionsAlignment: MainAxisAlignment.center,
            );
          });
    }

    // appearance of homepage
    return Scaffold(
      // application title bar at top of homepage
      appBar: AppBar(
        // title of application
        title: const Text("ToDo App"),
      ),
      // body of webpage is list of tasks that TodoAction aggregates and displays
      body: TodoAction(),
      // floating button for adding a new task
      floatingActionButton: FloatingActionButton(
        onPressed: (() {
          // show the pop-up/dialog we programmed above for user to add a new task to list
          _showAddTextDialog();
        }),
        child: const Icon(Icons.add),
        // text that appears when you hover over button, to remind you of its purpose
        tooltip: "Add a todo",
      ),
    );
  }
}
