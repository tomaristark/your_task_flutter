import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:your_task_flutter/constant/color.dart';

import 'package:your_task_flutter/data/vo/todo_vo.dart';

import 'package:your_task_flutter/page/home_page.dart';
import 'package:your_task_flutter/persistent/hive_constant.dart';


void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
   Hive.registerAdapter(ToDoVOAdapter());
  await Hive.openBox<ToDoVO>(kBoxNameForVO);
 
  runApp(const MyApp());
  

  
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

   
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'your_task',
      theme: ThemeData(
        colorScheme: const ColorScheme.light(primary: kPrimaryColor)
      ),
      home: const HomePage() ,
    );
  }
}

