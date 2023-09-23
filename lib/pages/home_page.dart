import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:to_do/data/hive_database.dart';
import 'package:to_do/themes/colors.dart';
import 'package:to_do/widgets/dialog_box.dart';
import 'package:to_do/widgets/to_do_list.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _myBox = Hive.box('taskBox');
  final _contoller = TextEditingController();
  TodoHiveDataBase tdb = TodoHiveDataBase();

  @override
  void initState() {
    //oppening app for the first time.
    if(_myBox.get('ToDoList') == null){
      tdb.createInitialData();
    }
    else{
      tdb.loadData();
    }
    super.initState();
  }

  void checkBoxChanged(bool? value, int index) {
    setState(() {
      tdb.toDoList[index][1] = !tdb.toDoList[index][1];
    });
    tdb.updateDtaBase();
  }

  void saveTask() {
    setState(() {
      tdb.toDoList.add([_contoller.text, false]);
      _contoller.clear();
    });
    Navigator.of(context).pop();
    tdb.updateDtaBase();
  }

  //creating new task
  void createNewTask() {
    showDialog(
      context: context,
      builder: (context) {
        return DialogBox(
          controller: _contoller,
          onSave: saveTask,
          onCansel: () => Navigator.of(context).pop(),
        );
      },
    );
  }

  //deleting tasks
  void deleteTask(int index){
    setState(() {
      tdb.toDoList.removeAt(index);
    });
    tdb.updateDtaBase();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appColor,
      appBar: AppBar(
        title: Center(
          child: Text('To Do App'),
        ),
        elevation: 0,
      ),
      body: ListView.builder(
        itemCount: tdb.toDoList.length,
        itemBuilder: (context, index) {
          return ToDoList(
            taskName: tdb.toDoList[index][0],
            isComoleted: tdb.toDoList[index][1],
            onChanged: (value) => checkBoxChanged(value, index),
            deleteTask: (context) => deleteTask(index),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: appBarColor,
        shape: CircleBorder(),
        onPressed: createNewTask,
        child: Icon(
          Icons.add,
          color: white,
        ),
      ),
    );
  }
}
