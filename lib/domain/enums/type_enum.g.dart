// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'type_enum.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class TypeEnumAdapter extends TypeAdapter<TypeEnum> {
  @override
  final int typeId = 4;

  @override
  TypeEnum read(BinaryReader reader) {
    switch (reader.readByte()) {
      case 0:
        return TypeEnum.wakeTime;
      case 1:
        return TypeEnum.bedTime;
      default:
        return TypeEnum.wakeTime;
    }
  }

  @override
  void write(BinaryWriter writer, TypeEnum obj) {
    switch (obj) {
      case TypeEnum.wakeTime:
        writer.writeByte(0);
        break;
      case TypeEnum.bedTime:
        writer.writeByte(1);
        break;
    }
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TypeEnumAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
