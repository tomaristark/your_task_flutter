import 'package:your_task_flutter/data/vo/todo_vo.dart';
import 'package:your_task_flutter/persistent/dao/todo_dao.dart';

class TodoModel{
  TodoModel._();

  static final TodoModel _singleton = TodoModel._();

  factory TodoModel() => _singleton;

  final ToDoDAO  _toDoDAO =ToDoDAO();

  // Stream<List<ToDoVO>?>get getTodoStream =>ToDoDAO().getTodoStream();

  // Future <void> saveWithAsync()async{
  //   await Future.delayed(Duration(seconds: 3));
  //   final todo = [ToDoVO("hihi", "dawdawdaw", "12-10-23", "4:58PM", true)];
  //   saveList(todo);
  // }
  // void saveList(List<ToDoVO> toDo){
  //     _toDoDAO.saveToList(toDo);
  // } 
  void saveTask (ToDoVO todo){
    _toDoDAO.saveTask(todo);
  }

  List<ToDoVO> ? get getTaskList => _toDoDAO.getTaskList;


  // List<ToDoVO>?getList() => _toDoDAO.getFromList() ?? [];
}