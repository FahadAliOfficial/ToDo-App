import 'package:hive_flutter/hive_flutter.dart';

class todoDatabase{

  final _box = Hive.box('mybox');
  List todoList = [];



  void createInitialData(){
    todoList = [
    ["First", false],
    ["Second", true],
  ];
  }

  void loadData(){
    todoList = _box.get('TODOLIST');
  }

  void updateData(){
    _box.put("TODOLIST", todoList);
  }

}