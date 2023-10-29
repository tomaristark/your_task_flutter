

import 'dart:async';
import 'dart:convert';

import 'package:your_task_flutter/constant/date_time_constant.dart';
import 'package:your_task_flutter/data/vo/todo_vo.dart';
import 'package:your_task_flutter/page/home_page.dart';
import 'package:your_task_flutter/persistent/dao/pref_instance.dart';

class ToDoDAO{

  ToDoDAO._(){

  }

  static final ToDoDAO _singleton = ToDoDAO._();

  factory ToDoDAO()=>_singleton;

  final StreamController<List<ToDoVO>?> _todoStream = StreamController<List<ToDoVO>?>();

  Stream <List<ToDoVO>?> getTodoStream() => _todoStream.stream;

  void saveToList(List<ToDoVO>  toDoList){
    List<String>encodeList = toDoList.map((e) => jsonEncode(e.toJson())).toList();
    PrefInstance.getSharePreferences.setStringList(kFormatSelectDate,encodeList);
    _todoStream.sink.add(toDoList);
  }

  List<ToDoVO> ? getFromList(){
    List<String>? encodeList = PrefInstance.getSharePreferences.getStringList(kFormatDate);
    if(encodeList != null){
      List<ToDoVO>list =encodeList.map((e) => ToDoVO.fromJson(jsonDecode(e))).toList();
      return list;
  }else{
    return [];
  }
  
  }
  void closeStream()=>_todoStream.close();
}