import 'package:stream_transform/stream_transform.dart';
import 'package:your_task_flutter/data/vo/todo_vo.dart';
import 'package:your_task_flutter/persistent/dao/todo_dao.dart';
import 'package:your_task_flutter/persistent/dao/todo_dao_impl.dart';

class ToDoModel{
  ToDoModel._();

  static final ToDoModel _singleton = ToDoModel._();

  factory ToDoModel()=> _singleton;

  final ToDoDAO _toDoDAO = ToDoDAOImpl();


  void saveList(List<ToDoVO> toDoList) => _toDoDAO.saveList(toDoList);

  void saveOneTask(ToDoVO oneTask)=> _toDoDAO.saveOneTask(oneTask);

  void deleteOneTask (int index) =>_toDoDAO.deleteOneTask(index);
  List<ToDoVO> ? getList()=> _toDoDAO.getList();


  ToDoVO? getOneTask(String taskName)=> _toDoDAO.getOneTask(taskName);

  Stream<List<ToDoVO>?> get getToDoStream =>ToDoDAOImpl().
  watchBox().
  startWithStream(ToDoDAOImpl().getListStream()).
  map((event) => _toDoDAO.getList());
}