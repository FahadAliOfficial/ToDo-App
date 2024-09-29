import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:todo/data/database.dart';
import '../utils/todo_tiles.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //DataBase
  final _myBox = Hive.box('mybox');
  todoDatabase db = todoDatabase();

  @override
  void initState() {
    if (_myBox.get("TODOLIST") == null) {
      db.createInitialData();
    } else {
      db.loadData();
    }
    // print(db.todoList);
    super.initState();
  }

  //AlertBox
  TextEditingController taskinput = TextEditingController();

  void onChangedfunc(int index, bool? val) {
    setState(() {
      db.todoList[index][1] = val;
    });
    db.updateData();
  }

  void deleteTask(int index) {
    setState(() {
      db.todoList.removeAt(index);
    });
    db.updateData();
  }

  void _AddMenu() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Task"),
          content: Column(
            mainAxisSize: MainAxisSize
                .min, // Ensure the dialog doesn't expand unnecessarily
            children: [
              TextField(
                controller: taskinput,
                decoration:
                    const InputDecoration(hintText: "Enter your task: "),
              )
            ],
          ),
          actions: <Widget>[
            TextButton(
                onPressed: () {
                  if (taskinput.text.isEmpty) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text("Please enter a task"), duration: Duration(seconds: 1),),
                      
                    );
                  } else {
                    setState(() {
                      db.todoList.add([taskinput.text, false]);
                      taskinput.clear();
                      db.updateData();
                    });
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text("Added Sucessfully"), duration: Duration(seconds: 1),),
                    );
                  }
                },
                child: const Text("Add")),
            TextButton(
              child: const Text("Cancel"),
              onPressed: () {
                taskinput.clear();
                Navigator.of(context).pop(); // Closes the dialog
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple[200],
      body: ListView.builder(
        itemCount: db.todoList.length,
        itemBuilder: (context, index) {
          return Container(
            child: Column(
              children: [
                TodoTile(
                  todoName: db.todoList[index][0],
                  todoChecked: db.todoList[index][1],
                  onChanged: (val) => onChangedfunc(index, val),
                  deletetask: () => deleteTask(index),
                ),
              ],
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _AddMenu,
        backgroundColor: Colors.deepPurple,
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
    );
  }
}
