import 'package:equatable/equatable.dart';
import 'package:fudex_test/features/category/domain/entities/addon.dart';
import 'package:hive_flutter/hive_flutter.dart';

part '../../../category/data/models/addon_model.g.dart';

@HiveType(typeId: 1)
class AddonModel extends Equatable {
  @HiveField(0)
  final int id;
  @HiveField(1)
  final String nameAr;
  @HiveField(2)
  final String nameEn;

  const AddonModel(
      {required this.id, required this.nameAr, required this.nameEn});

  factory AddonModel.fromJson(Map<String, dynamic> json) => AddonModel(
        id: json['id'] as int,
        nameAr: json['name_ar'] as String,
        nameEn: json['name_en'] as String,
      );

  @override
  List<Object?> get props => [id, nameAr, nameEn];
}

extension AddonModelX on AddonModel {
  Addon toDomain() => Addon(id: id, nameAr: nameAr, nameEn: nameEn);
}
