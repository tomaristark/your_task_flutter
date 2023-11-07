
import 'dart:convert';
import 'package:uuid/uuid.dart';
import 'package:your_task_flutter/data/vo/todo_vo.dart';
import 'package:your_task_flutter/persistent/dao/pref_instance.dart';

class ToDoDAO {
  ToDoDAO._() {}

  static final ToDoDAO _singleton = ToDoDAO._();

  factory ToDoDAO() => _singleton;


  void saveTask(ToDoVO task) {
    var uuid = Uuid();
    String key = uuid.v4();
    PrefInstance.getSharePreferences.setString(key, jsonEncode(task));
  }

  ToDoVO _getTask(String key) {
    final data = PrefInstance.getSharePreferences.getString(key);
    return ToDoVO.fromJson(jsonDecode(data.toString()));
  }

  List<ToDoVO>? get getTaskList {
    List<ToDoVO>? getList = [];
    final List keys = PrefInstance.getSharePreferences.getKeys().toList();
    for (String key in keys) {
      getList.add(_getTask(key));
    }
    return getList;
  }

  void deleteTask(int index) {
    final List keys = PrefInstance.getSharePreferences.getKeys().toList();
    for (int i = 0; i < keys.length; i++) {
      if (i == index) {
        PrefInstance.getSharePreferences.remove(keys[index]);
      }
    }
  }
}
