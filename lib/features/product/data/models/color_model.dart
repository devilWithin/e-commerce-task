import 'package:equatable/equatable.dart';
import 'package:fudex_test/features/product/domain/entites/color_entity.dart';
import 'package:hive/hive.dart';

@HiveType(typeId: 5)
class ColorModel extends Equatable {
  @HiveField(0)
  final int id;
  @HiveField(1)
  final int hex;

  const ColorModel({required this.id, required this.hex});

  Map<String, dynamic> toJson() => {
        'id': id,
        'hex': hex,
      };

  factory ColorModel.fromJson(Map<String, dynamic> json) => ColorModel(
        id: json['id'] as int,
        hex: json['hex'] as int,
      );

  @override
  List<Object?> get props => [id, hex];
}

extension ColorModelX on ColorModel {
  ColorEntity toDomain() => ColorEntity(id: id, hex: hex);
}
