// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../../../category/data/models/addon_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class AddonModelAdapter extends TypeAdapter<AddonModel> {
  @override
  final int typeId = 1;

  @override
  AddonModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return AddonModel(
      id: fields[0] as int,
      nameAr: fields[1] as String,
      nameEn: fields[2] as String,
    );
  }

  @override
  void write(BinaryWriter writer, AddonModel obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.nameAr)
      ..writeByte(2)
      ..write(obj.nameEn);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AddonModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
