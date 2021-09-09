// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'person.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class HairColorAdapter extends TypeAdapter<HairColor> {
  @override
  final int typeId = 2;

  @override
  HairColor read(BinaryReader reader) {
    switch (reader.readByte()) {
      case 0:
        return HairColor.brown;
      case 1:
        return HairColor.blond;
      case 2:
        return HairColor.black;
      default:
        return HairColor.brown;
    }
  }

  @override
  void write(BinaryWriter writer, HairColor obj) {
    switch (obj) {
      case HairColor.brown:
        writer.writeByte(0);
        break;
      case HairColor.blond:
        writer.writeByte(1);
        break;
      case HairColor.black:
        writer.writeByte(2);
        break;
    }
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is HairColorAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class PersonAdapter extends TypeAdapter<Person> {
  @override
  final int typeId = 1;

  @override
  Person read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Person(
      name: fields[0] as String,
      age: fields[1] as int,
      pets: (fields[2] as List).cast<Pet>(),
      hairColor: fields[3] as HairColor,
    );
  }

  @override
  void write(BinaryWriter writer, Person obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.name)
      ..writeByte(1)
      ..write(obj.age)
      ..writeByte(2)
      ..write(obj.pets)
      ..writeByte(3)
      ..write(obj.hairColor);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PersonAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
