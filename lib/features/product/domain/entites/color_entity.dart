import 'package:equatable/equatable.dart';
import 'package:fudex_test/features/product/data/models/color_model.dart';

class ColorEntity extends Equatable {
  final int id;
  final int hex;

  const ColorEntity({required this.id, required this.hex});

  @override
  List<Object?> get props => [id, hex];
}

extension ColorEntityX on ColorEntity {
  ColorModel toData() => ColorModel(id: id, hex: hex);
}
