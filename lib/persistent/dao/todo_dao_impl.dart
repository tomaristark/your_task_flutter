import 'package:hive/hive.dart';
import 'package:your_task_flutter/constant/date_time_constant.dart';
import 'package:your_task_flutter/data/vo/todo_vo.dart';
import 'package:your_task_flutter/persistent/dao/todo_dao.dart';
import 'package:your_task_flutter/persistent/hive_constant.dart';

class ToDoDAOImpl extends ToDoDAO{
  ToDoDAOImpl._();

  static final ToDoDAOImpl _singleton = ToDoDAOImpl._();
  factory ToDoDAOImpl()=> _singleton;

  Box<ToDoVO> _getToDoBox ()=> Hive.box(kBoxNameForVO);
  @override
  List<ToDoVO>? getList() =>
      _getToDoBox().values.toList();


  @override
  ToDoVO? getOneTask(String taskName) =>
    _getToDoBox().get(taskName);
    

  @override
  void saveList(List<ToDoVO> toDoList) {
    for(ToDoVO todoVO in toDoList){
      _getToDoBox().put(todoVO.taskName, todoVO);
    }
  }

  @override
  void saveOneTask(ToDoVO toDoVO) {
    _getToDoBox().put(toDoVO.taskName, toDoVO);
  }

  Stream<void> watchBox ()=> _getToDoBox().watch();

  Stream<List<ToDoVO>?> getListStream ()=>Stream.value(getList());
  
  @override
  void deleteOneTask(int index) {
   _getToDoBox().deleteAt(index);
  }

  
}