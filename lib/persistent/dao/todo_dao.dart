import 'package:your_task_flutter/data/vo/todo_vo.dart';

abstract class ToDoDAO{
  void saveList(List<ToDoVO> toDoList);

  void saveOneTask(ToDoVO toDoVO);

  List<ToDoVO> ? getList ();

  ToDoVO ? getOneTask(String taskName);

  void deleteOneTask(int index);
}