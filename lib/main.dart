import 'package:flutter/material.dart';
// import 'package:your_task_flutter/data/model/count_model.dart';
import 'package:your_task_flutter/page/home_page.dart';
import 'package:your_task_flutter/persistent/dao/pref_instance.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await PrefInstance.createSharePrefrenceInstance();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

   
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'your_task',
      theme: ThemeData(
        colorScheme: ColorScheme.light(primary: Colors.redAccent)
      ),
      home: const HomePage() ,
    );
  }
}

// class MyHomePage extends StatefulWidget {
//   const MyHomePage({super.key, required this.title});

//   final String title;

//   @override
//   State<MyHomePage> createState() => _MyHomePageState();
// }

// class _MyHomePageState extends State<MyHomePage> {
//   int _counter = 0;
//   CountModel _countModel = CountModel();

//   @override
//   void initState() {
//     _counter=_countModel.getCountValue();
//     super.initState();
//   }

//   void _incrementCounter() {
//     setState(() { 
//       _counter++;
//       _countModel.saveCountValue(_counter);
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Theme.of(context).colorScheme.inversePrimary, 
//         title: Text(widget.title),
//       ),
//       body: Center(
//         child: Column(  
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             const Text(
//               'You have pushed the button this many times:',
//             ),
//             Text(
//               '$_counter',
//               style: Theme.of(context).textTheme.headlineMedium,
//             ),
//           ],
//         ),
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: _incrementCounter,
//         tooltip: 'Increment',
//         child: const Icon(Icons.add),
//       ),  
//     );
//   }
// }
