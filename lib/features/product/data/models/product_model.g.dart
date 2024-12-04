// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ProductModelAdapter extends TypeAdapter<ProductModel> {
  @override
  final int typeId = 0;

  @override
  ProductModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ProductModel(
      name: fields[0] as String,
      description: fields[1] as String,
      mainImage: fields[2] as String,
      secondaryImages: (fields[3] as List).cast<String>(),
      mainCategory: fields[4] as CategoryModel,
      secondaryCategory: fields[5] as CategoryModel,
      price: fields[6] as String,
      addons: (fields[7] as List).cast<AddonModel>(),
      availableColors: (fields[8] as List).cast<ColorModel>(),
      sizes: (fields[9] as List).cast<SizeModel>(),
      status: (fields[10] as List).cast<StatusModel>(),
      keywords: (fields[11] as List).cast<String>(),
    );
  }

  @override
  void write(BinaryWriter writer, ProductModel obj) {
    writer
      ..writeByte(12)
      ..writeByte(0)
      ..write(obj.name)
      ..writeByte(1)
      ..write(obj.description)
      ..writeByte(2)
      ..write(obj.mainImage)
      ..writeByte(3)
      ..write(obj.secondaryImages)
      ..writeByte(4)
      ..write(obj.mainCategory)
      ..writeByte(5)
      ..write(obj.secondaryCategory)
      ..writeByte(6)
      ..write(obj.price)
      ..writeByte(7)
      ..write(obj.addons)
      ..writeByte(8)
      ..write(obj.availableColors)
      ..writeByte(9)
      ..write(obj.sizes)
      ..writeByte(10)
      ..write(obj.status)
      ..writeByte(11)
      ..write(obj.keywords);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ProductModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
