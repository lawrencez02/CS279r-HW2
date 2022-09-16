import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/todo_provider.dart';
import '../screens/my_home_page.dart';
import './providers/todo_provider.dart';

void main() {
  // run the application!
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  // the top-level view/build of the application
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: ((context) => TodoProvider()),
      // create a Material Design (Google) application
      child: MaterialApp(
        // title of the to-do app
        title: 'Simple ToDo App',
        debugShowCheckedModeBanner: false,
        // color theme of the to-do app
        theme: ThemeData(
          primarySwatch: Colors.deepPurple,
        ),
        // hompage of the to-do app
        home: const MyHomePage(),
      ),
    );
  }
}
