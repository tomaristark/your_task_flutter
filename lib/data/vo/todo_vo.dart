

// List<ToDoVO>toDoVOListFromJson(String str)=>List<ToDoVO>.from(json.decode(str).map((x)=>ToDoVO.fromJson(x)));

// String toDoVOListToJson(List<ToDoVO> data)=>json.encode(List<ToDoVO>.from(data.map((e) => e.toJson())));


class ToDoVO {
  String taskName;
  String description;
  String date;
  String time;
  bool isImportant;


ToDoVO(this.taskName,this.description,this.date,this.time,this.isImportant,);
  
factory ToDoVO.fromJson(Map<String,dynamic>json)=>
  ToDoVO(json['taskName'] as String, 
  json['description'] as String, 
  json['date'] as String,
   json['time'] as String, 
   json['isImportant'] as bool);

 Map<String,dynamic> toJson() => <String,dynamic>{
  'taskName':taskName,
  'description':description,
  'date':date,
  'time':time,
  'isImportant':isImportant,
 };

  @override
  String toString() {
    return 'ToDoVO(taskName: $taskName, description: $description, date: $date, time: $time, isImportant: $isImportant)';
  }
}
