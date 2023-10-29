// ignore_for_file: public_member_api_docs, sort_constructors_first


import 'package:hive/hive.dart';

import 'package:your_task_flutter/persistent/hive_constant.dart';

part 'todo_vo.g.dart';

@HiveType(typeId: kTypeIDForToDoVO)
class ToDoVO {
  @HiveField(0)
  String taskName;
  @HiveField(1)
  String description;
  @HiveField(2)
  String date;
  @HiveField(3)
  String time;
  @HiveField(4)
  bool isImportant;

  ToDoVO(this.taskName,this.description,this.date,this.time,this.isImportant);

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'taskName': taskName,
      'description': description,
      'date': date,
      'time': time,
      'isImportant': isImportant,
    };
  }

  factory ToDoVO.fromJson(Map<String, dynamic> json) {
    return ToDoVO(
      json['taskName'] as String,
      json['description'] as String,
      json['date'] as String,
      json['time'] as String,
      json['isImportant'] as bool,
    );

    
  }

 

  

  @override
  String toString() {
    return 'ToDoVO(taskName: $taskName, description: $description, date: $date, time: $time, isImportant: $isImportant)';
  }
}
