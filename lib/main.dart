import 'package:flutter/material.dart';

import 'package:your_task_flutter/page/home_page.dart';
import 'package:your_task_flutter/persistent/dao/pref_instance.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await PrefInstance.createSharePreferenceInstance();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

   
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'your_task',
      theme: ThemeData(
        colorScheme: const ColorScheme.light(primary: Colors.redAccent)
      ),
      home: const HomePage() ,
    );
  }
}

