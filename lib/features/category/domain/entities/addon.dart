import 'package:equatable/equatable.dart';
import 'package:fudex_test/features/category/data/models/addon_model.dart';

class Addon extends Equatable {
  final int id;
  final String nameAr;
  final String nameEn;

  const Addon({required this.id, required this.nameAr, required this.nameEn});

  @override
  List<Object?> get props => [id, nameAr, nameEn];
}

extension AddonX on Addon {
  AddonModel toData() => AddonModel(id: id, nameAr: nameAr, nameEn: nameEn);
}
