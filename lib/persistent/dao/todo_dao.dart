

import 'dart:async';
import 'dart:convert';

import 'package:uuid/uuid.dart';
import 'package:your_task_flutter/constant/date_time_constant.dart';
import 'package:your_task_flutter/data/vo/todo_vo.dart';
import 'package:your_task_flutter/page/home_page.dart';
import 'package:your_task_flutter/persistent/dao/pref_instance.dart';

class ToDoDAO{

  ToDoDAO._(){

  }

  static final ToDoDAO _singleton = ToDoDAO._();

  factory ToDoDAO()=>_singleton;

  // final StreamController ToDoVO? _todoStream = StreamController<List<ToDoVO>?>();

  // Stream ToDoVO? getTodoStream() => _todoStream.stream;

  // void saveToList(List<ToDoVO>  toDoList){
  //   List<String>encodeList = toDoList.map((e) => jsonEncode(e.toJson())).toList();
  //   PrefInstance.getSharePreferences.setStringList(kFormatSelectDate,encodeList);
  //   _todoStream.sink.add(toDoList);
  // }

  void saveTask(ToDoVO task){
    var uuid = Uuid();
    String key = uuid.v4();
    PrefInstance.getSharePreferences.setString(key, jsonEncode(task));
  }

  ToDoVO  getTask(String key){
   final data= PrefInstance.getSharePreferences.getString(key);
    // if(data!= null){
      return ToDoVO.fromJson(jsonDecode(data.toString()));
    }
   


  List<ToDoVO>? get getTaskList{
    List<ToDoVO>? getList = [];
    final List keys =PrefInstance.getSharePreferences.getKeys().toList();
    for (String key in keys){
      getList.add(getTask(key));
    }
    return getList;
  }
  // List<ToDoVO> ? getFromList(){
  //   List<String>? encodeList = PrefInstance.getSharePreferences.getStringList(kFormatDate);
  //   if(encodeList != null){
  //     List<ToDoVO>list =encodeList.map((e) => ToDoVO.fromJson(jsonDecode(e))).toList();
  //     return list;
  // }else{
  //   return [];
  // }
  

  // void closeStream()=>_todoStream.close();
}