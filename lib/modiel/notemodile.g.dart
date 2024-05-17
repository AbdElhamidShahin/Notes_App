// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notemodile.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class NotemodileAdapter extends TypeAdapter<Notemodile> {
  @override
  final int typeId = 0;

  @override
  Notemodile read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Notemodile(
      title: fields[0] as String,
      suptitle: fields[1] as String,
      data: fields[2] as String,
      color: fields[3] as int,
    );
  }

  @override
  void write(BinaryWriter writer, Notemodile obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.title)
      ..writeByte(1)
      ..write(obj.suptitle)
      ..writeByte(2)
      ..write(obj.data)
      ..writeByte(3)
      ..write(obj.color);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is NotemodileAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
