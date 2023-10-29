// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'todo_vo.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ToDoVOAdapter extends TypeAdapter<ToDoVO> {
  @override
  final int typeId = 1;

  @override
  ToDoVO read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ToDoVO(
      fields[0] as String,
      fields[1] as String,
      fields[2] as String,
      fields[3] as String,
      fields[4] as bool,
    );
  }

  @override
  void write(BinaryWriter writer, ToDoVO obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.taskName)
      ..writeByte(1)
      ..write(obj.description)
      ..writeByte(2)
      ..write(obj.date)
      ..writeByte(3)
      ..write(obj.time)
      ..writeByte(4)
      ..write(obj.isImportant);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ToDoVOAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
