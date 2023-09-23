import 'package:hive/hive.dart';

class TodoHiveDataBase {
  List toDoList = [];

  //Refrence the task box
  final _myBox = Hive.box('taskBox');

  //method for oppening the app for the first time.
  void createInitialData() {
    toDoList = [
      [
        'Remove task by sliding it to lift',
        false,
      ],
    ];
  }

  void loadData() {
    toDoList = _myBox.get('ToDoList');
  }

  void updateDtaBase() {
    _myBox.put('ToDoList', toDoList);
  }
}
