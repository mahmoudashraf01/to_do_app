import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:to_do/themes/themes.dart';

import 'pages/home_page.dart';

void main() async{
  await Hive.initFlutter();
  var box = await Hive.openBox('taskBox');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      title: 'To Do App',
      debugShowCheckedModeBanner: false,
      home: HomePage(),
      theme: appBarTheme,
    );
  }
}




